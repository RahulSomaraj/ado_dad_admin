import 'package:ado_dad_admin/core/bloc/users/user_bloc.dart';
import 'package:ado_dad_admin/core/bloc/users/user_event.dart';
import 'package:ado_dad_admin/core/bloc/users/user_state.dart';
import 'package:ado_dad_admin/core/model/users/user_model.dart';
import 'package:ado_dad_admin/dashboard/users/create/multiple_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  List<Map<String, dynamic>> images = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(userRepository: context.read()),
      child: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserLoading) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Saving User...')),
            );
          } else if (state is UserCreated) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('User Created Successfully!')),
            );
            widget.onCreate(0); // Navigate to another page on success
          } else if (state is UserError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.message}')),
            );
          }
        },
        child: Scaffold(
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
        ),
      ),
    );
  }
}
