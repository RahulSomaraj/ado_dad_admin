import 'package:ado_dad_admin/core/bloc/auth/auth_bloc.dart';
import 'package:ado_dad_admin/features/login/left_section.dart';
import 'package:ado_dad_admin/features/login/right_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ado_dad_admin/features/repository/login/login_repository.dart';
import 'package:ado_dad_admin/core/bloc/login/login_bloc.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
        loginRepository: context.read<LoginRepository>(),
        authBloc: context.read<AuthBloc>(), // Pass AuthBloc to LoginBloc
      ),
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 900) {
              return const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.0,
                ), // Add padding for mobile
                child: RightSection(),
              );
            } else {
              return Row(
                children: const [
                  LeftSection(),
                  Expanded(
                    child: RightSection(),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
