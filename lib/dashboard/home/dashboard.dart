import 'package:ado_dad_admin/dashboard/users/create/user_create.dart';
import 'package:flutter/material.dart';
import 'package:ado_dad_admin/core/widgets/left_bar.dart';
import 'package:ado_dad_admin/dashboard/home/homescreen.dart';
import 'package:ado_dad_admin/dashboard/users/users.dart';
import 'package:ado_dad_admin/dashboard/users/detailed/user_edit_main.dart';
import 'package:ado_dad_admin/dashboard/users/detailed/user_detailed_main.dart';

class HomeDashBoard extends StatefulWidget {
  final int initialIndex;
  const HomeDashBoard({super.key, required this.initialIndex});

  @override
  State<HomeDashBoard> createState() => _HomeDashBoardState();
}

class _HomeDashBoardState extends State<HomeDashBoard> {
  late int _selectedIndex;
  late int _activeIndex;
  late String _selectedId;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
    _activeIndex = widget.initialIndex;
    _selectedId = '';
  }

  List<Widget> get _pages {
    return [
      const HomePage(),
      UserListPage(
        onDetailedPage: _onDetailedPage,
        onEditPage: _onEditPage,
        onCreatePage: _onCreatePage,
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
      UserCreatePage(
        onCreate: _onCreatePage,
        onGoBack: _onGoBack,
      ),
    ];
  }

  void _onItemSelected(int index) {
    setState(() {
      _activeIndex = index;
      _selectedIndex = index;
    });
  }

  void _onDetailedPage(int detailPageIndex, String selectedId) {
    setState(() {
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

  void _onCreatePage(int createPageIndex) {
    setState(() {
      _selectedIndex = createPageIndex;
    });
  }

  void _onGoBack(int previousPageIndex) {
    setState(() {
      _selectedIndex = previousPageIndex;
      _activeIndex = previousPageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: screenWidth <= 768
          ? AppBar(
              backgroundColor: const Color(0xFF1E1E1E),
              title: const Text("Dashboard"),
              leading: Builder(
                builder: (context) {
                  return IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  );
                },
              ),
            )
          : null,
      drawer: screenWidth <= 768
          ? Drawer(
              child: AppSidebar(
                selectedIndex: _activeIndex,
                onItemSelected: (index) {
                  _onItemSelected(index);
                  Navigator.of(context).pop();
                },
              ),
            )
          : null,
      body: Row(
        children: [
          if (screenWidth > 768)
            AppSidebar(
              selectedIndex: _activeIndex,
              onItemSelected: _onItemSelected,
            ),
          Expanded(
            child: _pages[_selectedIndex],
          ),
        ],
      ),
    );
  }
}
