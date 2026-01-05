import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/common/data_storage.dart';
import 'package:ado_dad_admin/common/text_style.dart';
import 'package:ado_dad_admin/models/login_model.dart';
import 'package:ado_dad_admin/models/user_model.dart';
import 'package:ado_dad_admin/repositories/user_rep.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> with RouteAware {
  String? userName;
  String? userEmail;
  String? userPhone;
  String? userType;
  String? userProfilePic;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Only refresh if we're actually on the profile route
    final currentRoute = GoRouterState.of(context).uri.toString();
    if (currentRoute == '/profile') {
      _loadUserData();
    }
  }

  @override
  void didPopNext() {
    // Called when returning to this route from another route
    super.didPopNext();
    if (mounted) {
      // Always refresh data when returning to profile page
      _loadUserData();
    }
  }

  Future<void> _loadUserData() async {
    print('🔍 Profile: _loadUserData called');

    // Always get the logged-in user's ID first to ensure we're loading the correct user's data
    final loggedInUserId = await getUserId();
    if (loggedInUserId == null) {
      print('🔍 Profile: No logged-in user ID found');
      return;
    }

    final name = await getUserName();
    final type = await getUserType();
    final email = await getUserEmail();
    final phone = await getUserPhoneNumber();
    final profilePic = await getUserProfilePicture();

    print(
        '🔍 Profile: Loaded user data for logged-in user ID: $loggedInUserId');
    print('🔍 Profile: Name: $name');
    print('🔍 Profile: Email: $email');
    print('🔍 Profile: Phone: $phone');
    print('🔍 Profile: User Type: $type');
    print('🔍 Profile: Profile Pic: "$profilePic"');

    // Verify that we're loading the logged-in user's data
    // This ensures that even if stored data was accidentally updated, we only show logged-in user's info
    if (mounted) {
      setState(() {
        userType = type;
        userName = name;
        userEmail = email;
        userPhone = phone;
        userProfilePic = profilePic;
      });
      print('🔍 Profile: setState called with updated data');
    } else {
      print('🔍 Profile: Widget not mounted, skipping setState');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(30),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Text(
                    "My Profile",
                    style: AppTextStyle.titleTextstyle,
                  ),
                  Text(
                    "",
                    style: AppTextStyle.titleTextstyle,
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              width: 500,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  // Header row with title and edit icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                          width: 1), // Spacer to balance the edit icon
                      // Edit icon for SR, AD, and SA users in top right corner
                      if (userType == 'SR' ||
                          userType == 'AD' ||
                          userType == 'SA')
                        GestureDetector(
                          onTap: _navigateToEditProfile,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(
                              Icons.edit,
                              color: AppColors.blackColor,
                              size: 20,
                            ),
                          ),
                        )
                      else
                        const SizedBox(
                            width: 36), // Maintain consistent spacing
                    ],
                  ),
                  // Profile Picture and Name Row
                  _buildProfilePictureAndNameRow(),
                  const SizedBox(height: 20),
                  const Divider(),
                  const SizedBox(height: 20),
                  // Remaining Details
                  _buildProfileRow("Email", userEmail),
                  const SizedBox(height: 15),
                  _buildProfileRow("Phone", userPhone),
                  const SizedBox(height: 15),
                  _buildProfileRow(
                      "User Type", getFullUserType(userType ?? "NU")),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProfilePictureAndNameRow() {
    return Row(
      children: [
        // Profile Picture Circle Avatar
        Builder(
          builder: (context) {
            final profileImage = _getProfileImage();
            print(
                '🔍 Profile: CircleAvatar - profileImage is null: ${profileImage == null}');
            return CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey.shade300,
              backgroundImage: profileImage,
              child: profileImage == null
                  ? Text(
                      _getInitials(userName ?? "User"),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  : null,
            );
          },
        ),
        const SizedBox(width: 20),
        // Name
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Name",
                style: AppTextStyle.valueTextstyle.copyWith(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                userName ?? "Loading...",
                style: AppTextStyle.valueTextstyle.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  ImageProvider? _getProfileImage() {
    print('🔍 Profile: _getProfileImage called');
    print('🔍 Profile: userProfilePic = "$userProfilePic"');

    if (userProfilePic != null &&
            userProfilePic!.isNotEmpty &&
            userProfilePic != 'default-profile-pic-url'
        // userProfilePic!.startsWith('http')
        ) {
      print('🔍 Profile: Returning NetworkImage for: $userProfilePic');
      return NetworkImage(userProfilePic!);
    }
    print('🔍 Profile: Returning null - no valid profile image');
    return null;
  }

  String _getInitials(String name) {
    final words = name.trim().split(RegExp(r'\s+'));
    if (words.length > 1) {
      return "${words[0][0].toUpperCase()}${words[1][0].toUpperCase()}";
    }
    return words[0][0].toUpperCase();
  }

  Widget _buildProfileRow(String title, String? value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyle.valueTextstyle),
        Text(value ?? "Loading...", style: AppTextStyle.valueTextstyle),
      ],
    );
  }

  void _navigateToEditProfile() async {
    // Get user ID from storage
    final userId = await getUserId();

    if (userId != null && userName != null && userEmail != null && mounted) {
      UserModel? currentUser;

      // Try to fetch the latest user data from API to get countryCode
      try {
        final userRepository = UserRepository();
        final userResponse =
            await userRepository.fetchAllUsers(page: 1, limit: 1000);
        final userFromApi = userResponse.users.firstWhere(
          (user) => user.id == userId,
          orElse: () => UserModel(
            id: userId,
            name: userName!,
            email: userEmail!,
            phoneNumber: userPhone ?? '',
            userType: userType ?? 'SR',
          ),
        );
        currentUser = userFromApi;
      } catch (e) {
        // If API call fails, use data from storage
        print(
            '🔍 Profile: Failed to fetch user from API, using storage data: $e');
        final countryCode = await getUserCountryCode();
        currentUser = UserModel(
          id: userId,
          name: userName!,
          email: userEmail!,
          phoneNumber:
              userPhone ?? '', // Use stored phone number or empty string
          userType: userType ?? 'SR',
          profilePic:
              userProfilePic ?? '', // Use stored profile pic or empty string
          countryCode: countryCode, // Include country code from storage
        );
      }

      // Navigate to edit page using GoRouter
      if (mounted) {
        // Determine which edit route to use based on user type
        final editRoute = userType == 'SR' ? '/edit-showroom' : '/edit-user';
        await context.push(editRoute, extra: currentUser);
        // Always refresh data when returning from edit page
        if (mounted) {
          _loadUserData();
        }
      }
    }
  }
}
