import 'package:ado_dad_admin/core/bloc/users/user_bloc.dart';
import 'package:ado_dad_admin/core/bloc/users/user_event.dart';
import 'package:ado_dad_admin/core/bloc/users/user_state.dart';
import 'package:ado_dad_admin/core/model/user_model.dart';
import 'package:ado_dad_admin/core/network/user_dio_client.dart';
import 'package:ado_dad_admin/dashboard/user/user_detailed.dart';
import 'package:ado_dad_admin/dashboard/user/user_edit.dart';
import 'package:ado_dad_admin/features/repository/users/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListPage extends StatelessWidget {
  final DioClient dioClient = DioClient();
  final UserRepository userRepository;

  UserListPage({super.key})
      : userRepository = UserRepository(dioClient: DioClient());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(userRepository: userRepository)
        ..add(
          FetchUsers(page: 1, limit: 10),
        ), // Initialize the bloc and fetch users
      child: const UserListView(),
    );
  }
}

class UserListView extends StatefulWidget {
  const UserListView({super.key});

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  int _currentPage = 1;
  int _rowsPerPage = 10;

  void _nextPage(BuildContext context) {
    context.read<UserBloc>().add(
          FetchUsers(page: _currentPage + 1, limit: _rowsPerPage),
        );
    setState(() {
      _currentPage++;
    });
  }

  void _previousPage(BuildContext context) {
    context.read<UserBloc>().add(
          FetchUsers(page: _currentPage - 1, limit: _rowsPerPage),
        );
    setState(() {
      _currentPage--;
    });
  }

  void _changeRowsPerPage(BuildContext context, int? value) {
    if (value != null) {
      setState(() {
        _rowsPerPage = value;
        _currentPage = 1;
      });
      context
          .read<UserBloc>()
          .add(FetchUsers(page: _currentPage, limit: _rowsPerPage));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          BlocBuilder<UserBloc, UserState>(
            builder: (BuildContext context, UserState state) {
              if (state is UserLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is UserLoaded) {
                final paginatedItems = state.users.users;
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
                      rows: paginatedItems.map((user) {
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
                                        builder: (context) =>
                                            UserDetailPage(user: user),
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
                                        builder: (context) =>
                                            UserEditPage(user: user),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ]);
                      }).toList(),
                    ),
                  ),
                );
              } else if (state is UserError) {
                return Center(child: Text(state.message));
              } else {
                return const Center(child: Text('No data available.'));
              }
            },
          ),
          _buildPaginationControls(context),
        ],
      ),
    );
  }

  Widget _buildPaginationControls(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoaded) {
          int totalPages = state.users.totalPages;
          return Container(
            padding: const EdgeInsets.all(30),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Page $_currentPage  of $totalPages'),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.chevron_left),
                          onPressed: _currentPage > 1
                              ? () => _previousPage(context)
                              : null,
                        ),
                        IconButton(
                          icon: const Icon(Icons.chevron_right),
                          onPressed: _currentPage < totalPages
                              ? () => _nextPage(context)
                              : null,
                        ),
                      ],
                    ),
                    DropdownButton<int>(
                      value: _rowsPerPage,
                      items: [5, 10]
                          .map((value) => DropdownMenuItem<int>(
                                value: value,
                                child: Text('Rows: $value'),
                              ))
                          .toList(),
                      onChanged: (value) => _changeRowsPerPage(context, value),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
