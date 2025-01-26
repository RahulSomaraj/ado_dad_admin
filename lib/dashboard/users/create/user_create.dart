import 'package:ado_dad_admin/core/model/users/user_model.dart';
import 'package:flutter/material.dart';

class UserCreatePage extends StatefulWidget {
  final UserModel? user;
  final void Function(int previousPageIndex) onGoBack;
  final void Function(int createPageIndex) onCreate;

  const UserCreatePage({
    super.key,
    this.user,
    required this.onGoBack,
    required this.onCreate,
  });

  @override
  State<UserCreatePage> createState() => _UserCreatePageState();
}

class _UserCreatePageState extends State<UserCreatePage> {
  @override
  Widget build(BuildContext context) {
    return const Text("Create User");
  }
}
