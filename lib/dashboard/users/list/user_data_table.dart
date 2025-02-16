import 'package:flutter/material.dart';
import 'package:ado_dad_admin/core/model/users/user_model.dart';

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
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: SizedBox(
              width: double.infinity, // Make the table stretch full width
              child: DataTable(
                columnSpacing: 40.0, // Adjust column spacing
                horizontalMargin: 10.0, // Adjust margin for better spacing
                columns: const [
                  DataColumn(
                    label: Center(
                      child: Text(
                        '#',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Center(
                      child: Text(
                        'Name',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Center(
                      child: Text(
                        'E-mail / Phone',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Center(
                      child: Text(
                        'Joined On',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Center(
                      child: Text(
                        ' ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
                rows: users.asMap().entries.map((entry) {
                  int index = entry.key; // The index of the current element
                  var user = entry.value; // The user object
                  return _buildUserRow(context, user, index);
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  DataRow _buildUserRow(BuildContext context, UserModel user, int index) {
    return DataRow(cells: [
      DataCell(
        Padding(
          padding:
              const EdgeInsets.symmetric(vertical: 10.0), // Vertical padding
          child: Text((index + 1).toString()),
        ),
      ),
      DataCell(
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0), // Vertical padding
          child: Text(user.name),
        ),
      ),
      DataCell(Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0), // Vertical padding
        child: Text('${user.phoneNumber} / ${user.email}'),
      )),
      DataCell(Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0), // Vertical padding
        child: Text(user.createdAt.toString()),
      )),
      DataCell(
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0), // Vertical padding
          child: TextButton(
            onPressed: () {
              onDetailedPage(5, user.id);
            },
            style: TextButton.styleFrom(
              side: BorderSide(
                  color: const Color.fromARGB(172, 20, 20, 20),
                  width: 2), // Border color and width
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
            ),
            child: Text("View"),
          ),
        ),
      ),
    ]);
  }
}
