import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/features/dashboard/bloc/ads_bloc.dart';
import 'package:ado_dad_admin/features/dashboard/bloc/ads_event.dart';
import 'package:ado_dad_admin/features/dashboard/bloc/ads_state.dart';
import 'package:ado_dad_admin/models/ad_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

/// Detailed read-only view of a single advertisement with approve / reject
/// actions. Opened from the Advertisements list via `/view-advertisement`.
class AdDetailView extends StatefulWidget {
  final AdModel ad;
  const AdDetailView({super.key, required this.ad});

  @override
  State<AdDetailView> createState() => _AdDetailViewState();
}

class _AdDetailViewState extends State<AdDetailView> {
  static const Color _amberText = Color(0xFF92400E);

  late AdModel _ad;
  int _selectedImage = 0;

  @override
  void initState() {
    super.initState();
    _ad = widget.ad;
  }

  bool get _isPending => !_ad.isApproved && !_ad.soldOut;

  // ---------------------------------------------------------------------------
  // Build
  // ---------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return BlocListener<AdsBloc, AdsState>(
      listener: (context, state) {
        state.whenOrNull(
          approvalSuccess: (message, updatedAd) {
            if (updatedAd.id == _ad.id) {
              setState(() => _ad = updatedAd);
            }
            if (ModalRoute.of(context)?.isCurrent == false) return;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: AppColors.success,
                duration: const Duration(seconds: 2),
              ),
            );
          },
          approvalError: (message, adId) {
            if (adId != _ad.id) return;
            if (ModalRoute.of(context)?.isCurrent == false) return;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: AppColors.danger,
                duration: const Duration(seconds: 3),
              ),
            );
          },
        );
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(),
            if (_isPending) ...[
              const SizedBox(height: 12),
              _pendingBanner(),
            ],
            const SizedBox(height: 16),
            LayoutBuilder(builder: (context, c) {
              final bool wide = c.maxWidth >= 980;
              if (!wide) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _gallery(),
                    const SizedBox(height: 12),
                    _overviewCard(),
                    const SizedBox(height: 12),
                    _descriptionCard(),
                    const SizedBox(height: 12),
                    ..._detailCards(),
                    _sellerCard(),
                    const SizedBox(height: 12),
                    _metaCard(),
                  ],
                );
              }
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left column — gallery + descriptive content
                  Expanded(
                    flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _gallery(),
                        const SizedBox(height: 12),
                        _descriptionCard(),
                        const SizedBox(height: 12),
                        ..._detailCards(),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Right column — summary + seller + meta
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _overviewCard(),
                        const SizedBox(height: 12),
                        _sellerCard(),
                        const SizedBox(height: 12),
                        _metaCard(),
                      ],
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Header (breadcrumb + actions)
  // ---------------------------------------------------------------------------
  Widget _header() {
    return BlocBuilder<AdsBloc, AdsState>(
      builder: (context, state) {
        final bool isLoading = _isApprovalLoading(state);
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
              onPressed: () => context.pop(),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Advertisements / ${_title()}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.inter(
                          fontSize: 12, color: AppColors.textMuted)),
                  const SizedBox(height: 2),
                  Text("Advertisement detail",
                      style: GoogleFonts.inter(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary)),
                ],
              ),
            ),
            if (!_ad.soldOut) ...[
              OutlinedButton.icon(
                onPressed: isLoading ? null : () => _updateApproval(false),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.danger,
                  side: const BorderSide(color: AppColors.danger),
                ),
                icon: const Icon(Icons.close, size: 17),
                label: const Text("Reject"),
              ),
              const SizedBox(width: 8),
              ElevatedButton.icon(
                onPressed: (isLoading || _ad.isApproved)
                    ? null
                    : () => _updateApproval(true),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.success,
                  foregroundColor: Colors.white,
                ),
                icon: isLoading
                    ? const SizedBox(
                        width: 15,
                        height: 15,
                        child: CircularProgressIndicator(
                            strokeWidth: 2, color: Colors.white))
                    : const Icon(Icons.check, size: 17),
                label: Text(_ad.isApproved ? "Approved" : "Approve"),
              ),
            ],
          ],
        );
      },
    );
  }

  bool _isApprovalLoading(AdsState state) {
    return state.maybeWhen(
      approvalLoading: (adId) => adId == _ad.id,
      orElse: () => false,
    );
  }

  void _updateApproval(bool isApproved) {
    context.read<AdsBloc>().add(
          AdsEvent.updateAdApproval(adId: _ad.id, isApproved: isApproved),
        );
  }

  // ---------------------------------------------------------------------------
  // Pending review banner
  // ---------------------------------------------------------------------------
  Widget _pendingBanner() {
    return BlocBuilder<AdsBloc, AdsState>(
      builder: (context, state) {
        final bool isLoading = _isApprovalLoading(state);
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.warningSoft,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFFFCD34D)),
          ),
          child: Row(
            children: [
              const Icon(Icons.warning_amber_rounded,
                  size: 20, color: _amberText),
              const SizedBox(width: 10),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.inter(
                        fontSize: 13, color: _amberText),
                    children: [
                      TextSpan(
                          text: "Pending review",
                          style:
                              GoogleFonts.inter(fontWeight: FontWeight.w700)),
                      const TextSpan(
                          text: " — this ad is awaiting moderation."),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              _bannerButton(
                label: "Approve",
                filled: true,
                disabled: isLoading,
                onTap: () => _updateApproval(true),
              ),
              const SizedBox(width: 8),
              _bannerButton(
                label: "Reject",
                filled: false,
                disabled: isLoading,
                onTap: () => _updateApproval(false),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _bannerButton({
    required String label,
    required bool filled,
    required bool disabled,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: disabled ? null : onTap,
      borderRadius: BorderRadius.circular(7),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: filled
              ? (disabled ? AppColors.surfaceAlt : AppColors.success)
              : Colors.transparent,
          border: filled
              ? null
              : Border.all(
                  color: disabled ? AppColors.textMuted : AppColors.danger),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: filled
                ? (disabled ? AppColors.textSecondary : Colors.white)
                : (disabled ? AppColors.textMuted : AppColors.danger),
          ),
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Image gallery
  // ---------------------------------------------------------------------------
  Widget _gallery() {
    final images = _ad.images.where((e) => e.isNotEmpty).toList();
    if (_selectedImage >= images.length) _selectedImage = 0;

    return Container(
      decoration: _cardDecoration(),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  color: AppColors.surfaceAlt,
                  child: images.isEmpty
                      ? const Center(
                          child: Icon(Icons.image_outlined,
                              size: 56, color: AppColors.textMuted))
                      : Image.network(
                          images[_selectedImage],
                          fit: BoxFit.contain,
                          errorBuilder: (_, __, ___) => const Center(
                              child: Icon(Icons.broken_image_outlined,
                                  size: 56, color: AppColors.textMuted)),
                          loadingBuilder: (context, child, progress) =>
                              progress == null
                                  ? child
                                  : const Center(
                                      child: CircularProgressIndicator()),
                        ),
                ),
                if (images.length > 1) ...[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: _galleryArrow(
                      icon: Icons.chevron_left,
                      onTap: () => setState(() => _selectedImage =
                          (_selectedImage - 1 + images.length) %
                              images.length),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: _galleryArrow(
                      icon: Icons.chevron_right,
                      onTap: () => setState(() =>
                          _selectedImage = (_selectedImage + 1) % images.length),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 9, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.55),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        "${_selectedImage + 1} / ${images.length}",
                        style: GoogleFonts.inter(
                            fontSize: 11.5,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (images.length > 1)
            Container(
              height: 76,
              padding: const EdgeInsets.all(10),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, i) {
                  final bool selected = i == _selectedImage;
                  return InkWell(
                    onTap: () => setState(() => _selectedImage = i),
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      width: 76,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: selected ? AppColors.accent : AppColors.border,
                          width: selected ? 2 : 1,
                        ),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.network(
                        images[i],
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const Icon(
                            Icons.broken_image_outlined,
                            size: 18,
                            color: AppColors.textMuted),
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget _galleryArrow({required IconData icon, required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Material(
        color: Colors.black.withValues(alpha: 0.35),
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Icon(icon, size: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Overview (price, chips, quick facts)
  // ---------------------------------------------------------------------------
  Widget _overviewCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(_title(),
              style: GoogleFonts.inter(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary)),
          const SizedBox(height: 8),
          Text(_formatPrice(_ad.price),
              style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.accent)),
          const SizedBox(height: 12),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              _chip(_formatCategory(_ad.category), AppColors.accentSoft,
                  AppColors.accent),
              if (_ad.soldOut)
                _chip('Sold out', AppColors.surfaceAlt, AppColors.textSecondary)
              else
                _chip('Active', AppColors.successSoft, AppColors.success),
              if (_ad.isApproved)
                _chip('Approved', AppColors.successSoft, AppColors.success)
              else
                _chip('Pending', AppColors.warningSoft, _amberText),
            ],
          ),
          const SizedBox(height: 14),
          const Divider(height: 1, color: AppColors.border),
          const SizedBox(height: 14),
          _iconFact(Icons.location_on_outlined,
              _ad.location.isEmpty ? '—' : _ad.location),
          const SizedBox(height: 10),
          _iconFact(Icons.calendar_today_outlined,
              "Posted ${_formatDate(_ad.postedAt)}"),
          const SizedBox(height: 10),
          _iconFact(
              Icons.update_outlined, "Updated ${_formatDate(_ad.updatedAt)}"),
          if (_ad.year != null) ...[
            const SizedBox(height: 10),
            _iconFact(Icons.event_outlined, "Year ${_ad.year}"),
          ],
        ],
      ),
    );
  }

  Widget _iconFact(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppColors.textSecondary),
        const SizedBox(width: 8),
        Expanded(
          child: Text(text,
              style: GoogleFonts.inter(
                  fontSize: 13, color: AppColors.textSecondary)),
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // Description
  // ---------------------------------------------------------------------------
  Widget _descriptionCard() {
    return _sectionCard(
      title: "Description",
      child: Text(
        _ad.description.isEmpty ? 'No description provided.' : _ad.description,
        style: GoogleFonts.inter(
            fontSize: 13.5, height: 1.6, color: AppColors.textSecondary),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Category-specific detail cards
  // ---------------------------------------------------------------------------
  List<Widget> _detailCards() {
    final cards = <Widget>[];

    final vd = _ad.vehicleDetails;
    if (vd != null) {
      cards
        ..add(_sectionCard(
          title: "Vehicle details",
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _specTiles([
                (
                  Icons.event_outlined,
                  'Year',
                  vd.year > 0 ? vd.year.toString() : '—'
                ),
                (
                  Icons.speed_outlined,
                  'Mileage',
                  vd.mileage > 0 ? '${vd.mileage} km' : '—'
                ),
                (
                  Icons.local_gas_station_outlined,
                  'Fuel',
                  _dash(vd.fuelType.displayName)
                ),
                (
                  Icons.settings_outlined,
                  'Transmission',
                  _dash(vd.transmissionType.displayName)
                ),
                (Icons.palette_outlined, 'Color', _dash(vd.color)),
                (
                  Icons.person_outline,
                  'Owner',
                  vd.isFirstOwner ? 'First' : 'Resale'
                ),
              ]),
              const SizedBox(height: 16),
              _kvGrid([
                ['Manufacturer', _dash(vd.manufacturer.displayName)],
                ['Model', _dash(vd.model.displayName)],
                ['Variant', _dash(vd.variant.displayName)],
                ['Vehicle type', _dash(_formatCategory(vd.vehicleType))],
                ['Insurance', vd.hasInsurance ? 'Yes' : 'No'],
                ['RC book', vd.hasRcBook ? 'Yes' : 'No'],
                if (vd.additionalFeatures.isNotEmpty)
                  [
                    'Additional features',
                    vd.additionalFeatures.map((e) => e.toString()).join(', ')
                  ],
              ]),
            ],
          ),
        ))
        ..add(const SizedBox(height: 12));

      final engine = vd.variant.engineSpecs;
      final perf = vd.variant.performanceSpecs;
      final specItems = <List<String>>[
        if (engine.capacity > 0) ['Engine capacity', '${engine.capacity} cc'],
        if (engine.maxPower > 0) ['Max power', '${engine.maxPower} bhp'],
        if (engine.maxTorque > 0) ['Max torque', '${engine.maxTorque} Nm'],
        if (engine.cylinders > 0) ['Cylinders', engine.cylinders.toString()],
        if (engine.capacity > 0)
          ['Turbocharged', engine.turbocharged ? 'Yes' : 'No'],
        if (perf.mileage > 0) ['Mileage (claimed)', '${perf.mileage} km/l'],
        if (perf.topSpeed > 0) ['Top speed', '${perf.topSpeed} km/h'],
        if (perf.acceleration > 0) ['0–100 km/h', '${perf.acceleration} s'],
        if (perf.fuelCapacity > 0) ['Fuel capacity', '${perf.fuelCapacity} L'],
        if (vd.variant.seatingCapacity > 0)
          ['Seating capacity', vd.variant.seatingCapacity.toString()],
      ];
      if (specItems.isNotEmpty) {
        cards
          ..add(_sectionCard(title: "Specifications", child: _kvGrid(specItems)))
          ..add(const SizedBox(height: 12));
      }
    }

    final cvd = _ad.commercialVehicleDetails;
    if (cvd != null && cvd.isNotEmpty) {
      cards
        ..add(_sectionCard(
          title: "Commercial vehicle details",
          child: _kvGrid(_mapToItems(cvd)),
        ))
        ..add(const SizedBox(height: 12));
    }

    if (_ad.propertyDetails.isNotEmpty) {
      final first = _ad.propertyDetails.first;
      cards
        ..add(_sectionCard(
          title: "Property details",
          child: first is Map
              ? _kvGrid(_mapToItems(Map<String, dynamic>.from(first)))
              : Text(_ad.propertyDetails.map((e) => e.toString()).join(', '),
                  style: GoogleFonts.inter(
                      fontSize: 13.5, color: AppColors.textSecondary)),
        ))
        ..add(const SizedBox(height: 12));
    }

    return cards;
  }

  /// Icon tile grid for headline vehicle facts.
  Widget _specTiles(List<(IconData, String, String)> tiles) {
    return LayoutBuilder(builder: (context, c) {
      final cols = c.maxWidth >= 560 ? 3 : 2;
      const gap = 8.0;
      final w = ((c.maxWidth - gap * (cols - 1)) / cols) - 0.5;
      return Wrap(
        spacing: gap,
        runSpacing: gap,
        children: tiles.map((t) {
          return Container(
            width: w,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.surfaceAlt,
              borderRadius: BorderRadius.circular(9),
            ),
            child: Row(
              children: [
                Icon(t.$1, size: 18, color: AppColors.textSecondary),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(t.$2,
                          style: GoogleFonts.inter(
                              fontSize: 10.5, color: AppColors.textMuted)),
                      Text(t.$3,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.inter(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary)),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      );
    });
  }

  List<List<String>> _mapToItems(Map<String, dynamic> map) {
    return map.entries
        .where((e) => e.value != null && e.value is! Map && e.value is! List)
        .map((e) => [_labelize(e.key), e.value.toString()])
        .toList();
  }

  String _labelize(String key) {
    final spaced = key
        .replaceAllMapped(
            RegExp(r'([a-z0-9])([A-Z])'), (m) => '${m[1]} ${m[2]}')
        .replaceAll('_', ' ')
        .toLowerCase();
    return spaced.isEmpty ? key : spaced[0].toUpperCase() + spaced.substring(1);
  }

  // ---------------------------------------------------------------------------
  // Seller
  // ---------------------------------------------------------------------------
  Widget _sellerCard() {
    final user = _ad.user;
    final bool hasPic = user.profilePic.isNotEmpty &&
        user.profilePic != 'default-profile-pic-url';
    return _sectionCard(
      title: "Seller",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: AppColors.accentSoft,
                backgroundImage: hasPic ? NetworkImage(user.profilePic) : null,
                child: hasPic
                    ? null
                    : Text(_initials(user.name),
                        style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.accent)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user.name.isEmpty ? 'Unknown user' : user.name,
                        style: GoogleFonts.inter(
                            fontSize: 14.5,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary)),
                    if (user.email.isNotEmpty)
                      Text(user.email,
                          style: GoogleFonts.inter(
                              fontSize: 12.5, color: AppColors.textSecondary)),
                    if (user.phone.isNotEmpty)
                      Text(user.phone,
                          style: GoogleFonts.inter(
                              fontSize: 12.5, color: AppColors.textSecondary)),
                  ],
                ),
              ),
            ],
          ),
          if (user.id.isNotEmpty) ...[
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => context.push('/advertisements',
                    extra: {'userId': user.id, 'userName': user.name}),
                icon: const Icon(Icons.list_alt_outlined, size: 16),
                label: const Text("View seller's ads"),
              ),
            ),
          ],
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Meta / moderation info
  // ---------------------------------------------------------------------------
  Widget _metaCard() {
    final approver = _ad.approvedByUser;
    return _sectionCard(
      title: "Listing information",
      child: _kvGrid([
        ['Ad ID', _ad.id],
        ['Status', _dash(_labelize(_ad.status))],
        ['Approval', _ad.isApproved ? 'Approved' : 'Pending'],
        if (approver != null && approver.name.isNotEmpty)
          ['Approved by', approver.name],
        ['Posted on', _formatDateTime(_ad.postedAt)],
        ['Last updated', _formatDateTime(_ad.updatedAt)],
      ], columnsAt: 380),
    );
  }

  // ---------------------------------------------------------------------------
  // Shared building blocks
  // ---------------------------------------------------------------------------
  Widget _sectionCard({required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600)),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }

  Widget _kvGrid(List<List<String>> items, {double columnsAt = 520}) {
    return LayoutBuilder(builder: (context, c) {
      final bool two = c.maxWidth >= columnsAt;
      if (!two) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: items
              .map((it) => Padding(
                  padding: const EdgeInsets.only(bottom: 12), child: _kv(it)))
              .toList(),
        );
      }
      return Wrap(
        spacing: 24,
        runSpacing: 14,
        children: items
            .map((it) => SizedBox(width: (c.maxWidth - 24) / 2, child: _kv(it)))
            .toList(),
      );
    });
  }

  Widget _kv(List<String> it) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(it[0],
            style:
                GoogleFonts.inter(fontSize: 11.5, color: AppColors.textMuted)),
        const SizedBox(height: 2),
        Text(it[1].isEmpty ? '—' : it[1],
            style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary)),
      ],
    );
  }

  Widget _chip(String text, Color bg, Color fg) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
        decoration:
            BoxDecoration(color: bg, borderRadius: BorderRadius.circular(6)),
        child: Text(text,
            style: GoogleFonts.inter(
                fontSize: 11, fontWeight: FontWeight.w600, color: fg)),
      );

  BoxDecoration _cardDecoration() => BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      );

  // ---------------------------------------------------------------------------
  // Formatting helpers
  // ---------------------------------------------------------------------------
  String _title() {
    final vd = _ad.vehicleDetails;
    if (vd != null) {
      final manufacturer = vd.manufacturer.displayName;
      final model = vd.model.displayName;
      if (manufacturer.isNotEmpty || model.isNotEmpty) {
        final year = vd.year > 0 ? ' (${vd.year})' : '';
        return '$manufacturer $model$year'.trim();
      }
    }
    if (_ad.title.isNotEmpty) return _ad.title;
    if (_ad.description.isNotEmpty) return _ad.description;
    return 'Untitled ad';
  }

  String _dash(String v) => v.isEmpty ? '—' : v;

  String _formatPrice(int price) =>
      '₹${NumberFormat.decimalPattern('en_IN').format(price)}';

  String _formatDate(DateTime date) => DateFormat('dd MMM yyyy').format(date);

  String _formatDateTime(DateTime date) =>
      DateFormat('dd MMM yyyy, hh:mm a').format(date);

  String _formatCategory(String category) {
    switch (category) {
      case 'two_wheeler':
        return 'Two Wheeler';
      case 'four_wheeler':
        return 'Four Wheeler';
      case 'commercial_vehicle':
        return 'Commercial Vehicle';
      case 'private_vehicle':
        return 'Private Vehicle';
      case 'property':
        return 'Property';
      default:
        return category
            .replaceAll('_', ' ')
            .split(' ')
            .map((w) => w.isNotEmpty
                ? w[0].toUpperCase() + w.substring(1).toLowerCase()
                : '')
            .join(' ');
    }
  }

  String _initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.length > 1 && parts[0].isNotEmpty && parts[1].isNotEmpty) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return parts.isNotEmpty && parts[0].isNotEmpty
        ? parts[0][0].toUpperCase()
        : 'U';
  }
}
