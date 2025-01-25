import 'package:ado_dad_admin/core/bloc/users/user_event.dart';
import 'package:ado_dad_admin/core/bloc/users/user_state.dart';
import 'package:ado_dad_admin/dashboard/users/detailed/user_detailed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ado_dad_admin/core/bloc/users/user_bloc.dart';
import 'package:ado_dad_admin/core/repository/users/user_repository.dart';

class UserDetailPage extends StatelessWidget {
  final String userId;
  final void Function(int editPageIndex, String userId) onEditPage;
  final void Function(int previousPageIndex) onGoBack;

  const UserDetailPage({
    super.key,
    required this.userId,
    required this.onEditPage,
    required this.onGoBack,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserBloc(userRepository: context.read<UserRepository>())
            ..add(FetchUserById(userId: userId)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('User Details'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => onGoBack(1), // Navigate back to UserListPage
          ),
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is UserFetched) {
              return UserDetails(
                user: state.user,
                onEditPage: onEditPage,
              );
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
