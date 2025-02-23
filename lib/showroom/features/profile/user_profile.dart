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
  String? userType;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final name = await getUserName();
    final type = await getUserType();
    final email = await getUserEmail();

    setState(() {
      userType = type;
      userName = name;
      userEmail = email;
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
              height: 200,
              width: 500,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 17),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildProfileRow("Name", userName),
                  _buildProfileRow("Email", userEmail),
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

  Widget _buildProfileRow(String title, String? value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyle.title2Textstyle),
        Text(value ?? "Loading...", style: AppTextStyle.valueTextstyle),
      ],
    );
  }
}
