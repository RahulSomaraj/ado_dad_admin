import 'package:ado_dad_admin/common/app_routes.dart';
import 'package:ado_dad_admin/common/app_theme.dart';
import 'package:ado_dad_admin/common/data_storage.dart';
import 'package:ado_dad_admin/showroom/features/login/bloc/auth_bloc.dart';
import 'package:ado_dad_admin/repositories/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(authService: AuthApiService())
            ..add(const AuthEvent.checkLoginStatus()),
        ),
      ],
      child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            // if (state is Unauthenticated) {
            //   Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            // }
          },
          child: MaterialApp.router(
            routerConfig: AppRoutes.router,
            debugShowCheckedModeBanner: false,
            title: 'Ado-dad',
            theme: AppThemes.lightTheme,
          )),
    );
  }
}
