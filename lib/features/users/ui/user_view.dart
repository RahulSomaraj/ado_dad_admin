import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ado_dad_admin/models/user_model.dart';
import 'package:ado_dad_admin/models/ad_model.dart';
import 'package:ado_dad_admin/features/users/bloc/user_ads_bloc.dart';
import 'package:ado_dad_admin/features/users/bloc/user_ads_event.dart';
import 'package:ado_dad_admin/features/users/bloc/user_ads_state.dart';

class UserView extends StatefulWidget {
  final UserModel user;

  const UserView({super.key, required this.user});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  int _currentPage = 1;
  int _itemsPerPage = 10;
  int _totalAds = 0;
  final ScrollController _horizontalScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Trigger the bloc to fetch user ads
    print(
        '👤 UserView: Fetching ads for user: ${widget.user.name} (ID: ${widget.user.id})');
    context
        .read<UserAdsBloc>()
        .add(UserAdsEvent.fetchUserAds(userId: widget.user.id));
  }

  @override
  void dispose() {
    _horizontalScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHeaderSection(context),
          const SizedBox(height: 10),
          _buildUserProfileSection(),
          const SizedBox(height: 30),
          _buildUserAdsSection(),
          const SizedBox(height: 50), // Add bottom padding
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
              },
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "User Details",
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

  /// User Profile Section with Avatar and Details
  Widget _buildUserProfileSection() {
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
        color: Colors.yellow.shade100,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
        border: Border.all(color: Colors.yellow.shade300),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Profile Picture with Circle Avatar
          _buildProfilePicture(),
          const SizedBox(height: 16),
          // Name below the avatar
          Text(
            widget.user.name,
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
        child:
            widget.user.profilePic != null && widget.user.profilePic!.isNotEmpty
                ? Image.network(
                    widget.user.profilePic!,
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
        Icons.person,
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
        // borderRadius: BorderRadius.circular(12),
        // border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Email and Phone in same row
          Row(
            children: [
              Expanded(
                child: _buildDetailItem("Email", widget.user.email),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildDetailItem("Phone", widget.user.phoneNumber),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // User Type and Total Ads in same row
          Row(
            children: [
              Expanded(
                child: _buildDetailItem(
                    "User Type", _getUserTypeDisplay(widget.user.userType)),
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
        return 'Normal User';
    }
  }

  /// User Ads Section
  Widget _buildUserAdsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        // Text(
        //   "User's Ads",
        //   style: const TextStyle(
        //     fontSize: 20,
        //     fontWeight: FontWeight.bold,
        //     color: Colors.black87,
        //   ),
        // ),
        const SizedBox(height: 10),

        // Ads Table with BlocBuilder
        BlocBuilder<UserAdsBloc, UserAdsState>(
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
              loaded: (ads, total) {
                // Update total ads count
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (mounted) {
                    setState(() {
                      _totalAds = total;
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
                            'No ads found for this user',
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
                      _buildPagination(ads),
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
                                UserAdsEvent.refreshUserAds(
                                    userId: widget.user.id),
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
        ),
      ],
    );
  }

  /// Ads Table Widget
  Widget _buildAdsTable(List<AdModel> ads) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
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
                        'Description',
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
                  rows: _getPaginatedAds(ads)
                      .map((ad) => _buildAdRow(ad))
                      .toList(),
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
              ad.description,
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
    return '${date.day}/${date.month}/${date.year}';
  }

  /// Get paginated ads for current page
  List<AdModel> _getPaginatedAds(List<AdModel> allAds) {
    final startIndex = (_currentPage - 1) * _itemsPerPage;
    final endIndex = startIndex + _itemsPerPage;
    return allAds.sublist(
      startIndex,
      endIndex > allAds.length ? allAds.length : endIndex,
    );
  }

  /// Get total pages for pagination
  int _getTotalPages(List<AdModel> allAds) {
    return (allAds.length / _itemsPerPage).ceil();
  }

  /// Build pagination widget
  Widget _buildPagination(List<AdModel> allAds) {
    final totalPages = _getTotalPages(allAds);

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
                }
              },
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: _currentPage > 1
                  ? () {
                      setState(() => _currentPage--);
                    }
                  : null,
              child: Icon(
                Icons.chevron_left,
                size: 28,
                color: _currentPage > 1 ? Colors.black : Colors.grey[400],
              ),
            ),
            const SizedBox(width: 15),
            Text(
              "Page $_currentPage of $totalPages",
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 15),
            GestureDetector(
              onTap: _currentPage < totalPages
                  ? () {
                      setState(() => _currentPage++);
                    }
                  : null,
              child: Icon(
                Icons.chevron_right,
                size: 28,
                color:
                    _currentPage < totalPages ? Colors.black : Colors.grey[400],
              ),
            ),
          ],
        ),
      ),
    );
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
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
              );
            },
          ),
        ),
      );
    } else {
      return _buildImagePlaceholder();
    }
  }

  /// Build image placeholder when no image is available
  Widget _buildImagePlaceholder() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: const Center(
        child: Icon(
          Icons.image_not_supported_outlined,
          color: Colors.grey,
          size: 24,
        ),
      ),
    );
  }
}
