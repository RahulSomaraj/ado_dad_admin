import 'package:flutter/material.dart';
import 'package:ado_dad_admin/core/model/users/user_model.dart';
import 'package:ado_dad_admin/dashboard/users/detailed/user_edit.dart';

class UserDetails extends StatefulWidget {
  final UserModel user;
  final void Function(int editPageIndex, String userId) onEditPage;

  const UserDetails({
    super.key,
    required this.user,
    required this.onEditPage,
  });

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  final List<String> images = [
    'https://uat.ado-dad.com/static/images/bike_hornet.png',
    'https://uat.ado-dad.com/static/images/orange_benz.png',
    'https://uat.ado-dad.com/static/images/orange_car.png',
    'https://uat.ado-dad.com/static/images/red_scooter.png',
    'https://uat.ado-dad.com/static/images/silver_car.png',
  ];
  int currentIndex = 0;

  void _changeImage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  // void _navigateLeft() {
  //   setState(() {
  //     currentIndex = (currentIndex > 0) ? currentIndex - 1 : images.length - 1;
  //   });
  // }

  // void _navigateRight() {
  //   setState(() {
  //     currentIndex = (currentIndex < images.length - 1) ? currentIndex + 1 : 0;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Section
          LayoutBuilder(
            builder: (context, constraints) {
              final imageSize = MediaQuery.of(context).size.width /
                  3; // 1/3 of the screen width
              return SizedBox(
                width: imageSize,
                height: imageSize,
                child: Center(
                  child: Image.network(
                    images[currentIndex],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              );
            },
          ),

          const SizedBox(width: 20), // Space between image and text

          // User Details Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ID: ${widget.user.id}',
                    style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 10),
                Text('Name: ${widget.user.name}',
                    style: const TextStyle(fontSize: 24)),
                const SizedBox(height: 10),
                Text('Phone: ${widget.user.phoneNumber}',
                    style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    widget.onEditPage(
                        4, widget.user.id); // Navigate to the edit page
                  },
                  child: const Text('Edit'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
