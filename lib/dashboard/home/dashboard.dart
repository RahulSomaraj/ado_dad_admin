import 'package:ado_dad_admin/dashboard/user/user_edit_main.dart';
import 'package:flutter/material.dart';
import 'package:ado_dad_admin/core/widgets/left_bar.dart';
import 'package:ado_dad_admin/features/home/homescreen.dart';
import 'package:ado_dad_admin/features/users/users.dart';
import 'package:ado_dad_admin/dashboard/user/user_detailed_main.dart';

class HomeDashBoard extends StatefulWidget {
  final int initialIndex;
  const HomeDashBoard({super.key, required this.initialIndex});

  @override
  State<HomeDashBoard> createState() => _HomeDashBoardState();
}

class _HomeDashBoardState extends State<HomeDashBoard> {
  late int _selectedIndex;
  late String _selectedId;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex; // Initialize _selectedIndex properly
    _selectedId = '';
    // Pages corresponding to sidebar selections
  }

  // Method to dynamically rebuild _pages
  List<Widget> get _pages {
    return [
      const HomePage(),
      UserListPage(
        onDetailedPage: _onDetailedPage,
        onEditPage: _onEditPage,
      ),
      const HomePage(),
      const HomePage(),
      UserEditPage(
        userId: _selectedId,
        onGoBack: _onGoBack,
        onEditPage: _onEditPage,
      ),
      UserDetailPage(
        userId: _selectedId,
        onEditPage: _onEditPage,
        onGoBack: _onGoBack,
      ),
    ];
  }

  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onDetailedPage(int detailPageIndex, String selectedId) {
    setState(() {
      print("selectedId");
      print(selectedId);
      _selectedIndex = detailPageIndex;
      _selectedId = selectedId;
    });
  }

  void _onEditPage(int editPageIndex, String selectedId) {
    setState(() {
      _selectedIndex = editPageIndex;
      _selectedId = selectedId;
    });
  }

  void _onGoBack(int previousPageIndex) {
    setState(() {
      _selectedIndex = previousPageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar (left navigation)
          AppSidebar(
            selectedIndex: _selectedIndex,
            onItemSelected: _onItemSelected,
          ),

          // Main content that changes based on selected index
          Expanded(
            child: _pages[_selectedIndex], // Dynamically switch page
          ),
        ],
      ),
    );
  }
}
