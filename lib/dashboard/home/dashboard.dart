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

  // Pages corresponding to sidebar selections
  final List<Widget> _pages = [
    const HomePage(),
    UserDetailPage(userId: '677fd507508e1efec1072ba7'),
    const HomePage(),
    UserListPage(),
    const HomePage(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex; // Initialize _selectedIndex properly
  }

  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onDetailedPage(int detailPageIndex) {
    setState(() {
      _selectedIndex = detailPageIndex;
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
