import 'package:ado_dad_admin/core/bloc/users/user_event.dart';
import 'package:ado_dad_admin/core/bloc/users/user_state.dart';
import 'package:ado_dad_admin/dashboard/user/user_detailed.dart';
import 'package:ado_dad_admin/dashboard/user/user_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ado_dad_admin/core/bloc/users/user_bloc.dart';
import 'package:ado_dad_admin/features/repository/users/user_repository.dart';

class UserEditPage extends StatelessWidget {
  final String userId;
  final void Function(int previousPageIndex) onGoBack;
  final void Function(int editPageIndex, String userId) onEditPage;

  const UserEditPage({
    super.key,
    required this.userId,
    required this.onGoBack,
    required this.onEditPage,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserBloc(userRepository: context.read<UserRepository>())
            ..add(FetchUserById(userId: userId)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('User Edit'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => onGoBack(2), // Navigate back to UserListPage
          ),
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is UserFetched) {
              return UserEditPageDetail(
                onEditPage: onEditPage,
                user: state.user,
                onGoBack: onGoBack,
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
