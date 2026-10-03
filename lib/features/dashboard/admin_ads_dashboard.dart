import 'dart:async';

import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/common/data_storage.dart';
import 'package:ado_dad_admin/models/ad_model.dart';
import 'package:ado_dad_admin/features/dashboard/bloc/ads_bloc.dart';
import 'package:ado_dad_admin/features/dashboard/bloc/ads_event.dart';
import 'package:ado_dad_admin/features/dashboard/bloc/ads_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ado_dad_admin/common/save_pdf.dart';
import 'package:ado_dad_admin/common/pdf_generator.dart';

/// Status filter values for the toolbar segmented control.
enum _AdStatusFilter { all, pending, approved, sold }

class AdminAdsDashboard extends StatefulWidget {
  /// When set, the page opens pre-filtered to a single user's ads.
  final String? userId;
  final String? userName;

  const AdminAdsDashboard({super.key, this.userId, this.userName});

  @override
  State<AdminAdsDashboard> createState() => _AdminAdsDashboardState();
}

class _AdminAdsDashboardState extends State<AdminAdsDashboard> {
  final ScrollController _horizontalScrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  final Set<String> _selectedAdIds = <String>{};

  Timer? _searchDebounce;
  String? userType;
  String? _filterUserName;
  String? _searchQuery;
  String? _categoryFilter; // null = all categories
  _AdStatusFilter _statusFilter = _AdStatusFilter.all;
  int _limit = 10;

  static const Map<String, String> _categories = {
    'two_wheeler': 'Two Wheeler',
    'four_wheeler': 'Four Wheeler',
    'private_vehicle': 'Private Vehicle',
    'commercial_vehicle': 'Commercial Vehicle',
    'property': 'Property',
  };

  @override
  void initState() {
    super.initState();
    _loadUserType();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final bloc = context.read<AdsBloc>();
        bloc.userFilter = widget.userId;
        _filterUserName = widget.userName;
        bloc.add(const AdsEvent.fetchAllAds());
      }
    });
  }

  @override
  void dispose() {
    _horizontalScrollController.dispose();
    _searchController.dispose();
    _searchDebounce?.cancel();
    super.dispose();
  }

  Future<void> _loadUserType() async {
    final type = await getUserType();
    if (mounted) setState(() => userType = type);
  }

  // ---------------------------------------------------------------------------
  // Data helpers
  // ---------------------------------------------------------------------------
  void _fetch({int page = 1}) {
    context.read<AdsBloc>().add(AdsEvent.fetchAllAds(
          page: page,
          limit: _limit,
          searchQuery: _searchQuery,
        ));
  }

  void _onSearchChanged(String value) {
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 450), () {
      _searchQuery = value.trim().isEmpty ? null : value.trim();
      _fetch();
    });
  }

  void _clearUserFilter() {
    final bloc = context.read<AdsBloc>();
    bloc.userFilter = null;
    setState(() => _filterUserName = null);
    _fetch();
  }

  String _adStatus(AdModel ad) {
    if (ad.soldOut) return 'sold';
    if (ad.isApproved) return 'approved';
    return 'pending';
  }

  /// Client-side filters (category + status) applied to the loaded page,
  /// with pending ads surfaced first for faster moderation.
  List<AdModel> _visibleAds(List<AdModel> ads) {
    var list = ads.where((ad) {
      if (_categoryFilter != null && ad.category != _categoryFilter) {
        return false;
      }
      switch (_statusFilter) {
        case _AdStatusFilter.all:
          return true;
        case _AdStatusFilter.pending:
          return _adStatus(ad) == 'pending';
        case _AdStatusFilter.approved:
          return _adStatus(ad) == 'approved';
        case _AdStatusFilter.sold:
          return _adStatus(ad) == 'sold';
      }
    }).toList();

    int rank(AdModel ad) {
      switch (_adStatus(ad)) {
        case 'pending':
          return 0;
        case 'approved':
          return 1;
        default:
          return 2;
      }
    }

    list.sort((a, b) => rank(a).compareTo(rank(b)));
    return list;
  }

  void _openAdDetail(AdModel ad) {
    context.push('/view-advertisement', extra: ad);
  }

  // ---------------------------------------------------------------------------
  // Build
  // ---------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return BlocListener<AdsBloc, AdsState>(
      listener: (context, state) {
        // Only surface snackbars when this page is the visible route —
        // the ad detail page shares the same bloc and shows its own.
        if (ModalRoute.of(context)?.isCurrent == false) return;
        state.whenOrNull(
          approvalSuccess: (message, updatedAd) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: AppColors.success,
                duration: const Duration(seconds: 2),
              ),
            );
          },
          approvalError: (message, adId) {
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
            _buildHeaderSection(),
            const SizedBox(height: 16),
            _buildKpiRow(),
            const SizedBox(height: 16),
            Container(
              decoration: _cardDecoration(),
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  _buildToolbar(),
                  _buildAdsTable(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Header
  // ---------------------------------------------------------------------------
  Widget _buildHeaderSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Home / Advertisements",
                  style: GoogleFonts.inter(
                      fontSize: 12, color: AppColors.textMuted)),
              const SizedBox(height: 2),
              Text("Advertisements",
                  style: GoogleFonts.inter(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary)),
              const SizedBox(height: 2),
              Text("Review and approve user listings",
                  style: GoogleFonts.inter(
                      fontSize: 13, color: AppColors.textSecondary)),
              if (context.read<AdsBloc>().userFilter != null) ...[
                const SizedBox(height: 8),
                _userFilterChip(),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _userFilterChip() {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 4, top: 4, bottom: 4),
      decoration: BoxDecoration(
        color: AppColors.accentSoft,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.person_outline, size: 14, color: AppColors.accent),
          const SizedBox(width: 5),
          Text("Filtered by: ${_filterUserName ?? 'user'}",
              style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.accent)),
          const SizedBox(width: 2),
          InkWell(
            onTap: _clearUserFilter,
            borderRadius: BorderRadius.circular(20),
            child: const Padding(
              padding: EdgeInsets.all(3),
              child: Icon(Icons.close, size: 14, color: AppColors.accent),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // KPI cards
  // ---------------------------------------------------------------------------
  Widget _buildKpiRow() {
    return BlocBuilder<AdsBloc, AdsState>(
      buildWhen: (prev, curr) =>
          curr.maybeWhen(loaded: (_, __, ___, ____) => true, orElse: () => false),
      builder: (context, state) {
        final loaded = state.whenOrNull(
            loaded: (ads, total, page, limit) => (ads: ads, total: total));
        final ads = loaded?.ads ?? const <AdModel>[];
        final int pending =
            ads.where((a) => _adStatus(a) == 'pending').length;
        final int approved =
            ads.where((a) => _adStatus(a) == 'approved').length;
        final int sold = ads.where((a) => _adStatus(a) == 'sold').length;

        return LayoutBuilder(builder: (context, c) {
          final cols = c.maxWidth >= 900 ? 4 : (c.maxWidth >= 460 ? 2 : 1);
          const gap = 12.0;
          final w = ((c.maxWidth - gap * (cols - 1)) / cols) - 0.5;
          return Wrap(
            spacing: gap,
            runSpacing: gap,
            children: [
              SizedBox(
                width: w,
                child: _kpiCard(
                  icon: Icons.campaign_outlined,
                  bg: const Color(0xFFE0E7FF),
                  fg: const Color(0xFF4F46E5),
                  value: loaded != null ? '${loaded.total}' : '—',
                  label: "Total ads",
                ),
              ),
              SizedBox(
                width: w,
                child: _kpiCard(
                  icon: Icons.pending_actions_outlined,
                  bg: AppColors.warningSoft,
                  fg: const Color(0xFF92400E),
                  value: loaded != null ? '$pending' : '—',
                  label: "Pending review",
                  hint: "this page",
                  highlighted: pending > 0,
                ),
              ),
              SizedBox(
                width: w,
                child: _kpiCard(
                  icon: Icons.check_circle_outline,
                  bg: AppColors.successSoft,
                  fg: AppColors.success,
                  value: loaded != null ? '$approved' : '—',
                  label: "Approved",
                  hint: "this page",
                ),
              ),
              SizedBox(
                width: w,
                child: _kpiCard(
                  icon: Icons.sell_outlined,
                  bg: const Color(0xFFFCE7F3),
                  fg: const Color(0xFFDB2777),
                  value: loaded != null ? '$sold' : '—',
                  label: "Sold out",
                  hint: "this page",
                ),
              ),
            ],
          );
        });
      },
    );
  }

  Widget _kpiCard({
    required IconData icon,
    required Color bg,
    required Color fg,
    required String value,
    required String label,
    String? hint,
    bool highlighted = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
            color: highlighted ? const Color(0xFFFCD34D) : AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration:
                BoxDecoration(color: bg, borderRadius: BorderRadius.circular(10)),
            child: Icon(icon, color: fg, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary)),
                Row(
                  children: [
                    Flexible(
                      child: Text(label,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.inter(
                              fontSize: 12, color: AppColors.textSecondary)),
                    ),
                    if (hint != null) ...[
                      const SizedBox(width: 4),
                      Text("· $hint",
                          style: GoogleFonts.inter(
                              fontSize: 10.5, color: AppColors.textMuted)),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Toolbar: search, filters, bulk actions
  // ---------------------------------------------------------------------------
  Widget _buildToolbar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
      decoration: const BoxDecoration(
        color: AppColors.surfaceAlt,
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutBuilder(builder: (context, c) {
            final bool narrow = c.maxWidth < 760;
            final search = _searchField();
            final category = _categoryDropdown();
            final download = _downloadButton();
            if (narrow) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  search,
                  const SizedBox(height: 8),
                  Row(children: [
                    Expanded(child: category),
                    const SizedBox(width: 8),
                    download,
                  ]),
                ],
              );
            }
            return Row(
              children: [
                Expanded(flex: 5, child: search),
                const SizedBox(width: 10),
                SizedBox(width: 210, child: category),
                const Spacer(),
                download,
              ],
            );
          }),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: _statusSegments()),
              _selectionSummary(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _searchField() {
    return SizedBox(
      height: 38,
      child: TextField(
        controller: _searchController,
        onChanged: _onSearchChanged,
        style: GoogleFonts.inter(fontSize: 13.5),
        decoration: InputDecoration(
          isDense: true,
          hintText: "Search ads by title, location…",
          hintStyle:
              GoogleFonts.inter(fontSize: 13, color: AppColors.textMuted),
          prefixIcon:
              const Icon(Icons.search, size: 18, color: AppColors.textMuted),
          suffixIcon: (_searchQuery != null || _searchController.text.isNotEmpty)
              ? IconButton(
                  icon: const Icon(Icons.close,
                      size: 16, color: AppColors.textMuted),
                  onPressed: () {
                    _searchController.clear();
                    _searchQuery = null;
                    _fetch();
                    setState(() {});
                  },
                )
              : null,
          filled: true,
          fillColor: AppColors.surface,
          contentPadding: const EdgeInsets.symmetric(vertical: 9),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: const BorderSide(color: AppColors.border),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: const BorderSide(color: AppColors.border),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: const BorderSide(color: AppColors.accent, width: 1.4),
          ),
        ),
      ),
    );
  }

  Widget _categoryDropdown() {
    return Container(
      height: 38,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: AppColors.border),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String?>(
          value: _categoryFilter,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down,
              size: 18, color: AppColors.textSecondary),
          dropdownColor: Colors.white,
          style: GoogleFonts.inter(
              fontSize: 13, color: AppColors.textPrimary),
          items: [
            DropdownMenuItem<String?>(
              value: null,
              child: Text("All categories",
                  style: GoogleFonts.inter(
                      fontSize: 13, color: AppColors.textSecondary)),
            ),
            ..._categories.entries.map((e) => DropdownMenuItem<String?>(
                  value: e.key,
                  child: Text(e.value),
                )),
          ],
          onChanged: (v) => setState(() => _categoryFilter = v),
        ),
      ),
    );
  }

  Widget _statusSegments() {
    Widget segment(_AdStatusFilter value, String label) {
      final bool selected = _statusFilter == value;
      return InkWell(
        onTap: () => setState(() => _statusFilter = value),
        borderRadius: BorderRadius.circular(7),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: selected ? AppColors.surface : Colors.transparent,
            borderRadius: BorderRadius.circular(7),
            border: selected
                ? Border.all(color: AppColors.borderStrong)
                : null,
            boxShadow: selected
                ? [
                    BoxShadow(
                        color: Colors.black.withValues(alpha: 0.04),
                        blurRadius: 2,
                        offset: const Offset(0, 1))
                  ]
                : null,
          ),
          child: Text(label,
              style: GoogleFonts.inter(
                  fontSize: 12.5,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                  color: selected
                      ? AppColors.textPrimary
                      : AppColors.textSecondary)),
        ),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: const Color(0xFFE9ECF2),
          borderRadius: BorderRadius.circular(9),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            segment(_AdStatusFilter.all, "All"),
            segment(_AdStatusFilter.pending, "Pending"),
            segment(_AdStatusFilter.approved, "Approved"),
            segment(_AdStatusFilter.sold, "Sold"),
          ],
        ),
      ),
    );
  }

  Widget _selectionSummary() {
    if (_selectedAdIds.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text("${_selectedAdIds.length} selected",
          style: GoogleFonts.inter(
              fontSize: 12.5,
              fontWeight: FontWeight.w600,
              color: AppColors.accent)),
    );
  }

  Widget _downloadButton() {
    return BlocBuilder<AdsBloc, AdsState>(
      builder: (context, state) {
        final ads = state.whenOrNull(
                loaded: (ads, total, page, limit) => ads) ??
            const <AdModel>[];
        return SizedBox(
          height: 38,
          child: TextButton.icon(
            onPressed: () => _downloadSelectedAsPdf(_visibleAds(ads)),
            style: TextButton.styleFrom(
              backgroundColor: AppColors.accentSoft,
              foregroundColor: AppColors.accent,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9)),
            ),
            icon: const Icon(Icons.download_outlined, size: 18),
            label: Text('PDF',
                style: GoogleFonts.inter(
                    fontSize: 13, fontWeight: FontWeight.w600)),
          ),
        );
      },
    );
  }

  Future<void> _downloadSelectedAsPdf(List<AdModel> visibleAds) async {
    final List<AdModel> selected =
        visibleAds.where((ad) => _selectedAdIds.contains(ad.id)).toList();
    if (selected.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No rows selected')),
      );
      return;
    }

    try {
      final pdfBytes = await PdfGenerator.generateAdsReport(selected);
      final String filename =
          'ads_report_${DateTime.now().millisecondsSinceEpoch}.pdf';
      await savePdf(pdfBytes, filename);

      if (mounted) {
        setState(() => _selectedAdIds.clear());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'PDF report saved: $filename with ${selected.length} records'),
            backgroundColor: AppColors.success,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to generate PDF: $e'),
            backgroundColor: AppColors.danger,
          ),
        );
      }
    }
  }

  // ---------------------------------------------------------------------------
  // Table / states
  // ---------------------------------------------------------------------------
  Widget _buildAdsTable() {
    return BlocBuilder<AdsBloc, AdsState>(
      builder: (context, state) {
        return state.when(
          initial: () => _centeredLoader(),
          loading: () => _centeredLoader(),
          loaded: (ads, total, currentPage, itemsPerPage) {
            _limit = itemsPerPage;
            final visible = _visibleAds(ads);
            if (visible.isEmpty) {
              return _emptyState(filtered: ads.isNotEmpty);
            }
            return Column(
              children: [
                _buildAdsDataTable(visible),
                _buildPagination(total, currentPage, itemsPerPage),
              ],
            );
          },
          error: (message) => _errorState(message),
          approvalLoading: (adId) => _centeredLoader(),
          approvalSuccess: (message, updatedAd) => _centeredLoader(),
          approvalError: (message, adId) => _centeredLoader(),
        );
      },
    );
  }

  Widget _centeredLoader() => const Center(
        child: Padding(
          padding: EdgeInsets.all(48.0),
          child: CircularProgressIndicator(),
        ),
      );

  Widget _emptyState({bool filtered = false}) => Center(
        child: Padding(
          padding: const EdgeInsets.all(48.0),
          child: Column(
            children: [
              Icon(filtered ? Icons.filter_alt_off_outlined : Icons.inbox_outlined,
                  size: 44, color: AppColors.textMuted),
              const SizedBox(height: 14),
              Text(
                  filtered
                      ? 'No ads match the current filters'
                      : 'No ads found',
                  style: GoogleFonts.inter(
                      color: AppColors.textSecondary, fontSize: 15)),
              if (filtered) ...[
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () => setState(() {
                    _categoryFilter = null;
                    _statusFilter = _AdStatusFilter.all;
                  }),
                  child: const Text('Clear filters'),
                ),
              ],
            ],
          ),
        ),
      );

  Widget _errorState(String message) => Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              const Icon(Icons.error_outline,
                  size: 44, color: AppColors.danger),
              const SizedBox(height: 14),
              Text('Error loading ads: $message',
                  style:
                      GoogleFonts.inter(color: AppColors.danger, fontSize: 14),
                  textAlign: TextAlign.center),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _fetch,
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );

  Widget _buildAdsDataTable(List<AdModel> ads) {
    final headingStyle = GoogleFonts.inter(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: AppColors.textMuted,
        letterSpacing: 0.3);

    final bool allSelected =
        ads.isNotEmpty && ads.every((ad) => _selectedAdIds.contains(ad.id));

    return LayoutBuilder(
      builder: (context, constraints) {
        final double tableWidth =
            constraints.maxWidth > 1080 ? constraints.maxWidth : 1080;
        return Scrollbar(
          controller: _horizontalScrollController,
          thumbVisibility: true,
          child: SingleChildScrollView(
            controller: _horizontalScrollController,
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: tableWidth),
              child: DataTable(
                columnSpacing: 40,
                horizontalMargin: 16,
                headingRowColor: WidgetStateColor.resolveWith(
                    (states) => AppColors.surfaceAlt),
                dataRowColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    return AppColors.accentSoft;
                  }
                  if (states.contains(WidgetState.hovered)) {
                    return const Color(0xFFF8FAFF);
                  }
                  return AppColors.surface;
                }),
                dividerThickness: 1,
                dataRowMinHeight: 64,
                dataRowMaxHeight: 72,
                columns: [
                  DataColumn(
                    label: Checkbox(
                      value: allSelected,
                      onChanged: (v) => _toggleSelectAll(ads, v == true),
                      visualDensity: VisualDensity.compact,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                  DataColumn(label: Text('Ad', style: headingStyle)),
                  DataColumn(label: Text('Category', style: headingStyle)),
                  DataColumn(label: Text('Posted', style: headingStyle)),
                  DataColumn(label: Text('Location', style: headingStyle)),
                  DataColumn(label: Text('Price', style: headingStyle)),
                  DataColumn(label: Text('Status', style: headingStyle)),
                  DataColumn(label: Text('Actions', style: headingStyle)),
                ],
                rows: ads.map((ad) => _buildAdRow(ad)).toList(),
              ),
            ),
          ),
        );
      },
    );
  }

  void _toggleSelectAll(List<AdModel> ads, bool select) {
    setState(() {
      if (select) {
        _selectedAdIds.addAll(ads.map((a) => a.id));
      } else {
        for (final ad in ads) {
          _selectedAdIds.remove(ad.id);
        }
      }
    });
  }

  DataRow _buildAdRow(AdModel ad) {
    final bool isSelected = _selectedAdIds.contains(ad.id);
    return DataRow(
      selected: isSelected,
      cells: [
        DataCell(
          Checkbox(
            value: isSelected,
            visualDensity: VisualDensity.compact,
            onChanged: (value) {
              setState(() {
                if (value == true) {
                  _selectedAdIds.add(ad.id);
                } else {
                  _selectedAdIds.remove(ad.id);
                }
              });
            },
          ),
        ),
        DataCell(_adCell(ad), onTap: () => _openAdDetail(ad)),
        DataCell(
          _categoryChip(ad.category),
          onTap: () => _openAdDetail(ad),
        ),
        DataCell(
          Text(_formatDate(ad.postedAt),
              style: GoogleFonts.inter(
                  fontSize: 12.5, color: AppColors.textSecondary)),
          onTap: () => _openAdDetail(ad),
        ),
        DataCell(
          SizedBox(
            width: 120,
            child: Text(ad.location.isEmpty ? '—' : ad.location,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: GoogleFonts.inter(
                    fontSize: 13, color: AppColors.textSecondary)),
          ),
          onTap: () => _openAdDetail(ad),
        ),
        DataCell(
          Text(_formatPrice(ad.price),
              style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary)),
          onTap: () => _openAdDetail(ad),
        ),
        DataCell(_buildStatusChip(ad), onTap: () => _openAdDetail(ad)),
        DataCell(SizedBox(width: 150, child: _rowActions(ad))),
      ],
    );
  }

  /// Thumbnail + title + seller name.
  Widget _adCell(AdModel ad) {
    final String url = ad.images.isNotEmpty ? ad.images.first : '';
    return Row(
      children: [
        Container(
          width: 52,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.surfaceAlt,
            borderRadius: BorderRadius.circular(7),
            border: Border.all(color: AppColors.border),
          ),
          clipBehavior: Clip.antiAlias,
          child: url.isEmpty
              ? const Icon(Icons.image_outlined,
                  size: 18, color: AppColors.textMuted)
              : Image.network(url,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Icon(
                      Icons.broken_image_outlined,
                      size: 18,
                      color: AppColors.textMuted)),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 190,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _buildVehicleTitle(ad),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary),
              ),
              if (ad.user.name.isNotEmpty)
                Text(
                  ad.user.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: GoogleFonts.inter(
                      fontSize: 11.5, color: AppColors.textMuted),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _categoryChip(String category) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.accentSoft,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        _formatCategory(category),
        style: GoogleFonts.inter(
            fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.accent),
      ),
    );
  }

  Widget _buildStatusChip(AdModel ad) {
    late String text;
    late Color bg;
    late Color fg;
    switch (_adStatus(ad)) {
      case 'sold':
        text = 'Sold out';
        bg = AppColors.surfaceAlt;
        fg = AppColors.textSecondary;
        break;
      case 'approved':
        text = 'Approved';
        bg = AppColors.successSoft;
        fg = AppColors.success;
        break;
      default:
        text = 'Pending';
        bg = AppColors.warningSoft;
        fg = const Color(0xFF92400E);
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration:
          BoxDecoration(color: bg, borderRadius: BorderRadius.circular(6)),
      child: Text(text,
          style: GoogleFonts.inter(
              fontSize: 11, fontWeight: FontWeight.w600, color: fg)),
    );
  }

  // ---------------------------------------------------------------------------
  // Row actions: approve / reject / view
  // ---------------------------------------------------------------------------
  Widget _rowActions(AdModel ad) {
    return BlocBuilder<AdsBloc, AdsState>(
      builder: (context, state) {
        final bool isLoading = state.maybeWhen(
          approvalLoading: (adId) => adId == ad.id,
          orElse: () => false,
        );

        if (isLoading) {
          return const Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          );
        }

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!ad.soldOut) ...[
              _actionIcon(
                icon: Icons.check_circle_outline,
                color: AppColors.success,
                tooltip: ad.isApproved ? 'Already approved' : 'Approve',
                disabled: ad.isApproved,
                onTap: () => context.read<AdsBloc>().add(
                    AdsEvent.updateAdApproval(adId: ad.id, isApproved: true)),
              ),
              _actionIcon(
                icon: Icons.cancel_outlined,
                color: AppColors.danger,
                tooltip: 'Reject',
                onTap: () => context.read<AdsBloc>().add(
                    AdsEvent.updateAdApproval(adId: ad.id, isApproved: false)),
              ),
            ],
            _actionIcon(
              icon: Icons.visibility_outlined,
              color: AppColors.accent,
              tooltip: 'View details',
              onTap: () => _openAdDetail(ad),
            ),
          ],
        );
      },
    );
  }

  Widget _actionIcon({
    required IconData icon,
    required Color color,
    required String tooltip,
    required VoidCallback onTap,
    bool disabled = false,
  }) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: disabled ? null : onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(7),
          child: Icon(icon,
              size: 20, color: disabled ? AppColors.textMuted : color),
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Formatting helpers
  // ---------------------------------------------------------------------------
  String _buildVehicleTitle(AdModel ad) {
    if (ad.category == 'property') {
      return ad.description.isNotEmpty
          ? ad.description
          : 'Property Description Not Available';
    }

    if (ad.category == 'two_wheeler' ||
        ad.category == 'four_wheeler' ||
        ad.category == 'commercial_vehicle' ||
        ad.category == 'private_vehicle') {
      if (ad.vehicleDetails == null) {
        return 'Vehicle Details Not Available';
      }
      final manufacturer =
          ad.vehicleDetails?.manufacturer.displayName ?? 'Unknown';
      final model = ad.vehicleDetails?.model.displayName ?? 'Unknown';
      final year = ad.vehicleDetails?.year.toString() ?? 'Unknown';
      return '$manufacturer $model ($year)';
    }

    return ad.title.isNotEmpty
        ? ad.title
        : (ad.description.isNotEmpty ? ad.description : 'No Title Available');
  }

  String _formatCategory(String category) {
    return _categories[category] ??
        category
            .replaceAll('_', ' ')
            .split(' ')
            .map((word) => word.isNotEmpty
                ? word[0].toUpperCase() + word.substring(1).toLowerCase()
                : '')
            .join(' ');
  }

  String _formatDate(DateTime date) => DateFormat('dd MMM yyyy').format(date);

  String _formatPrice(int price) =>
      '₹${NumberFormat.decimalPattern('en_IN').format(price)}';

  // ---------------------------------------------------------------------------
  // Pagination
  // ---------------------------------------------------------------------------
  Widget _buildPagination(int total, int currentPage, int itemsPerPage) {
    final totalPages = (total / itemsPerPage).ceil();
    if (totalPages <= 1) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("Rows per page:",
              style: GoogleFonts.inter(
                  fontSize: 12.5, color: AppColors.textSecondary)),
          const SizedBox(width: 8),
          DropdownButton<int>(
            value: itemsPerPage,
            dropdownColor: Colors.white,
            underline: const SizedBox.shrink(),
            style: GoogleFonts.inter(fontSize: 13, color: AppColors.textPrimary),
            items: [10, 20].map((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text(value.toString()),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                _limit = value;
                _fetch();
              }
            },
          ),
          const SizedBox(width: 20),
          Text("Page $currentPage of $totalPages",
              style: GoogleFonts.inter(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary)),
          const SizedBox(width: 14),
          _pageArrow(
            icon: Icons.chevron_left,
            enabled: currentPage > 1,
            onTap: () => _fetch(page: currentPage - 1),
          ),
          const SizedBox(width: 6),
          _pageArrow(
            icon: Icons.chevron_right,
            enabled: currentPage < totalPages,
            onTap: () => _fetch(page: currentPage + 1),
          ),
        ],
      ),
    );
  }

  Widget _pageArrow({
    required IconData icon,
    required bool enabled,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: enabled ? onTap : null,
      borderRadius: BorderRadius.circular(7),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Icon(icon,
            size: 18,
            color: enabled ? AppColors.textPrimary : AppColors.textMuted),
      ),
    );
  }

  BoxDecoration _cardDecoration() => BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      );
}
