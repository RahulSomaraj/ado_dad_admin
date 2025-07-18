import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/features/users/bloc/user_bloc.dart';
import 'package:ado_dad_admin/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  final TextEditingController _searchController = TextEditingController();

  void _showDeleteDialog(BuildContext context, String userId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          title: Center(
            child: const Text(
              "Confirm Delete",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          content: const Text(
            "Are you sure you want to delete this user?",
          ),
          actions: [
            TextButton(
              onPressed: () => context.pop(),
              child: const Text(
                "Cancel",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () {
                _deleteUser(userId);
                context.pop();
              },
              child: const Text(
                "Delete",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessPopup(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Success"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => context.pop(),
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void _deleteUser(String userId) {
    context.read<UserBloc>().add(DeleteUser(userId: userId));

    Future.delayed(const Duration(milliseconds: 500), () {
      _showSuccessPopup(context, "User deleted successfully!");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        _buildHeaderSection(),
        const SizedBox(height: 20),
        _buildUserList(),
      ],
    );
  }

  // Widget _buildHeaderSection() {
  //   return Padding(
  //     padding: const EdgeInsets.all(15),
  //     child: Container(
  //       decoration: BoxDecoration(
  //         color: AppColors.primaryColor,
  //         borderRadius: BorderRadius.circular(12),
  //       ),
  //       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: [
  //           const Text(
  //             "Users Management",
  //             style: TextStyle(
  //               color: AppColors.blackColor,
  //               fontSize: 18,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //           const Spacer(),
  //           _buildSearchBar(),
  //           const SizedBox(width: 15),
  //           _buildAddButton(),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _buildHeaderSection() {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600 && screenWidth <= 900;

    return Padding(
      padding: const EdgeInsets.all(15),
      child: isTablet
          ? Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 250, vertical: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Users Management",
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildSearchBar(),
                  const SizedBox(height: 12),
                  _buildAddButton(),
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Users Management",
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  _buildSearchBar(),
                  const SizedBox(width: 15),
                  _buildAddButton(),
                ],
              ),
            ),
    );
  }

  Widget _buildSearchBar() {
    final isTablet = MediaQuery.of(context).size.width < 900 &&
        MediaQuery.of(context).size.width >= 550;

    return Container(
      width: isTablet ? double.infinity : 200,
      height: 50,
      decoration: BoxDecoration(
          // color: Colors.black,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.blackColor)),
      child: Row(
        children: [
          const SizedBox(width: 8),
          const Icon(
            Icons.search,
            color: Colors.black,
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: "Search...",
                hintStyle: TextStyle(fontSize: 14),
                border: InputBorder.none,
              ),
              style: const TextStyle(fontSize: 14),
              onChanged: (query) {
                if (query.isNotEmpty) {
                  context.read<UserBloc>().add(
                      FetchAllUsers(page: 1, limit: 10, searchQuery: query));
                } else {
                  context
                      .read<UserBloc>()
                      .add(FetchAllUsers(page: 1, limit: 10, searchQuery: ''));
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddButton() {
    final isTablet = MediaQuery.of(context).size.width < 900 &&
        MediaQuery.of(context).size.width >= 550;
    return SizedBox(
      width: isTablet ? double.infinity : 150,
      height: 50,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final buttonWidth = constraints.maxWidth;

          // Dynamically adjust content based on width
          double iconSize = buttonWidth < 180 ? 18 : 20;
          double fontSize = buttonWidth < 180 ? 14 : 16;
          double spacing = buttonWidth < 180 ? 6 : 8;

          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.blackColor,
              foregroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              textStyle:
                  TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
            ),
            onPressed: () async {
              bool? result = await context.push('/add-user');
              if (result ?? false) {
                //REFRESH the user list if new user was added
                context
                    .read<UserBloc>()
                    .add(FetchAllUsers(page: 1, limit: rowsPerPage));
              }
            },
            child: Row(
              mainAxisAlignment:
                  isTablet ? MainAxisAlignment.center : MainAxisAlignment.start,
              children: [
                Icon(Icons.add, color: Colors.white, size: iconSize),
                SizedBox(width: spacing),
                Text('Add User', style: TextStyle(fontSize: fontSize)),
              ],
            ),
          );
        },
        // child: ElevatedButton(
        //   style: ElevatedButton.styleFrom(
        //     backgroundColor: AppColors.blackColor,
        //     foregroundColor: AppColors.primaryColor,
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(8),
        //     ),
        //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        //     textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        //   ),
        //   onPressed: () {
        //     context.push('/add-user');
        //   },
        //   child: isTablet
        //       ? Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: const [
        //             Icon(Icons.add, color: Colors.white, size: 20),
        //             SizedBox(width: 8),
        //             Text('Add User'),
        //           ],
        //         )
        //       : Row(
        //           children: const [
        //             Icon(Icons.add, color: Colors.white, size: 20),
        //             SizedBox(width: 8),
        //             Text('Add User'),
        //           ],
        //         ),
        // ),
      ),
    );
  }

  Widget _buildUserList() {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserLoaded) {
          return Column(
            children: [
              _buildUserTable(state.users, state.currentPage),
              const SizedBox(height: 30),
              _buildPaginationBar(state.currentPage, state.totalPages),
            ],
          );
        } else if (state is UserError) {
          return Center(
              child: Text(state.message,
                  style: const TextStyle(color: Colors.red)));
        }
        return const Center(child: Text("No Users Found"));
      },
    );
  }

  // Widget _buildUserTable(List<UserModel> users, int currentPage) {
  //   return Padding(
  //     padding: const EdgeInsets.all(20),
  //     child: LayoutBuilder(
  //       builder: (context, constraints) {
  //         return SingleChildScrollView(
  //           scrollDirection: Axis.horizontal,
  //           child: IntrinsicWidth(
  //             child: Card(
  //               elevation: 3,
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(12),
  //               ),
  //               child: ClipRRect(
  //                 borderRadius: BorderRadius.circular(12),
  //                 child: DataTable(
  //                   columnSpacing: 150,
  //                   headingRowColor: WidgetStateColor.resolveWith(
  //                       (states) => const Color.fromARGB(66, 144, 140, 140)),
  //                   dataRowColor:
  //                       WidgetStatePropertyAll(AppColors.primaryColor),
  //                   dataRowMinHeight: 55,
  //                   dataRowMaxHeight: 55,
  //                   columns: const [
  //                     DataColumn(
  //                       label: Padding(
  //                         padding: EdgeInsets.only(left: 30),
  //                         child: Text('ID',
  //                             style: TextStyle(fontWeight: FontWeight.bold)),
  //                       ),
  //                     ),
  //                     DataColumn(
  //                         label: Text('Name',
  //                             style: TextStyle(fontWeight: FontWeight.bold))),
  //                     DataColumn(
  //                         label: Text('Email',
  //                             style: TextStyle(fontWeight: FontWeight.bold))),
  //                     DataColumn(
  //                         label: Text('Phone Number',
  //                             style: TextStyle(fontWeight: FontWeight.bold))),
  //                     DataColumn(
  //                         label: Text('Actions',
  //                             style: TextStyle(fontWeight: FontWeight.bold))),
  //                   ],
  //                   rows: users.asMap().entries.map((entry) {
  //                     return _buildUserRow(entry.key, entry.value, currentPage);
  //                   }).toList(),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  Widget _buildUserTable(List<UserModel> users, int currentPage) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600 && screenWidth <= 900;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: constraints.maxWidth,
              ),
              child: IntrinsicWidth(
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: DataTable(
                      columnSpacing: isTablet ? 30 : 80,
                      headingRowColor: WidgetStateColor.resolveWith(
                        (states) => const Color.fromARGB(66, 144, 140, 140),
                      ),
                      dataRowColor:
                          WidgetStatePropertyAll(AppColors.primaryColor),
                      dataRowMinHeight: isTablet ? 45 : 55,
                      dataRowMaxHeight: isTablet ? 45 : 55,
                      columns: const [
                        DataColumn(
                          label: Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Text('ID',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                        DataColumn(
                            label: Text('Name',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Email',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Phone',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Actions',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                      rows: users.asMap().entries.map((entry) {
                        return _buildUserRow(
                            entry.key, entry.value, currentPage);
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  int rowsPerPage = 10;

  Widget _buildPaginationBar(int currentPage, int totalPages) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text("Rows per page: "),
            const SizedBox(width: 8),
            DropdownButton<int>(
              value: rowsPerPage,
              dropdownColor: Colors.white,
              items: [10, 20].map((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    rowsPerPage = value;
                  });
                  context
                      .read<UserBloc>()
                      .add(FetchAllUsers(page: 1, limit: rowsPerPage));
                }
              },
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: currentPage > 1
                  ? () {
                      context.read<UserBloc>().add(FetchAllUsers(
                          page: currentPage - 1, limit: rowsPerPage));
                    }
                  : null,
              child: Icon(
                Icons.chevron_left,
                size: 28,
                color: currentPage > 1 ? Colors.black : Colors.grey[400],
              ),
            ),
            const SizedBox(width: 15),
            Text(
              "Page $currentPage of $totalPages",
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 15),
            GestureDetector(
              onTap: currentPage < totalPages
                  ? () {
                      context.read<UserBloc>().add(FetchAllUsers(
                          page: currentPage + 1, limit: rowsPerPage));
                    }
                  : null,
              child: Icon(
                Icons.chevron_right,
                size: 28,
                color:
                    currentPage < totalPages ? Colors.black : Colors.grey[400],
              ),
            ),
          ],
        ),
      ),
    );
  }

  DataRow _buildUserRow(int index, UserModel user, int currentPage) {
    int rowNumber = ((currentPage - 1) * rowsPerPage) + index + 1;
    return DataRow(cells: [
      DataCell(Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Text('$rowNumber'),
      )),
      DataCell(Text(user.name)),
      DataCell(Text(user.email)),
      DataCell(Text(user.phoneNumber)),
      DataCell(
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit,
                  color: Color.fromARGB(255, 59, 59, 59)),
              onPressed: () {
                context.push('/edit-user', extra: user);
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete,
                  color: Color.fromARGB(255, 20, 20, 20)),
              onPressed: () {
                _showDeleteDialog(context, user.id);
              },
            ),
          ],
        ),
      ),
    ]);
  }
}
