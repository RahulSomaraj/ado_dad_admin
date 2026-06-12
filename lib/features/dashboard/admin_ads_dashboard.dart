import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/common/data_storage.dart';
import 'package:ado_dad_admin/models/ad_model.dart';
import 'package:ado_dad_admin/features/dashboard/bloc/ads_bloc.dart';
import 'package:ado_dad_admin/features/dashboard/bloc/ads_event.dart';
import 'package:ado_dad_admin/features/dashboard/bloc/ads_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ado_dad_admin/common/save_pdf.dart';
import 'package:ado_dad_admin/common/pdf_generator.dart';

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
  final Set<String> _selectedAdIds = <String>{};
  String? userType;
  String? _filterUserName;

  @override
  void initState() {
    super.initState();
    _loadUserType();
    // Apply (or clear) the owner filter on the shared bloc, then fetch.
    final bloc = context.read<AdsBloc>();
    bloc.userFilter = widget.userId;
    _filterUserName = widget.userName;
    bloc.add(const AdsEvent.fetchAllAds());
  }

  void _clearUserFilter() {
    final bloc = context.read<AdsBloc>();
    bloc.userFilter = null;
    setState(() => _filterUserName = null);
    bloc.add(const AdsEvent.fetchAllAds());
  }

  Future<void> _loadUserType() async {
    final type = await getUserType();
    if (mounted) {
      setState(() {
        userType = type;
      });
    }
  }

  @override
  void dispose() {
    _horizontalScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AdsBloc, AdsState>(
      listener: (context, state) {
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
            Container(
              decoration: _cardDecoration(),
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  _buildSelectAllToolbar(),
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
    return BlocBuilder<AdsBloc, AdsState>(
      builder: (context, state) {
        final totalChip = state.whenOrNull(
              loaded: (ads, total, currentPage, itemsPerPage) {
                if (total > 0) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.accentSoft,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "$total total",
                      style: GoogleFonts.inter(
                        color: AppColors.accent,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.5,
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ) ??
            const SizedBox.shrink();

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
                  Text(
                    userType == "SA" ? "Advertisements" : "Advertisements",
                    style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary),
                  ),
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
            totalChip,
          ],
        );
      },
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
          Icon(Icons.person_outline, size: 14, color: AppColors.accent),
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
  // Select-all toolbar (card top bar)
  // ---------------------------------------------------------------------------
  Widget _buildSelectAllToolbar() {
    return BlocBuilder<AdsBloc, AdsState>(
      builder: (context, state) {
        final loadedState = state.whenOrNull(
            loaded: (ads, total, currentPage, itemsPerPage) => ads);
        if (loadedState == null || loadedState.isEmpty) {
          return const SizedBox.shrink();
        }

        final List<AdModel> currentAds = loadedState;
        final bool allSelected = currentAds.isNotEmpty &&
            currentAds.every((ad) => _selectedAdIds.contains(ad.id));
        final int selectedCount =
            currentAds.where((ad) => _selectedAdIds.contains(ad.id)).length;

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: const BoxDecoration(
            color: AppColors.surfaceAlt,
            border: Border(bottom: BorderSide(color: AppColors.border)),
          ),
          child: Row(
            children: [
              InkWell(
                onTap: () => _toggleSelectAll(currentAds, !allSelected),
                borderRadius: BorderRadius.circular(6),
                child: Row(
                  children: [
                    Checkbox(
                      value: allSelected,
                      onChanged: (value) =>
                          _toggleSelectAll(currentAds, value == true),
                      visualDensity: VisualDensity.compact,
                      materialTapTargetSize:
                          MaterialTapTargetSize.shrinkWrap,
                    ),
                    const SizedBox(width: 4),
                    Text('Select all',
                        style: GoogleFonts.inter(
                            fontSize: 13, color: AppColors.textPrimary)),
                  ],
                ),
              ),
              if (selectedCount > 0) ...[
                const SizedBox(width: 8),
                Text('· $selectedCount selected',
                    style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.accent)),
              ],
              const Spacer(),
              TextButton.icon(
                onPressed: () => _downloadSelectedAsPdf(currentAds),
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.accentSoft,
                  foregroundColor: AppColors.accent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                icon: const Icon(Icons.download_outlined, size: 18),
                label: Text('Download PDF',
                    style: GoogleFonts.inter(
                        fontSize: 13, fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        );
      },
    );
  }

  void _toggleSelectAll(List<AdModel> ads, bool select) {
    setState(() {
      if (select) {
        for (final ad in ads) {
          _selectedAdIds.add(ad.id);
        }
      } else {
        for (final ad in ads) {
          _selectedAdIds.remove(ad.id);
        }
      }
    });
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
      // Generate PDF
      final pdfBytes = await PdfGenerator.generateAdsReport(selected);
      final String filename =
          'ads_report_${DateTime.now().millisecondsSinceEpoch}.pdf';

      // Save PDF
      await savePdf(pdfBytes, filename);

      if (mounted) {
        // Clear all selections
        setState(() {
          _selectedAdIds.clear();
        });

        // Refresh the data
        context.read<AdsBloc>().add(const AdsEvent.fetchAllAds());

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
            if (ads.isEmpty) {
              return _emptyState();
            }
            return Column(
              children: [
                _buildAdsDataTable(ads),
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

  Widget _emptyState() => Center(
        child: Padding(
          padding: const EdgeInsets.all(48.0),
          child: Column(
            children: [
              const Icon(Icons.inbox_outlined,
                  size: 44, color: AppColors.textMuted),
              const SizedBox(height: 14),
              Text('No ads found',
                  style: GoogleFonts.inter(
                      color: AppColors.textSecondary, fontSize: 15)),
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
                  style: GoogleFonts.inter(
                      color: AppColors.danger, fontSize: 14),
                  textAlign: TextAlign.center),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  context.read<AdsBloc>().add(const AdsEvent.fetchAllAds());
                },
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

    return LayoutBuilder(
      builder: (context, constraints) {
        // Fill the available width on large screens; keep a 1000px floor so the
        // table scrolls horizontally on small ones.
        final double tableWidth =
            constraints.maxWidth > 1000 ? constraints.maxWidth : 1000;
        return Scrollbar(
          controller: _horizontalScrollController,
          thumbVisibility: true,
          child: SingleChildScrollView(
            controller: _horizontalScrollController,
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: tableWidth),
              child: DataTable(
            columnSpacing: 56,
            horizontalMargin: 16,
            headingRowColor:
                WidgetStateColor.resolveWith((states) => AppColors.surfaceAlt),
            dataRowColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return AppColors.accentSoft;
              }
              return AppColors.surface;
            }),
            dividerThickness: 1,
            dataRowMinHeight: 60,
            dataRowMaxHeight: 80,
            columns: [
              DataColumn(label: Text('Select', style: headingStyle)),
              DataColumn(label: Text('Name', style: headingStyle)),
              DataColumn(label: Text('Category', style: headingStyle)),
              DataColumn(label: Text('Posted On', style: headingStyle)),
              DataColumn(label: Text('Location', style: headingStyle)),
              DataColumn(label: Text('Price', style: headingStyle)),
              DataColumn(label: Text('Status', style: headingStyle)),
              DataColumn(label: Text('Approval', style: headingStyle)),
            ],
            rows: ads.map((ad) => _buildAdRow(ad)).toList(),
                ),
              ),
            ),
          );
        },
      );
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
        DataCell(
          SizedBox(
            width: 160,
            child: Text(
              _buildVehicleTitle(ad),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary),
            ),
          ),
        ),
        DataCell(
          Text(_formatCategory(ad.category),
              style: GoogleFonts.inter(
                  fontSize: 13, color: AppColors.textSecondary)),
        ),
        DataCell(
          Text(_formatDate(ad.postedAt),
              style: GoogleFonts.inter(
                  fontSize: 12.5, color: AppColors.textSecondary)),
        ),
        DataCell(
          SizedBox(
            width: 120,
            child: Text(ad.location,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: GoogleFonts.inter(
                    fontSize: 13, color: AppColors.textSecondary)),
          ),
        ),
        DataCell(
          Text('₹${ad.price.toString()}',
              style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary)),
        ),
        DataCell(_buildStatusChip(ad)),
        DataCell(
          SizedBox(width: 180, child: _buildApprovalButtons(ad)),
        ),
      ],
    );
  }

  Widget _buildStatusChip(AdModel ad) {
    final bg = ad.soldOut ? AppColors.surfaceAlt : AppColors.successSoft;
    final fg = ad.soldOut ? AppColors.textSecondary : AppColors.success;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration:
          BoxDecoration(color: bg, borderRadius: BorderRadius.circular(6)),
      child: Text(
        ad.soldOut ? 'Sold out' : 'Active',
        style: GoogleFonts.inter(
            fontSize: 11, fontWeight: FontWeight.w600, color: fg),
      ),
    );
  }

  /// Build title based on category with null safety
  String _buildVehicleTitle(AdModel ad) {
    // For property category, show description
    if (ad.category == 'property') {
      return ad.description.isNotEmpty
          ? ad.description
          : 'Property Description Not Available';
    }

    // For vehicle categories, show vehicle details
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

      return '$manufacturer $model($year)';
    }

    // For other categories, show title or description
    return ad.title.isNotEmpty
        ? ad.title
        : (ad.description.isNotEmpty ? ad.description : 'No Title Available');
  }

  String _formatCategory(String category) {
    switch (category) {
      case 'two_wheeler':
        return 'Two Wheeler';
      case 'four_wheeler':
        return 'Four Wheeler';
      case 'commercial_vehicle':
        return 'Commercial Vehicle';
      case 'property':
        return 'Property';
      default:
        return category
            .replaceAll('_', ' ')
            .split(' ')
            .map((word) => word.isNotEmpty
                ? word[0].toUpperCase() + word.substring(1).toLowerCase()
                : '')
            .join(' ');
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  Widget _buildApprovalButtons(AdModel ad) {
    return BlocBuilder<AdsBloc, AdsState>(
      builder: (context, state) {
        // For sold-out ads, show a message instead of buttons
        if (ad.soldOut) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
            decoration: BoxDecoration(
              color: AppColors.surfaceAlt,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              'Sold out',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  fontSize: 11,
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w600),
            ),
          );
        }

        final isLoading = state.maybeWhen(
          approvalLoading: (adId) => adId == ad.id,
          orElse: () => false,
        );

        // Check if ad is already approved
        final bool isApproved = ad.isApproved;

        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Approve Button
            _approvalButton(
              label: isLoading ? '...' : (isApproved ? 'Approved' : 'Approve'),
              filled: true,
              color: AppColors.success,
              disabled: isLoading || isApproved,
              onTap: (isLoading || isApproved)
                  ? null
                  : () {
                      context.read<AdsBloc>().add(AdsEvent.updateAdApproval(
                            adId: ad.id,
                            isApproved: true,
                          ));
                    },
            ),
            const SizedBox(width: 8),
            // Reject Button
            _approvalButton(
              label: isLoading ? '...' : 'Reject',
              filled: false,
              color: AppColors.danger,
              disabled: isLoading,
              onTap: isLoading
                  ? null
                  : () {
                      context.read<AdsBloc>().add(AdsEvent.updateAdApproval(
                            adId: ad.id,
                            isApproved: false,
                          ));
                    },
            ),
          ],
        );
      },
    );
  }

  Widget _approvalButton({
    required String label,
    required bool filled,
    required Color color,
    required bool disabled,
    required VoidCallback? onTap,
  }) {
    final Color effective = disabled ? AppColors.textMuted : color;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: filled
              ? (disabled ? AppColors.surfaceAlt : color)
              : Colors.transparent,
          border: filled ? null : Border.all(color: effective),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 11.5,
            fontWeight: FontWeight.w600,
            color: filled
                ? (disabled ? AppColors.textSecondary : Colors.white)
                : effective,
          ),
        ),
      ),
    );
  }

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
            style: GoogleFonts.inter(
                fontSize: 13, color: AppColors.textPrimary),
            items: [10, 20].map((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text(value.toString()),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                context.read<AdsBloc>().add(AdsEvent.fetchAllAds(
                      page: 1,
                      limit: value,
                    ));
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
            onTap: () => context.read<AdsBloc>().add(AdsEvent.fetchAllAds(
                  page: currentPage - 1,
                  limit: itemsPerPage,
                )),
          ),
          const SizedBox(width: 6),
          _pageArrow(
            icon: Icons.chevron_right,
            enabled: currentPage < totalPages,
            onTap: () => context.read<AdsBloc>().add(AdsEvent.fetchAllAds(
                  page: currentPage + 1,
                  limit: itemsPerPage,
                )),
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
