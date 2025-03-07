import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/common/text_style.dart';
import 'package:ado_dad_admin/features/login/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminDrawer extends StatefulWidget {
  final String? userType;

  const AdminDrawer({
    super.key,
    required this.userType,
  });

  @override
  State<AdminDrawer> createState() => _AdminDrawerState();
}

class _AdminDrawerState extends State<AdminDrawer> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadSelectedIndex();
  }

  Future<void> _loadSelectedIndex() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedIndex = prefs.getInt('selected_index') ?? 0;
    });
  }

  Future<void> _saveSelectedIndex(int index) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('selected_index', index);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 500,
      backgroundColor: Colors.grey[300],
      shape: const ContinuousRectangleBorder(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Image.asset('assets/images/Ado-dad.png'),
          ),
          const Divider(),
          _buildDrawerMenu(),
          const Divider(),
          _buildLogoutButton(context),
        ],
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Initial) {
          context.replace('/');
        }
      },
      child: ListTile(
        leading: Image.asset('assets/images/logout-icon.png'),
        title: Text(
          'Logout',
          style: AppTextStyle.drawerTextstyle.copyWith(
            color: AppColors.blackColor,
          ),
        ),
        onTap: () {
          context.read<AuthBloc>().add(AuthEvent.logout());
        },
      ),
    );
  }

  Widget _buildDrawerMenu() {
    if (widget.userType == "AD" || widget.userType == "SA") {
      return Column(
        children: [
          _buildDrawerItem(
              0, '/dashboard', 'assets/images/dashboard-icon.png', "Dashboard"),
          _buildDrawerItem(1, '/profile', 'assets/images/users.png', "Profile"),
          _buildDrawerItem(2, '/users', 'assets/images/users.png', "Users"),
          _buildDrawerItem(
              3, '/vehicles', 'assets/images/listing-icon.png', "Vehicles"),
          _buildDrawerItem(4, '/vehicle-companies',
              'assets/images/promotion-icon.png', "Vehicle Companies"),
          _buildDrawerItem(
              5, '/showrooms', 'assets/images/showroom-icon.png', "Showrooms"),
          _buildDrawerItem(6, '/reports', 'assets/images/report-icon.png',
              "Reports Management"),
          _buildDrawerItem(7, '/notifications',
              'assets/images/notification-icon.png', "Notifications"),
        ],
      );
    } else {
      return Column(
        children: [
          _buildDrawerItem(
              0, '/dashboard', 'assets/images/dashboard-icon.png', "Dashboard"),
          _buildDrawerItem(1, '/profile', 'assets/images/users.png', "Profile"),
          _buildDrawerItem(2, '/create-ad', 'assets/images/listing-icon.png',
              "Add Advertisement"),
        ],
      );
    }
  }

  Widget _buildDrawerItem(int index, String route, String image, String title) {
    return ListTile(
      leading: Image.asset(image),
      title: Text(
        title,
        style: AppTextStyle.drawerTextstyle.copyWith(
          color: selectedIndex == index
              ? AppColors.primaryColor
              : AppColors.blackColor,
          fontWeight:
              selectedIndex == index ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      tileColor:
          selectedIndex == index ? AppColors.greyColor2 : Colors.transparent,
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
        _saveSelectedIndex(index);
        context.go(route);
      },
    );
  }
}
