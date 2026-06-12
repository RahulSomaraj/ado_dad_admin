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
      // For Super Admin (SA), add Advertisements menu item
      if (widget.userType == "SA") {
        switch (route) {
          case '/dashboard':
            return 0;
          case '/profile':
            return 1;
          case '/users':
          case '/add-user':
          case '/edit-user':
          case '/view-user':
            return 2;
          case '/advertisements':
            return 3;
          case '/vehicle-manufactures':
          case '/add-vehiclemanufacturer':
          case '/edit-vehicle_manufacturer':
          case '/view-vehicle_manufacturer':
            return 4;
          case '/vehicle-models':
          case '/add-vehiclemodel':
          case '/edit-vehicle_model':
          case '/view-vehicle_model':
          case '/add-vehiclevariant':
          case '/edit-vehiclevariant':
            return 5;
          case '/showrooms':
          case '/add-showroom':
          case '/edit-showroom':
          case '/view-showroom':
            return 6;
          case '/reports':
          case '/report-detail':
          case '/user-moderation-history':
            return 7;
          case '/notifications':
            return 8;
          case '/banners':
          case '/upload-banners':
          case '/edit-banner':
            return 9;
          case '/suspension-management':
            return 10;
          case '/appeals':
            return 11;
          case '/moderation-settings':
            return 12;
          default:
            return 0; // Default to dashboard
        }
      } else {
        // For Admin (AD), no Advertisements menu
        switch (route) {
          case '/dashboard':
            return 0;
          case '/profile':
            return 1;
          case '/users':
          case '/add-user':
          case '/edit-user':
          case '/view-user':
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
          case '/add-vehiclevariant':
          case '/edit-vehiclevariant':
            return 4;
          case '/showrooms':
          case '/add-showroom':
          case '/edit-showroom':
          case '/view-showroom':
            return 5;
          case '/reports':
          case '/report-detail':
          case '/user-moderation-history':
            return 6;
          case '/notifications':
            return 7;
          case '/banners':
          case '/upload-banners':
          case '/edit-banner':
            return 8;
          case '/suspension-management':
            return 9;
          case '/appeals':
            return 10;
          default:
            return 0; // Default to dashboard
        }
      }
    } else if (widget.userType == "SR") {
      // Showroom users have limited access - only dashboard and profile
      switch (route) {
        case '/dashboard':
          return 0;
        case '/profile':
        case '/edit-showroom':
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Image.asset(
                  'assets/images/splashVector.png',
                  height: 30,
                  // fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Image.asset(
                  'assets/images/Ado Dad11.png',
                  height: 50,
                  // fit: BoxFit.contain,
                ),
              ),
            ],
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
      // Build menu items list
      final menuItems = <Widget>[
        _buildDrawerItem(
            0, '/dashboard', 'assets/images/dashboard-icon.png', "Dashboard"),
        _buildDrawerItem(1, '/profile', 'assets/images/users.png', "Profile"),
        _buildDrawerItem(2, '/users', 'assets/images/users.png', "Users"),
      ];

      // Add Advertisements menu item only for Super Admin (SA)
      if (widget.userType == "SA") {
        menuItems.add(_buildDrawerItem(3, '/advertisements',
            'assets/images/listing-icon.png', "Advertisements"));
      }

      // Add remaining menu items with adjusted indices
      final baseIndex = widget.userType == "SA" ? 4 : 3;
      menuItems.addAll([
        // _buildDrawerItem(
        //     3, '/vehicles', 'assets/images/listing-icon.png', "Vehicles"),
        _buildDrawerItem(baseIndex, '/vehicle-manufactures',
            'assets/images/promotion-icon.png', "Vehicle Manufactures"),
        _buildDrawerItem(baseIndex + 1, '/vehicle-models',
            'assets/images/listing-icon.png', "Vehicle Models"),
        // _buildDrawerItem(5, '/vehicle-variants',
        //     'assets/images/listing-icon.png', "Vehicle Variants"),

        // _buildDrawerItem(4, '/vehicle-companies',
        //     'assets/images/promotion-icon.png', "Vehicle Companies"),

        _buildDrawerItem(baseIndex + 2, '/showrooms',
            'assets/images/showroom-icon.png', "Showrooms"),
        _buildDrawerItem(baseIndex + 3, '/reports',
            'assets/images/report-icon.png', "Reports Management"),
        _buildDrawerItem(baseIndex + 4, '/notifications',
            'assets/images/notification-icon.png', "Notifications"),
        _buildDrawerItem(baseIndex + 5, '/banners',
            'assets/images/report-icon.png', "Banner Management"),
        _buildDrawerItem(baseIndex + 6, '/suspension-management',
            'assets/images/report-icon.png', "Suspensions"),
        _buildDrawerItem(baseIndex + 7, '/appeals',
            'assets/images/report-icon.png', "Appeals"),
        if (widget.userType == "SA")
          _buildDrawerItem(baseIndex + 8, '/moderation-settings',
              'assets/images/promotion-icon.png', "Moderation Settings"),
      ]);

      return Column(children: menuItems);
    } else if (widget.userType == "SR") {
      // Showroom users have limited access - only dashboard, profile, and logout
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
          selectedIndex == index ? AppColors.primaryColor1 : Colors.transparent,
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
