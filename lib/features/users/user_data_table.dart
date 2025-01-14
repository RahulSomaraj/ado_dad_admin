import 'package:ado_dad_admin/features/users/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:ado_dad_admin/dashboard/user/user_detailed_main.dart';
import 'package:ado_dad_admin/dashboard/user/user_edit.dart';
import 'package:ado_dad_admin/core/model/user_model.dart';

class UserDataTable extends StatelessWidget {
  final List<UserModel> users;
  final void Function(int detailPageIndex, String selectedId) onDetailedPage;
  final void Function(int detailPageIndex, String selectedId) onEditPage;

  const UserDataTable({
    super.key,
    required this.users,
    required this.onDetailedPage,
    required this.onEditPage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      width: double.infinity, // Ensure container takes full width
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            child: SizedBox(
              width: double.infinity, // Make the table stretch full width
              child: DataTable(
                columnSpacing: 40.0, // Adjust column spacing
                horizontalMargin: 10.0, // Adjust margin for better spacing
                columns: const [
                  DataColumn(
                    label: Text(
                      'ID',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'NAME',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'PHONE',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'EMAIL',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'ACTIONS',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
                rows:
                    users.map((user) => _buildUserRow(context, user)).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  DataRow _buildUserRow(BuildContext context, UserModel user) {
    return DataRow(cells: [
      DataCell(Text(user.id.toString())),
      DataCell(Text(user.name)),
      DataCell(Text(user.phoneNumber)),
      DataCell(Text(user.email)),
      DataCell(
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(Icons.visibility),
              onPressed: () {
                print(user.id);
                onDetailedPage(5, user.id);
              },
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                print(user.id);
                onEditPage(4, user.id);
              },
            ),
          ],
        ),
      ),
    ]);
  }
}
