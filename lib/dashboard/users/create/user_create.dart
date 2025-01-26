import 'package:ado_dad_admin/core/model/users/user_model.dart';
import 'package:ado_dad_admin/dashboard/users/create/multiple_image_picker.dart';
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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          padding: EdgeInsets.all(20.0),
          child: MultipleImagePicker(),
        ),
      ),
    );
  }
}
