import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/common/text_style.dart';
import 'package:ado_dad_admin/showroom/features/login/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AdminDrawer extends StatefulWidget {
  final int selectedIndex;
  final String? userType;

  const AdminDrawer({
    super.key,
    required this.selectedIndex,
    required this.userType,
  });

  @override
  State<AdminDrawer> createState() => _AdminDrawerState();
}

class _AdminDrawerState extends State<AdminDrawer> {
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

  /// Builds the logout button with state listening
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

  /// Builds drawer menu items based on userType
  Widget _buildDrawerMenu() {
    if (widget.userType == 'admin') {
      return Column(
        children: [
          _buildDrawerItem(
              0, '/home', 'assets/images/dashboard-icon.png', "Dashboard"),
          _buildDrawerItem(1, '/users', 'assets/images/users.png', "Users"),
          _buildDrawerItem(2, '/listing-management',
              'assets/images/listing-icon.png', "Listing Management"),
          _buildDrawerItem(3, '/promotion', 'assets/images/promotion-icon.png',
              "Ad and Promotion"),
          _buildDrawerItem(
              4, '/showrooms', 'assets/images/showroom-icon.png', "Showrooms"),
          _buildDrawerItem(5, '/reports', 'assets/images/report-icon.png',
              "Reports Management"),
          _buildDrawerItem(6, '/notifications',
              'assets/images/notification-icon.png', "Notifications"),
        ],
      );
    } else {
      return Column(
        children: [
          _buildDrawerItem(
              0, '/home', 'assets/images/dashboard-icon.png', "Dashboard"),
          _buildDrawerItem(1, '/profile', 'assets/images/users.png', "Profile"),
          _buildDrawerItem(2, '/listing-management',
              'assets/images/listing-icon.png', "Add Advertisement"),
        ],
      );
    }
  }

  /// Helper method to create a drawer item
  Widget _buildDrawerItem(int index, String route, String image, String title) {
    return ListTile(
      leading: Image.asset(image),
      title: Text(
        title,
        style: AppTextStyle.drawerTextstyle.copyWith(
          color: widget.selectedIndex == index
              ? AppColors.primaryColor
              : AppColors.blackColor,
        ),
      ),
      tileColor:
          widget.selectedIndex == index ? Colors.black26 : Colors.transparent,
      onTap: () {
        context.go(route);
      },
    );
  }
}
