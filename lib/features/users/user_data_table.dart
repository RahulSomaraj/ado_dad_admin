import 'package:flutter/material.dart';
import 'package:ado_dad_admin/dashboard/user/user_detailed.dart';
import 'package:ado_dad_admin/dashboard/user/user_edit.dart';
import 'package:ado_dad_admin/core/model/user_model.dart';

class UserDataTable extends StatelessWidget {
  final List<UserModel> users;

  const UserDataTable({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      width: double.infinity,
      child: Card(
        child: DataTable(
          columns: const [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('NAME')),
            DataColumn(label: Text('PHONE')),
            DataColumn(label: Text('EMAIL')),
            DataColumn(label: Text('ACTIONS')),
          ],
          rows: users.map((user) => _buildUserRow(context, user)).toList(),
        ),
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
          children: [
            IconButton(
              icon: const Icon(Icons.visibility),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserDetailPage(user: user),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserEditPage(user: user),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ]);
  }
}
