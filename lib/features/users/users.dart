import 'package:ado_dad_admin/core/bloc/users/user_bloc.dart';
import 'package:ado_dad_admin/core/bloc/users/user_event.dart';
import 'package:ado_dad_admin/core/network/user_dio_client.dart';
import 'package:ado_dad_admin/features/repository/users/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'user_list_view.dart';

class UserListPage extends StatelessWidget {
  final DioClient dioClient = DioClient();
  final UserRepository userRepository;

  UserListPage({super.key})
      : userRepository = UserRepository(dioClient: DioClient());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(userRepository: userRepository)
        ..add(FetchUsers(page: 1, limit: 10)),
      child: const UserListView(),
    );
  }
}
