import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/features/users/bloc/user_ads_bloc.dart';
import 'package:ado_dad_admin/features/users/bloc/user_ads_event.dart';
import 'package:ado_dad_admin/features/users/bloc/user_ads_state.dart';
import 'package:ado_dad_admin/features/widgets/list_page.dart';
import 'package:ado_dad_admin/models/ad_model.dart';
import 'package:ado_dad_admin/models/user_model.dart';
import 'package:ado_dad_admin/repositories/moderation_rep.dart';
import 'package:ado_dad_admin/models/moderation/moderation_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class UserView extends StatefulWidget {
  final UserModel user;
  const UserView({super.key, required this.user});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  final ModerationRepository _modRepo = ModerationRepository();
  final ScrollController _hController = ScrollController();
  ModerationProfile? _profile;
  int _itemsPerPage = 10;

  UserModel get _user => widget.user;

  @override
  void initState() {
    super.initState();
    context.read<UserAdsBloc>().add(
          UserAdsEvent.fetchUserAds(
              userId: _user.id, page: 1, limit: _itemsPerPage),
        );
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    try {
      final p = await _modRepo.getProfile(_user.id);
      if (mounted) setState(() => _profile = p);
    } catch (_) {
      // moderation data is best-effort
    }
  }

  @override
  void dispose() {
    _hController.dispose();
    super.dispose();
  }

  void _fetchPage(int page) {
    context.read<UserAdsBloc>().add(
          UserAdsEvent.fetchUserAds(
              userId: _user.id, page: page, limit: _itemsPerPage),
        );
  }

  void _openFilteredAds() {
    context.push('/advertisements',
        extra: {'userId': _user.id, 'userName': _user.name});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _header(),
          const SizedBox(height: 16),
          _heroCard(),
          const SizedBox(height: 12),
          _statsRow(),
          const SizedBox(height: 12),
          _accountCard(),
          const SizedBox(height: 12),
          _adsSection(),
        ],
      ),
    );
  }

  // ----------------------------------------------------------------- Header
  Widget _header() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
            onPressed: () => context.pop()),
        const SizedBox(width: 4),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Users / ${_user.name}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.inter(
                      fontSize: 12, color: AppColors.textMuted)),
              const SizedBox(height: 2),
              Text("User detail",
                  style: GoogleFonts.inter(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary)),
            ],
          ),
        ),
        OutlinedButton.icon(
          onPressed: () => context.push('/edit-user', extra: _user),
          icon: const Icon(Icons.edit_outlined, size: 17),
          label: const Text("Edit"),
        ),
      ],
    );
  }

  // --------------------------------------------------------------- Hero card
  Widget _heroCard() {
    const double banner = 70;
    const double avatar = 80;
    const double overlap = 38;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: banner,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [AppColors.accent, AppColors.accentHover],
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: banner - overlap,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                      color: AppColors.surface, shape: BoxShape.circle),
                  child: _avatar(),
                ),
              ),
            ],
          ),
          const SizedBox(height: avatar - overlap + 8),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(_user.name,
                          style: GoogleFonts.inter(
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary)),
                    ),
                    Wrap(
                      spacing: 6,
                      children: [
                        _chip(_roleLabel(_user.userType), AppColors.accentSoft,
                            AppColors.accent),
                        _moderationChip(),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text("${_user.email} · ${_user.phoneNumber}",
                    style: GoogleFonts.inter(
                        fontSize: 13, color: AppColors.textSecondary)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _avatar() {
    final pic = _user.profilePic;
    final hasPic =
        pic != null && pic.isNotEmpty && pic != 'default-profile-pic-url';
    return CircleAvatar(
      radius: 40,
      backgroundColor: AppColors.accentSoft,
      backgroundImage: hasPic ? NetworkImage(pic) : null,
      child: hasPic
          ? null
          : Text(_initials(_user.name),
              style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.accent)),
    );
  }

  Widget _moderationChip() {
    final status = _profile?.user.moderationStatus ?? 'active';
    if (status == 'banned') {
      return _chip('Banned', AppColors.dangerSoft, const Color(0xFF991B1B));
    }
    if (status == 'suspended') {
      return _chip('Suspended', AppColors.dangerSoft, const Color(0xFF991B1B));
    }
    return _chip('Active', AppColors.successSoft, AppColors.success);
  }

  // -------------------------------------------------------------- Stats row
  Widget _statsRow() {
    return BlocBuilder<UserAdsBloc, UserAdsState>(
      builder: (context, state) {
        final totalAds = state.maybeWhen(
          loaded: (ads, total, _, __) => total.toString(),
          orElse: () => '—',
        );
        return LayoutBuilder(builder: (context, c) {
          final cols = c.maxWidth >= 720 ? 4 : (c.maxWidth >= 460 ? 2 : 1);
          const gap = 12.0;
          final w = ((c.maxWidth - gap * (cols - 1)) / cols) - 0.5;
          return Wrap(
            spacing: gap,
            runSpacing: gap,
            children: [
              SizedBox(
                  width: w,
                  child: _kpi(Icons.description_outlined, const Color(0xFFFCE7F3),
                      const Color(0xFFDB2777), totalAds, "Total ads")),
              SizedBox(
                  width: w,
                  child: _kpi(
                      Icons.check_circle_outline,
                      AppColors.successSoft,
                      AppColors.success,
                      _profile?.activeAds.toString() ?? '—',
                      "Active ads")),
              SizedBox(
                  width: w,
                  child: _kpi(
                      Icons.warning_amber_rounded,
                      AppColors.warningSoft,
                      const Color(0xFF92400E),
                      _profile?.strikeCount.toString() ?? '0',
                      "Strikes")),
              SizedBox(
                  width: w,
                  child: _kpi(
                      Icons.calendar_today_outlined,
                      const Color(0xFFE0E7FF),
                      const Color(0xFF4F46E5),
                      _user.createdAt != null
                          ? DateFormat('MMM yyyy').format(_user.createdAt!)
                          : '—',
                      "Member since")),
            ],
          );
        });
      },
    );
  }

  Widget _kpi(IconData icon, Color bg, Color fg, String value, String label) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 34,
            height: 34,
            decoration:
                BoxDecoration(color: bg, borderRadius: BorderRadius.circular(9)),
            child: Icon(icon, color: fg, size: 18),
          ),
          const SizedBox(height: 12),
          Text(value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary)),
          const SizedBox(height: 2),
          Text(label,
              style: GoogleFonts.inter(
                  fontSize: 12, color: AppColors.textSecondary)),
        ],
      ),
    );
  }

  // ------------------------------------------------------------ Account card
  Widget _accountCard() {
    final items = <List<String>>[
      ['Full name', _user.name],
      ['Email', _user.email],
      ['Phone', '${_user.countryCode ?? ''} ${_user.phoneNumber}'.trim()],
      ['Role', _roleLabel(_user.userType)],
      if (_user.countryCode != null && _user.countryCode!.isNotEmpty)
        ['Country code', _user.countryCode!],
      if (_user.createdAt != null)
        ['Joined', DateFormat('dd MMM yyyy').format(_user.createdAt!)],
    ];
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.border)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Account information",
              style: GoogleFonts.inter(
                  fontSize: 14, fontWeight: FontWeight.w600)),
          const SizedBox(height: 14),
          LayoutBuilder(builder: (context, c) {
            final two = c.maxWidth >= 520;
            final children = items.map(_kv).toList();
            if (!two) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children
                      .map((w) => Padding(
                          padding: const EdgeInsets.only(bottom: 12), child: w))
                      .toList());
            }
            return Wrap(
              spacing: 24,
              runSpacing: 14,
              children: items
                  .map((it) => SizedBox(
                      width: (c.maxWidth - 24) / 2, child: _kv(it)))
                  .toList(),
            );
          }),
        ],
      ),
    );
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

  // -------------------------------------------------------------- Ads section
  Widget _adsSection() {
    return Container(
      decoration: listCardDecoration(),
      clipBehavior: Clip.antiAlias,
      child: BlocBuilder<UserAdsBloc, UserAdsState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _adsHeader(state),
              const Divider(height: 1, color: AppColors.border),
              state.when(
                initial: () => _loader(),
                loading: () => _loader(),
                loaded: (ads, total, currentPage, totalPages) {
                  if (ads.isEmpty) return _emptyAds();
                  return Column(
                    children: [
                      FillWidthDataTable(
                        controller: _hController,
                        minWidth: 760,
                        showCheckboxColumn: false,
                        columns: [
                          listColumn('Image'),
                          listColumn('Title'),
                          listColumn('Category'),
                          listColumn('Price'),
                          listColumn('Status'),
                        ],
                        rows: ads.map((ad) => _adRow(ad)).toList(),
                      ),
                      ListPagination(
                        currentPage: currentPage,
                        totalPages: totalPages,
                        rowsPerPage: _itemsPerPage,
                        rowsPerPageOptions: const [10, 20],
                        onRowsPerPageChanged: (v) {
                          setState(() => _itemsPerPage = v);
                          _fetchPage(1);
                        },
                        onPageChanged: _fetchPage,
                      ),
                    ],
                  );
                },
                error: (message) => Padding(
                  padding: const EdgeInsets.all(40),
                  child: Center(
                      child: Text(message,
                          style:
                              GoogleFonts.inter(color: AppColors.danger))),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _adsHeader(UserAdsState state) {
    final total = state.maybeWhen(
        loaded: (ads, total, _, __) => total, orElse: () => null);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 14, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
              total != null ? "Advertisements ($total)" : "Advertisements",
              style: GoogleFonts.inter(
                  fontSize: 14, fontWeight: FontWeight.w600)),
          GestureDetector(
            onTap: _openFilteredAds,
            child: Row(
              children: [
                Text("View all in Advertisements",
                    style: GoogleFonts.inter(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w600,
                        color: AppColors.accent)),
                const SizedBox(width: 2),
                const Icon(Icons.north_east, size: 13, color: AppColors.accent),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _loader() => const Padding(
      padding: EdgeInsets.all(48),
      child: Center(child: CircularProgressIndicator()));

  Widget _emptyAds() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 20),
      child: Center(
        child: Column(
          children: [
            const Icon(Icons.inbox_outlined,
                size: 40, color: AppColors.textMuted),
            const SizedBox(height: 12),
            Text("No ads found for this user",
                style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary)),
            const SizedBox(height: 4),
            Text("This user hasn't posted any advertisements yet.",
                style: GoogleFonts.inter(
                    fontSize: 12, color: AppColors.textMuted)),
          ],
        ),
      ),
    );
  }

  DataRow _adRow(AdModel ad) {
    final cellStyle =
        GoogleFonts.inter(fontSize: 13, color: AppColors.textPrimary);
    return DataRow(
      onSelectChanged: (_) => _openFilteredAds(),
      cells: [
        DataCell(_adThumb(ad)),
        DataCell(SizedBox(
          width: 200,
          child: Text(_adTitle(ad),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: cellStyle.copyWith(fontWeight: FontWeight.w500)),
        )),
        DataCell(Text(_formatCategory(ad.category),
            style: GoogleFonts.inter(
                fontSize: 13, color: AppColors.textSecondary))),
        DataCell(Text('₹${ad.price}', style: cellStyle)),
        DataCell(_statusChip(ad)),
      ],
    );
  }

  Widget _adThumb(AdModel ad) {
    final url = ad.images.isNotEmpty ? ad.images.first : '';
    return Container(
      width: 48,
      height: 36,
      decoration: BoxDecoration(
          color: AppColors.surfaceAlt,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppColors.border)),
      clipBehavior: Clip.antiAlias,
      child: url.isEmpty
          ? const Icon(Icons.image_outlined, size: 16, color: AppColors.textMuted)
          : Image.network(url,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const Icon(
                  Icons.broken_image_outlined,
                  size: 16,
                  color: AppColors.textMuted)),
    );
  }

  Widget _statusChip(AdModel ad) {
    late String text;
    late Color bg;
    late Color fg;
    if (ad.soldOut) {
      text = 'Sold';
      bg = AppColors.surfaceAlt;
      fg = AppColors.textSecondary;
    } else if (ad.isApproved) {
      text = 'Active';
      bg = AppColors.successSoft;
      fg = AppColors.success;
    } else {
      text = 'Pending';
      bg = AppColors.warningSoft;
      fg = const Color(0xFF92400E);
    }
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
        decoration:
            BoxDecoration(color: bg, borderRadius: BorderRadius.circular(6)),
        child: Text(text,
            style: GoogleFonts.inter(
                fontSize: 11, fontWeight: FontWeight.w600, color: fg)),
      ),
    );
  }

  // -------------------------------------------------------------- Helpers
  Widget _chip(String text, Color bg, Color fg) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
        decoration:
            BoxDecoration(color: bg, borderRadius: BorderRadius.circular(6)),
        child: Text(text,
            style: GoogleFonts.inter(
                fontSize: 11, fontWeight: FontWeight.w600, color: fg)),
      );

  String _adTitle(AdModel ad) {
    if (ad.title.isNotEmpty) return ad.title;
    if (ad.description.isNotEmpty) return ad.description;
    return 'Untitled ad';
  }

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

  String _roleLabel(String? type) {
    switch (type) {
      case 'SA':
        return 'Super Admin';
      case 'AD':
        return 'Admin';
      case 'SR':
        return 'Showroom';
      case 'MO':
        return 'Moderator';
      case 'NU':
      default:
        return 'Normal user';
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
