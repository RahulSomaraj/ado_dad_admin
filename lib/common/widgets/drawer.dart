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
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateSelectedIndexFromRoute();
  }

  void _updateSelectedIndexFromRoute() {
    final currentRoute = GoRouterState.of(context).uri.toString();
    setState(() {
      selectedIndex = _getIndexFromRoute(currentRoute);
    });
  }

  int _getIndexFromRoute(String route) {
    if (widget.userType == "AD" || widget.userType == "SA") {
      switch (route) {
        case '/dashboard':
          return 0;
        case '/profile':
          return 1;
        case '/users':
        case '/add-user':
        case '/edit-user':
          return 2;
        case '/vehicle-manufactures':
        case '/add-vehiclemanufacturer':
        case '/edit-vehicle_manufacturer':
        case '/view-vehicle_manufacturer':
          return 3;
        case '/vehicle-models':
        case '/add-vehiclemodel':
        case '/edit-vehicle_model':
        case '/view-vehicle_model':
          return 4;
        case '/showrooms':
        case '/add-showroom':
        case '/edit-showroom':
        case '/view-showroom':
          return 5;
        case '/reports':
          return 6;
        case '/notifications':
          return 7;
        case '/banners':
        case '/upload-banners':
        case '/edit-banner':
          return 8;
        default:
          return 0; // Default to dashboard
      }
    } else if (widget.userType == "SR") {
      // Showroom users have limited access - only dashboard and profile
      switch (route) {
        case '/dashboard':
          return 0;
        case '/profile':
          return 1;
        default:
          return 0; // Default to dashboard
      }
    } else {
      switch (route) {
        case '/dashboard':
          return 0;
        case '/profile':
          return 1;
        case '/create-ad':
          return 2;
        default:
          return 0; // Default to dashboard
      }
    }
  }

  Future<void> _saveSelectedIndex(int index) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('selected_index', index);
  }

  Future<void> _clearSelectedIndex() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('selected_index');
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 500,
      backgroundColor: AppColors.primaryColor,
      shape: const ContinuousRectangleBorder(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Image.asset('assets/images/ado-dad-logo.png'),
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
          _clearSelectedIndex();
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
          _showLogoutConfirmationDialog(context);
        },
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                context
                    .read<AuthBloc>()
                    .add(AuthEvent.logout()); // Proceed with logout
              },
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
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
          // _buildDrawerItem(
          //     3, '/vehicles', 'assets/images/listing-icon.png', "Vehicles"),
          _buildDrawerItem(3, '/vehicle-manufactures',
              'assets/images/promotion-icon.png', "Vehicle Manufactures"),
          _buildDrawerItem(4, '/vehicle-models',
              'assets/images/listing-icon.png', "Vehicle Models"),
          // _buildDrawerItem(5, '/vehicle-variants',
          //     'assets/images/listing-icon.png', "Vehicle Variants"),

          // _buildDrawerItem(4, '/vehicle-companies',
          //     'assets/images/promotion-icon.png', "Vehicle Companies"),

          _buildDrawerItem(
              5, '/showrooms', 'assets/images/showroom-icon.png', "Showrooms"),
          _buildDrawerItem(6, '/reports', 'assets/images/report-icon.png',
              "Reports Management"),
          _buildDrawerItem(7, '/notifications',
              'assets/images/notification-icon.png', "Notifications"),
          _buildDrawerItem(8, '/banners', 'assets/images/report-icon.png',
              "Banner Management"),
        ],
      );
    } else if (widget.userType == "SR") {
      // Showroom users have limited access - only dashboard and profile
      return Column(
        children: [
          _buildDrawerItem(
              0, '/dashboard', 'assets/images/dashboard-icon.png', "Dashboard"),
          _buildDrawerItem(1, '/profile', 'assets/images/users.png', "Profile"),
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
      leading: Image.asset(
        image,
        color: selectedIndex == index
            ? AppColors.primaryColor
            : AppColors.blackColor,
      ),
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
          selectedIndex == index ? AppColors.logoColor : Colors.transparent,
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
