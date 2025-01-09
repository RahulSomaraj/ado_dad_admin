import 'package:ado_dad_admin/core/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:ado_dad_admin/dashboard/user/user_edit.dart';

class UserDetailPage extends StatelessWidget {
  final UserModel user;

  const UserDetailPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ID: ${user.id}', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text('Name: ${user.name}', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 10),
            Text('Description: ${user.phoneNumber}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserEditPage(user: user),
                  ),
                );
              },
              child: const Text('Edit'),
            ),
          ],
        ),
      ),
    );
  }
}
