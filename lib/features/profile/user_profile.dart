import 'package:ado_dad_admin/common/data_storage.dart';
import 'package:ado_dad_admin/common/text_style.dart';
import 'package:ado_dad_admin/models/login_model.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
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

  Future<void> _loadUserData() async {
    final name = await getUserName();
    final type = await getUserType();
    final email = await getUserEmail();
    final phone = await getUserPhoneNumber();
    final profilePic = await getUserProfilePicture();

    print('🔍 Profile: Loaded user data:');
    print('🔍 Profile: Name: $name');
    print('🔍 Profile: Email: $email');
    print('🔍 Profile: Phone: $phone');
    print('🔍 Profile: User Type: $type');
    print('🔍 Profile: Profile Pic: "$profilePic"');

    setState(() {
      userType = type;
      userName = name;
      userEmail = email;
      userPhone = phone;
      userProfilePic = profilePic;
    });
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
}
