import 'package:flutter/material.dart';

/// 🏠 Dashboard Main Screen with Sidebar and AppBar
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const DashboardPage(),
    const UsersPage(),
    const ReportsPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          /// 🌟 Sidebar Menu
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.asset('assets/images/Ado-dad.png', width: 50), // Logo
                  const SizedBox(height: 20),
                ],
              ),
            ),
            labelType: NavigationRailLabelType.all,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.dashboard),
                selectedIcon: Icon(Icons.dashboard, color: Colors.blue),
                label: Text("Dashboard"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.people),
                selectedIcon: Icon(Icons.people, color: Colors.blue),
                label: Text("Users"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bar_chart),
                selectedIcon: Icon(Icons.bar_chart, color: Colors.blue),
                label: Text("Reports"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings),
                selectedIcon: Icon(Icons.settings, color: Colors.blue),
                label: Text("Settings"),
              ),
            ],
          ),

          /// 📌 Main Content Area
          Expanded(
            child: Column(
              children: [
                /// 🔹 Top Bar
                AppBar(
                  backgroundColor: Colors.white,
                  elevation: 2,
                  title: const Text(
                    "Admin Dashboard",
                    style: TextStyle(color: Colors.black),
                  ),
                  actions: [
                    IconButton(
                      icon:
                          const Icon(Icons.notifications, color: Colors.black),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon:
                          const Icon(Icons.account_circle, color: Colors.black),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.logout, color: Colors.red),
                      onPressed: () {
                        // Handle Logout
                      },
                    ),
                  ],
                ),

                /// 🖥️ Page Content
                Expanded(child: _pages[_selectedIndex]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// 📊 Dashboard Page
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Dashboard Content Here"));
  }
}

/// 👥 Users Page
class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Users Management"));
  }
}

/// 📈 Reports Page
class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Reports and Analytics"));
  }
}

/// ⚙️ Settings Page
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Application Settings"));
  }
}
