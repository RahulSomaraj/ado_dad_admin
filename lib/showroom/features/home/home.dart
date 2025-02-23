import 'package:ado_dad_admin/common/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  final int selectedPage;
  const Home({super.key, this.selectedPage = 0});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? userType;

  @override
  void initState() {
    super.initState();
    _loadUserType();
  }

  Future<void> _loadUserType() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userType = prefs.getString("UserType") ?? "user";
    });
  }

  @override
  Widget build(BuildContext context) {
    if (userType == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: 250,
            child: AdminDrawer(
              selectedIndex: widget.selectedPage,
              userType: userType,
            ),
          ),
          Expanded(
            child: _buildContent(widget.selectedPage),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(int index) {
    if (userType == "user") {
      return _buildUserContent(index);
    } else {
      return _buildAdminContent(index);
    }
  }

  Widget _buildUserContent(int index) {
    switch (index) {
      case 0:
        return const Center(child: Text("Dashboard Content"));
      case 1:
        return const Center(child: Text("Profile Content"));
      case 2:
        return const Center(child: Text("Ad List Content"));
      case 3:
        return const Center(child: Text("Logout Content"));
      default:
        return const Center(child: Text("Page Not Found"));
    }
  }

  Widget _buildAdminContent(int index) {
    switch (index) {
      case 0:
        return const Center(child: Text("Dashboard Content"));
      case 1:
        return const Center(child: Text("Ad Content"));
      case 2:
        return const Center(child: Text("Listing Management Content"));
      case 3:
        return const Center(child: Text("Ad and Promotion Content"));
      case 4:
        return const Center(child: Text("Showrooms Content"));
      case 5:
        return const Center(child: Text("Reports Management Content"));
      case 6:
        return const Center(child: Text("Notifications Content"));
      case 7:
        return const Center(child: Text("Logout Content"));
      case 8:
        return const Center(child: Text("xxxx Content"));
      default:
        return const Center(child: Text("Page Not Found"));
    }
  }
}
