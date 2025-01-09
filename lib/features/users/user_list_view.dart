import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ado_dad_admin/core/bloc/users/user_bloc.dart';
import 'package:ado_dad_admin/core/bloc/users/user_event.dart';
import 'package:ado_dad_admin/core/bloc/users/user_state.dart';
import 'pagination_controls.dart';
import 'user_data_table.dart';

class UserListView extends StatefulWidget {
  const UserListView({super.key});

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  int _currentPage = 1;
  int _lastPage = 1;
  int _rowsPerPage = 10;
  bool _isPaginationLoading = false; // Flag for pagination-specific loading

  void _fetchUsers(int page, int rowsPerPage) {
    setState(() {
      _isPaginationLoading = true;
    });
    context.read<UserBloc>().add(FetchUsers(page: page, limit: rowsPerPage));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          BlocListener<UserBloc, UserState>(
            listener: (context, state) {
              if (state is UserLoaded) {
                // Update _lastPage and stop pagination loading when new data is loaded
                setState(() {
                  _lastPage = state.users.totalPages;
                  _isPaginationLoading = false;
                });
              } else if (state is UserError) {
                setState(() {
                  _isPaginationLoading = false; // Stop loading on error
                });
              }
            },
            child: BlocBuilder<UserBloc, UserState>(
              builder: (BuildContext context, UserState state) {
                if (state is UserLoading && !_isPaginationLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is UserLoaded) {
                  return UserDataTable(users: state.users.users);
                } else if (state is UserError) {
                  return Center(child: Text(state.message));
                } else {
                  return const Center(child: Text('No data available.'));
                }
              },
            ),
          ),
          PaginationControls(
            currentPage: _currentPage,
            lastPage: _lastPage,
            rowsPerPage: _rowsPerPage,
            isLoading: _isPaginationLoading, // Pass loading state to controls
            onPageChange: (page) {
              if (page <= _lastPage && page > 0 && !_isPaginationLoading) {
                setState(() {
                  _currentPage = page;
                });
                _fetchUsers(page, _rowsPerPage);
              }
            },
            onRowsPerPageChange: (rows) {
              if (!_isPaginationLoading) {
                setState(() {
                  _rowsPerPage = rows;
                  _currentPage = 1;
                });
                _fetchUsers(1, rows);
              }
            },
          ),
        ],
      ),
    );
  }
}
