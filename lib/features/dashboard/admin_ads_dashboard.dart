import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/models/ad_model.dart';
import 'package:ado_dad_admin/features/dashboard/bloc/ads_bloc.dart';
import 'package:ado_dad_admin/features/dashboard/bloc/ads_event.dart';
import 'package:ado_dad_admin/features/dashboard/bloc/ads_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ado_dad_admin/common/save_pdf.dart';
import 'package:ado_dad_admin/common/pdf_generator.dart';

class AdminAdsDashboard extends StatefulWidget {
  const AdminAdsDashboard({super.key});

  @override
  State<AdminAdsDashboard> createState() => _AdminAdsDashboardState();
}

class _AdminAdsDashboardState extends State<AdminAdsDashboard> {
  final ScrollController _horizontalScrollController = ScrollController();
  final Set<String> _selectedAdIds = <String>{};

  @override
  void initState() {
    super.initState();
    // Fetch ads when the widget initializes
    context.read<AdsBloc>().add(const AdsEvent.fetchAllAds());
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
                backgroundColor: Colors.green,
                duration: const Duration(seconds: 2),
              ),
            );
          },
          approvalError: (message, adId) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: Colors.red,
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
            const SizedBox(height: 20),
            _buildSelectAllToolbar(),
            const SizedBox(height: 12),
            _buildAdsTable(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return BlocBuilder<AdsBloc, AdsState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                spreadRadius: 2,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              const SizedBox(width: 16),
              Text(
                "Admin Dashboard",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const Spacer(),
              state.whenOrNull(
                    loaded: (ads, total, currentPage, itemsPerPage) {
                      if (total > 0) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "Total Ads: $total",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ) ??
                  const SizedBox.shrink(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAdsTable() {
    return BlocBuilder<AdsBloc, AdsState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(
            child: Padding(
              padding: EdgeInsets.all(40.0),
              child: CircularProgressIndicator(),
            ),
          ),
          loading: () => const Center(
            child: Padding(
              padding: EdgeInsets.all(40.0),
              child: CircularProgressIndicator(),
            ),
          ),
          loaded: (ads, total, currentPage, itemsPerPage) {
            if (ads.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.inbox_outlined,
                        size: 48,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'No ads found',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            return Column(
              children: [
                _buildAdsDataTable(ads),
                const SizedBox(height: 20),
                _buildPagination(total, currentPage, itemsPerPage),
              ],
            );
          },
          error: (message) => Center(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  const Icon(
                    Icons.error_outline,
                    size: 48,
                    color: Colors.red,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Error loading ads: $message',
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
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
          ),
          approvalLoading: (adId) => const Center(
            child: Padding(
              padding: EdgeInsets.all(40.0),
              child: CircularProgressIndicator(),
            ),
          ),
          approvalSuccess: (message, updatedAd) => const Center(
            child: Padding(
              padding: EdgeInsets.all(40.0),
              child: CircularProgressIndicator(),
            ),
          ),
          approvalError: (message, adId) => const Center(
            child: Padding(
              padding: EdgeInsets.all(40.0),
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }

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

        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Checkbox(
              value: allSelected,
              onChanged: (value) {
                _toggleSelectAll(currentAds, value == true);
              },
            ),
            TextButton(
              onPressed: () {
                _toggleSelectAll(currentAds, !allSelected);
              },
              child: const Text(
                'Select All',
                style: TextStyle(color: AppColors.blackColor),
              ),
            ),
            const SizedBox(width: 12),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blackColor),
              onPressed: () async {
                await _downloadSelectedAsPdf(currentAds);
              },
              icon: const Icon(
                Icons.picture_as_pdf,
                color: AppColors.primaryColor,
              ),
              label: Text(
                'Download PDF',
                style: TextStyle(color: AppColors.primaryColor),
              ),
            ),
          ],
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
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to generate PDF: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Widget _buildAdsDataTable(List<AdModel> ads) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Scrollbar(
          controller: _horizontalScrollController,
          thumbVisibility: true,
          trackVisibility: true,
          child: SingleChildScrollView(
            controller: _horizontalScrollController,
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 1000),
              child: DataTable(
                columnSpacing: 90,
                headingRowColor: WidgetStateColor.resolveWith(
                  (states) => const Color.fromARGB(66, 144, 140, 140),
                ),
                dataRowColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    return AppColors.primaryColor1.withOpacity(0.2);
                  }
                  return AppColors.primaryColor;
                }),
                dataRowMinHeight: 60,
                dataRowMaxHeight: 80,
                columns: const [
                  DataColumn(
                    label: Text(
                      'Select',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Image',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Category',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Posted On',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Location',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Price',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Status',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Approval',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
                rows: ads.map((ad) => _buildAdRow(ad)).toList(),
              ),
            ),
          ),
        ),
      ),
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
            width: 80,
            height: 50,
            child: _buildAdImage(ad),
          ),
        ),
        DataCell(
          SizedBox(
            width: 100,
            child: Text(
              _buildVehicleTitle(ad),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ),
        DataCell(
          Text(
            _formatCategory(ad.category),
            style: const TextStyle(fontSize: 14),
          ),
        ),
        DataCell(
          Text(
            _formatDate(ad.postedAt),
            style: const TextStyle(fontSize: 12),
          ),
        ),
        DataCell(
          Text(
            ad.location,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        DataCell(
          Text(
            '₹${ad.price.toString()}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        DataCell(
          SizedBox(
            width: 60,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              decoration: BoxDecoration(
                color: ad.soldOut ? Colors.black : Colors.green,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                ad.soldOut ? 'SoldOut' : 'Active',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 11,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        DataCell(
          SizedBox(
            width: 120,
            child: _buildApprovalButtons(ad),
          ),
        ),
      ],
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

  Widget _buildAdImage(AdModel ad) {
    if (ad.images.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          ad.images.first,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) =>
              _buildImagePlaceholder(),
        ),
      );
    }
    return _buildImagePlaceholder();
  }

  Widget _buildImagePlaceholder() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Icon(
        Icons.image_not_supported,
        color: Colors.grey,
        size: 24,
      ),
    );
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
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'Sold Out',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Approve Button
            GestureDetector(
              onTap: (isLoading || isApproved)
                  ? null
                  : () {
                      context.read<AdsBloc>().add(AdsEvent.updateAdApproval(
                            adId: ad.id,
                            isApproved: true,
                          ));
                    },
              child: Container(
                width: 60,
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                decoration: BoxDecoration(
                  color: (isLoading || isApproved) ? Colors.grey : Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  isLoading ? '...' : (isApproved ? 'Approved' : 'Approve'),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            // Reject Button
            GestureDetector(
              onTap: isLoading
                  ? null
                  : () {
                      context.read<AdsBloc>().add(AdsEvent.updateAdApproval(
                            adId: ad.id,
                            isApproved: false,
                          ));
                    },
              child: Container(
                width: 50,
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                decoration: BoxDecoration(
                  color: isLoading ? Colors.grey : Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  isLoading ? '...' : 'Reject',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildPagination(int total, int currentPage, int itemsPerPage) {
    final totalPages = (total / itemsPerPage).ceil();

    if (totalPages <= 1) return const SizedBox.shrink();

    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text("Rows per page: "),
            const SizedBox(width: 8),
            DropdownButton<int>(
              value: itemsPerPage,
              dropdownColor: Colors.white,
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
            GestureDetector(
              onTap: currentPage > 1
                  ? () {
                      context.read<AdsBloc>().add(AdsEvent.fetchAllAds(
                            page: currentPage - 1,
                            limit: itemsPerPage,
                          ));
                    }
                  : null,
              child: Icon(
                Icons.chevron_left,
                size: 28,
                color: currentPage > 1 ? Colors.black : Colors.grey[400],
              ),
            ),
            const SizedBox(width: 15),
            Text(
              "Page $currentPage of $totalPages",
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 15),
            GestureDetector(
              onTap: currentPage < totalPages
                  ? () {
                      context.read<AdsBloc>().add(AdsEvent.fetchAllAds(
                            page: currentPage + 1,
                            limit: itemsPerPage,
                          ));
                    }
                  : null,
              child: Icon(
                Icons.chevron_right,
                size: 28,
                color:
                    currentPage < totalPages ? Colors.black : Colors.grey[400],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
