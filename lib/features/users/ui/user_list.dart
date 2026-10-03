import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/features/users/bloc/user_bloc.dart';
import 'package:ado_dad_admin/features/widgets/list_page.dart';
import 'package:ado_dad_admin/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _horizontalScrollController = ScrollController();
  int rowsPerPage = 10;

  @override
  void dispose() {
    _searchController.dispose();
    _horizontalScrollController.dispose();
    super.dispose();
  }

  void _showDeleteDialog(BuildContext context, String userId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
          title: const Text("Confirm delete",
              style: TextStyle(fontWeight: FontWeight.bold)),
          content: const Text("Are you sure you want to delete this user?"),
          actions: [
            TextButton(
              onPressed: () => context.pop(),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.danger,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
              ),
              onPressed: () {
                _deleteUser(userId);
                context.pop();
              },
              child: const Text("Delete", style: TextStyle(color: Colors.white)),
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          title: const Text("Success"),
          content: Text(message),
          actions: [
            TextButton(onPressed: () => context.pop(), child: const Text("OK")),
          ],
        );
      },
    );
  }

  void _deleteUser(String userId) {
    context.read<UserBloc>().add(DeleteUser(userId: userId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserDeletedSuccess) {
          _showSuccessPopup(context, state.message);
        }
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListPageHeader(
              breadcrumb: "Home / Users",
              title: "Users",
              subtitle: "Manage platform users",
              searchHint: "Search users…",
              searchController: _searchController,
              onSearch: (query) {
                context.read<UserBloc>().add(
                    FetchAllUsers(page: 1, limit: 10, searchQuery: query));
              },
              addLabel: "Add user",
              onAdd: () async {
                final result = await context.push('/add-user');
                if (result == true) {
                  context
                      .read<UserBloc>()
                      .add(FetchAllUsers(page: 1, limit: rowsPerPage));
                }
              },
            ),
            const SizedBox(height: 16),
            Container(
              decoration: listCardDecoration(),
              clipBehavior: Clip.antiAlias,
              child: _buildUserList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserList() {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoading) {
          return _statusBox(const CircularProgressIndicator());
        } else if (state is UserLoaded) {
          if (state.users.isEmpty) {
            return _statusBox(Text("No users found",
                style: GoogleFonts.inter(color: AppColors.textSecondary)));
          }
          return Column(
            children: [
              FillWidthDataTable(
                controller: _horizontalScrollController,
                minWidth: 820,
                columns: [
                  listColumn('#'),
                  listColumn('Name'),
                  listColumn('Email'),
                  listColumn('Phone'),
                  listColumn('Actions'),
                ],
                rows: state.users
                    .asMap()
                    .entries
                    .map((e) => _buildUserRow(e.key, e.value, state.currentPage))
                    .toList(),
              ),
              ListPagination(
                currentPage: state.currentPage,
                totalPages: state.totalPages,
                rowsPerPage: rowsPerPage,
                onRowsPerPageChanged: (v) {
                  setState(() => rowsPerPage = v);
                  context
                      .read<UserBloc>()
                      .add(FetchAllUsers(page: 1, limit: rowsPerPage));
                },
                onPageChanged: (p) {
                  context
                      .read<UserBloc>()
                      .add(FetchAllUsers(page: p, limit: rowsPerPage));
                },
              ),
            ],
          );
        } else if (state is UserError) {
          return _statusBox(Text(state.message,
              style: GoogleFonts.inter(color: AppColors.danger)));
        }
        return _statusBox(Text("No users found",
            style: GoogleFonts.inter(color: AppColors.textSecondary)));
      },
    );
  }

  Widget _statusBox(Widget child) => Padding(
        padding: const EdgeInsets.all(48),
        child: Center(child: child),
      );

  DataRow _buildUserRow(int index, UserModel user, int currentPage) {
    final rowNumber = ((currentPage - 1) * rowsPerPage) + index + 1;
    final cellStyle =
        GoogleFonts.inter(fontSize: 13, color: AppColors.textPrimary);
    return DataRow(cells: [
      DataCell(Text('$rowNumber',
          style: GoogleFonts.inter(
              fontSize: 13, color: AppColors.textSecondary))),
      DataCell(SizedBox(
        width: 180,
        child: Text(user.name,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: cellStyle.copyWith(fontWeight: FontWeight.w500)),
      )),
      DataCell(SizedBox(
        width: 220,
        child: Text(user.email,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: GoogleFonts.inter(
                fontSize: 13, color: AppColors.textSecondary)),
      )),
      DataCell(Text(user.phoneNumber, style: cellStyle)),
      DataCell(Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListRowAction(
            icon: Icons.edit_outlined,
            tooltip: "Edit",
            onTap: () => context.push('/edit-user', extra: user),
          ),
          ListRowAction(
            icon: Icons.visibility_outlined,
            tooltip: "View",
            onTap: () => context.push('/view-user', extra: user),
          ),
          ListRowAction(
            icon: Icons.delete_outline,
            tooltip: "Delete",
            color: AppColors.danger,
            onTap: () => _showDeleteDialog(context, user.id),
          ),
        ],
      )),
    ]);
  }
}
