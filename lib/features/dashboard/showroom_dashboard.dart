import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/common/data_storage.dart';
import 'package:ado_dad_admin/features/showroom/bloc/showroom_ads_bloc.dart';
import 'package:ado_dad_admin/models/ad_model.dart';
import 'package:ado_dad_admin/models/user_model.dart';
import 'package:ado_dad_admin/features/showroom/ui/showroom_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowroomDashboard extends StatefulWidget {
  const ShowroomDashboard({super.key});

  @override
  State<ShowroomDashboard> createState() => _ShowroomDashboardState();
}

class _ShowroomDashboardState extends State<ShowroomDashboard> {
  String? userName;
  String? userEmail;
  String? userId;
  String? userType;
  int _currentPage = 1;
  int _itemsPerPage = 10;
  final ScrollController _horizontalScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  @override
  void dispose() {
    _horizontalScrollController.dispose();
    super.dispose();
  }

  Future<void> _loadUserData() async {
    final name = await getUserName();
    final email = await getUserEmail();
    final id = await getUserId();
    final type = await getUserType();
    if (mounted) {
      setState(() {
        userName = name;
        userEmail = email;
        userId = id;
        userType = type;
      });
      // Automatically load ads when userId is available
      if (userId != null) {
        context.read<ShowroomAdsBloc>().add(
              FetchUserAds(
                userId: userId!,
                page: _currentPage,
                limit: _itemsPerPage,
              ),
            );
      }
    }
  }

  String getInitials(String name) {
    final words = name.trim().split(RegExp(r'\s+'));
    return words.length > 1
        ? "${words[0][0].toUpperCase()}${words[1][0].toUpperCase()}"
        : words[0][0].toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          _buildHeaderSection(),
          const SizedBox(height: 30),
          if (userId != null) _buildAdsSection(),
        ],
      ),
    );
  }

  Widget _buildHeaderSection() {
    final screenWidth = MediaQuery.of(context).size.width;
    final isNarrow = screenWidth <= 900; // stack on <= 900 to avoid overflow

    return Padding(
      padding: const EdgeInsets.all(15),
      child: isNarrow
          ? Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth < 600 ? 20 : 100, vertical: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Showroom Dashboard",
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildWelcomeText(),
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Showroom Dashboard",
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  _buildWelcomeText(),
                ],
              ),
            ),
    );
  }

  Widget _buildWelcomeText() {
    return Text(
      "Welcome, ${userName ?? 'Showroom User'}",
      style: const TextStyle(
        color: AppColors.blackColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildAdsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        elevation: 5,
        color: AppColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Your Ads",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor,
                ),
              ),
              const SizedBox(height: 20),
              BlocBuilder<ShowroomAdsBloc, ShowroomAdsState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => _buildInitialState(),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    loaded: (ads, currentPage, totalPages, totalAds) =>
                        _buildAdsList(ads, currentPage, totalPages, totalAds),
                    error: (message) => _buildErrorState(message),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInitialState() {
    return const Center(
      child: Column(
        children: [
          Icon(Icons.ads_click, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            "Loading your ads...",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 16),
          CircularProgressIndicator(),
        ],
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
      child: Column(
        children: [
          const Icon(Icons.error_outline, size: 64, color: Colors.red),
          const SizedBox(height: 16),
          Text(
            message,
            style: const TextStyle(fontSize: 16, color: Colors.red),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildAdsList(
      List<AdModel> ads, int currentPage, int totalPages, int totalAds) {
    if (ads.isEmpty) {
      return const Center(
        child: Column(
          children: [
            Icon(Icons.ads_click, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              "No ads found",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        _buildAdsTable(ads),
        const SizedBox(height: 20),
        _buildPaginationBar(currentPage, totalPages, totalAds),
      ],
    );
  }

  Widget _buildAdsTable(List<AdModel> ads) {
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
                dataRowColor: WidgetStatePropertyAll(AppColors.primaryColor),
                dataRowMinHeight: 60,
                dataRowMaxHeight: 80,
                columns: const [
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
    return DataRow(
      cells: [
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

  Widget _buildPaginationBar(int currentPage, int totalPages, int totalAds) {
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
              value: _itemsPerPage,
              dropdownColor: Colors.white,
              items: [10, 20].map((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _itemsPerPage = value;
                    _currentPage =
                        1; // Reset to first page when changing items per page
                  });
                  if (userId != null) {
                    context.read<ShowroomAdsBloc>().add(
                          FetchUserAds(
                            userId: userId!,
                            page: _currentPage,
                            limit: _itemsPerPage,
                          ),
                        );
                  }
                }
              },
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: currentPage > 1
                  ? () {
                      setState(() {
                        _currentPage = currentPage - 1;
                      });
                      if (userId != null) {
                        context.read<ShowroomAdsBloc>().add(
                              FetchUserAds(
                                userId: userId!,
                                page: _currentPage,
                                limit: _itemsPerPage,
                              ),
                            );
                      }
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
                      setState(() {
                        _currentPage = currentPage + 1;
                      });
                      if (userId != null) {
                        context.read<ShowroomAdsBloc>().add(
                              FetchUserAds(
                                userId: userId!,
                                page: _currentPage,
                                limit: _itemsPerPage,
                              ),
                            );
                      }
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

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
