import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/features/showroom/bloc/showroom_bloc.dart';
import 'package:ado_dad_admin/models/user_model.dart';
import 'package:ado_dad_admin/models/ad_model.dart';
import 'package:ado_dad_admin/features/users/bloc/user_ads_bloc.dart';
import 'package:ado_dad_admin/features/users/bloc/user_ads_event.dart';
import 'package:ado_dad_admin/features/users/bloc/user_ads_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ShowroomDetailView extends StatefulWidget {
  final UserModel showroomuser;
  const ShowroomDetailView({super.key, required this.showroomuser});

  @override
  State<ShowroomDetailView> createState() => _ShowroomDetailViewState();
}

class _ShowroomDetailViewState extends State<ShowroomDetailView> {
  int _currentPage = 1;
  int _itemsPerPage = 10;
  int _totalAds = 0;
  final ScrollController _horizontalScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Trigger the bloc to fetch showroom ads with pagination
    context.read<UserAdsBloc>().add(
          UserAdsEvent.fetchUserAds(
            userId: widget.showroomuser.id,
            page: _currentPage,
            limit: _itemsPerPage,
          ),
        );
  }

  @override
  void dispose() {
    _horizontalScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          _buildHeaderSection(context),
          const SizedBox(height: 30),
          _buildShowroomProfileSection(),
          const SizedBox(height: 30),
          _buildAdsSection(),
        ],
      ),
    );
  }

  /// Header Section with Back Button
  Widget _buildHeaderSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new,
                  color: AppColors.blackColor),
              onPressed: () {
                context.pop();
                context.read<ShowroomBloc>().add(FetchAllShowrooms());
              },
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Showroom Details",
                style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Showroom Profile Section with Avatar and Details
  Widget _buildShowroomProfileSection() {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1070),
      child: Card(
        elevation: 5,
        color: AppColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            // First Container - Profile Picture and Name
            Expanded(
              flex: 1,
              child: _buildProfileContainer(),
            ),
            const SizedBox(width: 20),
            // Second Container - Email, Phone, User Type
            Expanded(
              flex: 2,
              child: _buildDetailsContainer(),
            ),
          ],
        ),
      ),
    );
  }

  /// First Container - Profile Picture and Name with Yellow Background
  Widget _buildProfileContainer() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primaryColor1.withOpacity(0.1),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
        border: Border.all(color: AppColors.primaryColor1.withOpacity(0.3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Profile Picture with Circle Avatar
          _buildProfilePicture(),
          const SizedBox(height: 16),
          // Name below the avatar
          Text(
            widget.showroomuser.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  /// Profile Picture with Circle Avatar
  Widget _buildProfilePicture() {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.grey.shade300,
          width: 3,
        ),
      ),
      child: ClipOval(
        child: (widget.showroomuser.profilePic?.isNotEmpty == true)
            ? Image.network(
                widget.showroomuser.profilePic!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    _buildDefaultAvatar(),
              )
            : _buildDefaultAvatar(),
      ),
    );
  }

  /// Default Avatar when no profile picture
  Widget _buildDefaultAvatar() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.shade200,
      ),
      child: const Icon(
        Icons.business,
        size: 60,
        color: Colors.grey,
      ),
    );
  }

  /// Second Container - Email, Phone, User Type
  Widget _buildDetailsContainer() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Email and Phone in same row
          Row(
            children: [
              Expanded(
                child: _buildDetailItem("Email", widget.showroomuser.email),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildDetailItem("Phone", _formatPhoneNumber()),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // User Type and Total Ads in same row
          Row(
            children: [
              Expanded(
                child: _buildDetailItem("User Type",
                    _getUserTypeDisplay(widget.showroomuser.userType)),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildDetailItem("Total Ads", _totalAds.toString()),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Individual Detail Item
  Widget _buildDetailItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black87,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  /// Convert user type code to display text
  String _getUserTypeDisplay(String? userType) {
    switch (userType) {
      case 'SA':
        return 'Super Admin';
      case 'AD':
        return 'Admin';
      case 'NU':
        return 'Normal User';
      case 'SR':
        return 'Showroom';
      default:
        return 'Showroom';
    }
  }

  /// Format phone number with country code
  String _formatPhoneNumber() {
    String phoneNumber = widget.showroomuser.phoneNumber;
    String? countryCode = widget.showroomuser.countryCode;

    if (countryCode != null && countryCode.isNotEmpty) {
      // If country code doesn't start with +, add it
      String formattedCountryCode =
          countryCode.startsWith('+') ? countryCode : '+$countryCode';
      return '$formattedCountryCode $phoneNumber';
    }

    return phoneNumber;
  }

  Widget _buildAdsSection() {
    return BlocBuilder<UserAdsBloc, UserAdsState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(
            child: Padding(
              padding: EdgeInsets.all(40.0),
              child: Text('Loading...'),
            ),
          ),
          loading: () => const Center(
            child: Padding(
              padding: EdgeInsets.all(40.0),
              child: CircularProgressIndicator(),
            ),
          ),
          loaded: (ads, total, currentPage, totalPages) {
            // Update total ads count and current page
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted) {
                setState(() {
                  _totalAds = total;
                  _currentPage = currentPage;
                });
              }
            });
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
                        'No ads found for this showroom',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Column(
                children: [
                  _buildAdsTable(ads),
                  const SizedBox(height: 20),
                  _buildPagination(totalPages, currentPage),
                ],
              );
            }
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
                    message,
                    style: const TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<UserAdsBloc>().add(
                            UserAdsEvent.fetchUserAds(
                              userId: widget.showroomuser.id,
                              page: _currentPage,
                              limit: _itemsPerPage,
                            ),
                          );
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAdsTable(List<AdModel> ads) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Scrollbar(
              controller: _horizontalScrollController,
              thumbVisibility: true,
              trackVisibility: true,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: _horizontalScrollController,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 1000),
                  child: DataTable(
                    columnSpacing: 100,
                    headingRowColor: WidgetStateColor.resolveWith(
                        (states) => Color.fromARGB(66, 144, 140, 140)),
                    dataRowColor:
                        WidgetStatePropertyAll(AppColors.primaryColor),
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
                          'Posted Date',
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
        ),
      ),
    );
  }

  /// Build individual ad row
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
                style: TextStyle(
                  fontSize: 11,
                  color: ad.soldOut ? Colors.white : Colors.white,
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

  /// Build ad image widget
  Widget _buildAdImage(AdModel ad) {
    if (ad.images.isNotEmpty) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            ad.images.first,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                _buildImagePlaceholder(),
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                color: Colors.grey.shade200,
                child: const Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
    }
    return _buildImagePlaceholder();
  }

  /// Build image placeholder
  Widget _buildImagePlaceholder() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: const Center(
        child: Icon(
          Icons.image_not_supported,
          color: Colors.grey,
          size: 24,
        ),
      ),
    );
  }

  /// Format category for display
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

  /// Format date for display
  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }

  /// Build pagination widget
  Widget _buildPagination(int totalPages, int currentPage) {
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
                  context.read<UserAdsBloc>().add(
                        UserAdsEvent.fetchUserAds(
                          userId: widget.showroomuser.id,
                          page: 1,
                          limit: value,
                        ),
                      );
                }
              },
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: currentPage > 1
                  ? () {
                      final newPage = currentPage - 1;
                      context.read<UserAdsBloc>().add(
                            UserAdsEvent.fetchUserAds(
                              userId: widget.showroomuser.id,
                              page: newPage,
                              limit: _itemsPerPage,
                            ),
                          );
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
                      final newPage = currentPage + 1;
                      context.read<UserAdsBloc>().add(
                            UserAdsEvent.fetchUserAds(
                              userId: widget.showroomuser.id,
                              page: newPage,
                              limit: _itemsPerPage,
                            ),
                          );
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
