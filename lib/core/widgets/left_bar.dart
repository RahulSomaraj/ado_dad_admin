import 'package:flutter/material.dart';

class AppSidebar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const AppSidebar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100, // Set fixed width for consistent layout
      decoration: const BoxDecoration(
        color: Color(0xFF1E1E1E),
      ),
      child: Column(
        children: [
          const SizedBox(height: 40), // Top spacing
          _buildNavItem(Icons.dashboard, 'DASHBOARD', 0),
          _buildNavItem(Icons.people, 'USERS', 1),
          _buildNavItem(Icons.car_rental, 'VEHICLES', 2),
          _buildNavItem(Icons.shop, 'SHOWROOMS', 3),
          const Spacer(), // Push remaining items down
          _buildNavItem(Icons.logout, 'LOGOUT', 4), // Logout at the bottom
          const SizedBox(height: 40), // Bottom spacing
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () => onItemSelected(index),
      child: Container(
        width: double.infinity, // Full width highlight for selected item
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        decoration: BoxDecoration(
          color: selectedIndex == index
              ? Colors.blueAccent.withOpacity(0.2)
              : Colors.transparent,
          border: Border(
            left: BorderSide(
              color: selectedIndex == index
                  ? Colors.blueAccent
                  : Colors.transparent,
              width: 4, // Highlight on the left
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 35, // Large uniform icon
              color: selectedIndex == index ? Colors.blueAccent : Colors.white,
            ),
            const SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color:
                    selectedIndex == index ? Colors.blueAccent : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
