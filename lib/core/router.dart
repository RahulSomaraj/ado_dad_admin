import 'package:ado_dad_admin/app.dart';
import 'package:ado_dad_admin/core/bloc/auth/auth_state.dart';
import 'package:ado_dad_admin/dashboard/home/dashboard.dart';
import 'package:ado_dad_admin/core/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  return MaterialPageRoute(
    builder: (context) {
      final authState = BlocProvider.of<AuthBloc>(context).state;

      // Route Guard for Authentication
      if (authState is AuthAuthenticated) {
        switch (settings.name) {
          case '/':
            return const AdminPage();
          case '/home':
            return const HomeDashBoard(initialIndex: 0);
          case '/users':
            return const HomeDashBoard(initialIndex: 1);
          default:
            return const AdminPage();
        }
      } else {
        // Redirect to Login if Not Authenticated
        return const AdminPage();
      }
    },
  );
}
