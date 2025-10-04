import 'package:ado_dad_admin/common/data_storage.dart';
import 'package:ado_dad_admin/features/dashboard/admin_ads_dashboard.dart';
import 'package:ado_dad_admin/features/dashboard/admin_dash.dart';
import 'package:flutter/material.dart';

class RoleBasedDashboard extends StatefulWidget {
  const RoleBasedDashboard({super.key});

  @override
  State<RoleBasedDashboard> createState() => _RoleBasedDashboardState();
}

class _RoleBasedDashboardState extends State<RoleBasedDashboard> {
  String? userType;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserType();
  }

  Future<void> _loadUserType() async {
    final type = await getUserType();
    setState(() {
      userType = type;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    // Show different dashboards based on user type
    switch (userType) {
      case 'SA': // Super Admin
        return const AdminDashboard();
      case 'AD': // Admin
        return const AdminAdsDashboard();
      default:
        // Fallback to Super Admin dashboard for any other user types
        return const AdminDashboard();
    }
  }
}
