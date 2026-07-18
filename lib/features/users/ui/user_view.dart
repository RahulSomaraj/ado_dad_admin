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
    // Trigger the bloc to fetch user ads with pagination
    print(
        '👤 UserView: Fetching ads for user: ${widget.user.name} (ID: ${widget.user.id})');
    context.read<UserAdsBloc>().add(
          UserAdsEvent.fetchUserAds(
            userId: widget.user.id,
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
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHeaderSection(context),
          const SizedBox(height: 20),
          _buildStatisticsCards(),
          const SizedBox(height: 20),
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

  /// Statistics Cards Section
  Widget _buildStatisticsCards() {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1200),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: _buildStatCard(
                'Total Ads',
                _totalAds.toString(),
                Icons.inventory_2_outlined,
                Colors.blue,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildStatCard(
                'User Type',
                _getUserTypeDisplay(widget.user.userType),
                Icons.person_outline,
                Colors.purple,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildStatCard(
                'Account Status',
                widget.user.isDeleted == true ? 'Deleted' : 'Active',
                widget.user.isDeleted == true
                    ? Icons.delete_outline
                    : Icons.check_circle_outline,
                widget.user.isDeleted == true ? Colors.red : Colors.green,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildStatCard(
                'User ID',
                widget.user.id.length > 8
                    ? '${widget.user.id.substring(0, 8)}...'
                    : widget.user.id,
                Icons.badge_outlined,
                Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Build Statistics Card
  Widget _buildStatCard(String label, String value, IconData icon, Color color) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: color, size: 24),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  /// User Profile Section with Avatar and Details
  Widget _buildUserProfileSection() {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1200),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Card(
          elevation: 5,
          color: AppColors.primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // First Container - Profile Picture and Name
              Expanded(
                flex: 1,
                child: _buildProfileContainer(),
              ),
              const SizedBox(width: 20),
              // Second Container - All Details in Grid
              Expanded(
                flex: 2,
                child: _buildDetailsContainer(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// First Container - Profile Picture and Name with Background
  Widget _buildProfileContainer() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.primaryColor1.withOpacity(0.1),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
        border: Border.all(color: AppColors.primaryColor1.withOpacity(0.3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Profile Picture with Circle Avatar
          _buildProfilePicture(),
          const SizedBox(height: 20),
          // Name below the avatar
          Text(
            widget.user.name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          // User ID badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'ID: ${widget.user.id.length > 10 ? "${widget.user.id.substring(0, 10)}..." : widget.user.id}',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Profile Picture with Circle Avatar
  Widget _buildProfilePicture() {
    return Container(
      width: 140,
      height: 140,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.primaryColor1.withOpacity(0.5),
          width: 4,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
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
        gradient: LinearGradient(
          colors: [
            AppColors.primaryColor1.withOpacity(0.3),
            AppColors.primaryColor1.withOpacity(0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Icon(
        Icons.person,
        size: 70,
        color: Colors.black54,
      ),
    );
  }

  /// Second Container - All Details in Grid
  Widget _buildDetailsContainer() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "User Information",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 24),
          // First Row - Email and Phone
          Row(
            children: [
              Expanded(
                child: _buildDetailItemWithIcon(
                  Icons.email_outlined,
                  "Email",
                  widget.user.email,
                  Colors.blue,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildDetailItemWithIcon(
                  Icons.phone_outlined,
                  "Phone",
                  _formatPhoneNumber(),
                  Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Second Row - Username (if available) and User Type
          Row(
            children: [
              Expanded(
                child: _buildDetailItemWithIcon(
                  Icons.alternate_email,
                  "Username",
                  widget.user.username ?? 'Not provided',
                  Colors.purple,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildDetailItemWithIcon(
                  Icons.person_outline,
                  "User Type",
                  _getUserTypeDisplay(widget.user.userType),
                  Colors.orange,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Third Row - Created At and Updated At
          Row(
            children: [
              Expanded(
                child: _buildDetailItemWithIcon(
                  Icons.calendar_today_outlined,
                  "Account Created",
                  widget.user.createdAt != null
                      ? _formatDateTime(widget.user.createdAt!)
                      : 'Not available',
                  Colors.teal,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildDetailItemWithIcon(
                  Icons.update_outlined,
                  "Last Updated",
                  widget.user.updatedAt != null
                      ? _formatDateTime(widget.user.updatedAt!)
                      : 'Not available',
                  Colors.indigo,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Fourth Row - Account Status and Total Ads
          Row(
            children: [
              Expanded(
                child: _buildDetailItemWithIcon(
                  widget.user.isDeleted == true
                      ? Icons.delete_outline
                      : Icons.check_circle_outline,
                  "Account Status",
                  widget.user.isDeleted == true ? 'Deleted' : 'Active',
                  widget.user.isDeleted == true ? Colors.red : Colors.green,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildDetailItemWithIcon(
                  Icons.inventory_2_outlined,
                  "Total Ads",
                  _totalAds.toString(),
                  Colors.blueGrey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Individual Detail Item with Icon
  Widget _buildDetailItemWithIcon(
      IconData icon, String label, String value, Color iconColor) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 20, color: iconColor),
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ],
      ),
    );
  }

  /// Individual Detail Item (keeping for backwards compatibility if needed)
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

  /// Format DateTime for display
  String _formatDateTime(DateTime date) {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}, ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
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

  /// Format phone number with country code
  String _formatPhoneNumber() {
    String phoneNumber = widget.user.phoneNumber;
    String? countryCode = widget.user.countryCode;

    if (countryCode != null && countryCode.isNotEmpty) {
      // If country code doesn't start with +, add it
      String formattedCountryCode =
          countryCode.startsWith('+') ? countryCode : '+$countryCode';
      return '$formattedCountryCode $phoneNumber';
    }

    return phoneNumber;
  }

  /// User Ads Section
  Widget _buildUserAdsSection() {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Icon(Icons.inventory_2_outlined,
                    color: Colors.black87, size: 24),
                const SizedBox(width: 8),
                const Text(
                  "User's Ads",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor1.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Total: $_totalAds',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

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
                                UserAdsEvent.refreshUserAds(
                                  userId: widget.user.id,
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
        ),
        ],
      ),
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
                          userId: widget.user.id,
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
                              userId: widget.user.id,
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
                              userId: widget.user.id,
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
