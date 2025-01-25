import 'package:ado_dad_admin/dashboard/users/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ado_dad_admin/core/bloc/users/user_bloc.dart';
import 'package:ado_dad_admin/core/bloc/users/user_event.dart';
import 'package:ado_dad_admin/core/bloc/users/user_state.dart';
import 'pagination_controls.dart';
import 'user_data_table.dart';

class UserListView extends StatefulWidget {
  final void Function(int detailPageIndex, String selectedId) onDetailedPage;
  final void Function(int detailPageIndex, String selectedId) onEditPage;
  const UserListView({
    super.key,
    required this.onDetailedPage,
    required this.onEditPage,
  });

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  int _currentPage = 1;
  int _lastPage = 1;
  int _rowsPerPage = 10;
  String? _searchQuery;
  String? _type;
  bool _isPaginationLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchUsers(_currentPage, _rowsPerPage);
  }

  void _fetchUsers(
    int page,
    int rowsPerPage,
  ) {
    setState(() {
      _isPaginationLoading = true;
    });
    context.read<UserBloc>().add(
          FetchUsers(page: page, limit: rowsPerPage, queryParams: {
            if (_searchQuery != null && _searchQuery!.isNotEmpty)
              'search': _searchQuery,
            if (_type != null) 'type': _type,
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          SearchBarController(
            onSearch: (query) {
              setState(() {
                _searchQuery = query;
                _currentPage = 1; // Reset to the first page for new search
              });
              _fetchUsers(_currentPage, _rowsPerPage);
            },
            onCreate: () {
              setState(() {
                _searchQuery = null; // Clear search query
                _currentPage = 1; // Reset to the first page
              });
              _fetchUsers(_currentPage, _rowsPerPage);
            },
          ),
          const SizedBox(height: 10),
          BlocConsumer<UserBloc, UserState>(
            listener: (context, state) {
              if (state is UserLoaded) {
                setState(() {
                  _lastPage = state.users.totalPages;
                  _isPaginationLoading = false;
                });
              } else if (state is UserError) {
                setState(() {
                  _isPaginationLoading = false;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
            builder: (context, state) {
              if (state is UserLoading && !_isPaginationLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is UserLoaded) {
                return Expanded(
                  child: UserDataTable(
                    users: state.users.users,
                    onDetailedPage: widget.onDetailedPage,
                    onEditPage: widget.onEditPage,
                  ),
                );
              } else if (state is UserError) {
                return Center(child: Text(state.message));
              } else {
                return const Center(child: Text('No data available.'));
              }
            },
          ),
          PaginationControls(
            currentPage: _currentPage,
            lastPage: _lastPage,
            rowsPerPage: _rowsPerPage,
            isLoading: _isPaginationLoading,
            onPageChange: (page) {
              if (page > 0 && page <= _lastPage && !_isPaginationLoading) {
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
                  _currentPage = 1; // Reset to the first page
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
