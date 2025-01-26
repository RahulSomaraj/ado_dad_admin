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
  final void Function(int editPageIndex, String selectedId) onEditPage;
  final void Function(int createPageIndex) onCreatePage;

  const UserListView({
    Key? key,
    required this.onDetailedPage,
    required this.onEditPage,
    required this.onCreatePage,
  }) : super(key: key);

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  int _currentPage = 1;
  int _rowsPerPage = 10;
  String? _searchQuery;
  bool _isLoading = false;
  int _lastPage = 1;

  @override
  void initState() {
    super.initState();
    _fetchUsers(_currentPage, _rowsPerPage);
  }

  void _fetchUsers(int page, int rowsPerPage) {
    setState(() => _isLoading = true);
    context.read<UserBloc>().add(
          FetchUsers(page: page, limit: rowsPerPage, queryParams: {
            if (_searchQuery?.isNotEmpty ?? false) 'search': _searchQuery!,
          }),
        );
  }

  void _onSearch(String query) {
    setState(() {
      _searchQuery = query;
      _currentPage = 1; // Reset to the first page for new search
    });
    _fetchUsers(_currentPage, _rowsPerPage);
  }

  void _onCreate() {
    setState(() {
      _searchQuery = null; // Clear search query
      _currentPage = 1; // Reset to the first page
    });
    _fetchUsers(_currentPage, _rowsPerPage);
  }

  void _onPageChange(int page) {
    if (page > 0 && !_isLoading) {
      setState(() => _currentPage = page);
      _fetchUsers(page, _rowsPerPage);
    }
  }

  void _onRowsPerPageChange(int rows) {
    setState(() {
      _rowsPerPage = rows;
      _currentPage = 1; // Reset to the first page
    });
    _fetchUsers(1, rows);
  }

  Widget _buildContent(UserState state) {
    if (state is UserLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is UserLoaded) {
      // Update _lastPage dynamically
      _lastPage = state.users.totalPages;

      if (state.users.users.isEmpty) {
        return Center(
          child: Text(
            _searchQuery?.isNotEmpty ?? false
                ? 'No results found for your search.'
                : 'No data available.',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        );
      }
      return UserDataTable(
        users: state.users.users,
        onDetailedPage: widget.onDetailedPage,
        onEditPage: widget.onEditPage,
      );
    } else if (state is UserError) {
      return Center(
        child: Text(
          state.message,
          style: TextStyle(color: Colors.red),
        ),
      );
    }
    return const Center(child: Text('No data available.'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          SearchBarController(
            onSearch: _onSearch,
            onCreate: widget.onCreatePage,
          ),
          const SizedBox(height: 10),
          Expanded(
            child: BlocConsumer<UserBloc, UserState>(
              listener: (context, state) {
                if (state is UserLoaded || state is UserError) {
                  setState(() => _isLoading = false);
                }
                if (state is UserError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },
              builder: (context, state) => _buildContent(state),
            ),
          ),
          PaginationControls(
            currentPage: _currentPage,
            lastPage: _lastPage, // Use the _lastPage from the local state
            rowsPerPage: _rowsPerPage,
            isLoading: _isLoading,
            onPageChange: _onPageChange,
            onRowsPerPageChange: _onRowsPerPageChange,
          ),
        ],
      ),
    );
  }
}
