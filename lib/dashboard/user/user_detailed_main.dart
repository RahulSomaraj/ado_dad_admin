import 'package:ado_dad_admin/core/bloc/users/user_event.dart';
import 'package:ado_dad_admin/core/bloc/users/user_state.dart';
import 'package:ado_dad_admin/dashboard/user/user_detailed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ado_dad_admin/core/bloc/users/user_bloc.dart';
import 'package:ado_dad_admin/features/repository/users/user_repository.dart';

class UserDetailPage extends StatelessWidget {
  final String userId;

  const UserDetailPage({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserBloc(userRepository: context.read<UserRepository>())
            ..add(FetchUserById(userId: userId)),
      child: Scaffold(
        appBar: AppBar(title: const Text('User Details')),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is UserFetched) {
              return UserDetails(user: state.user);
            } else if (state is UserError) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text('No user found.'));
          },
        ),
      ),
    );
  }
}
