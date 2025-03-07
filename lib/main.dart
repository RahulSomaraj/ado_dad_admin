import 'package:ado_dad_admin/common/app_routes.dart';
import 'package:ado_dad_admin/common/app_theme.dart';
import 'package:ado_dad_admin/common/data_storage.dart';
import 'package:ado_dad_admin/features/login/bloc/auth_bloc.dart';
import 'package:ado_dad_admin/features/showroom/bloc/showroom_bloc.dart';
import 'package:ado_dad_admin/features/users/bloc/user_bloc.dart';
import 'package:ado_dad_admin/features/vehicle/bloc/vehicle_bloc.dart';
import 'package:ado_dad_admin/features/vehicle_company/bloc/vehicle_company_bloc.dart';
import 'package:ado_dad_admin/repositories/auth_rep.dart';
import 'package:ado_dad_admin/repositories/showroom_rep.dart';
import 'package:ado_dad_admin/repositories/user_rep.dart';
import 'package:ado_dad_admin/repositories/vehicle_company_rep.dart';
import 'package:ado_dad_admin/repositories/vehicle_rep.dart';
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
          create: (context) => AuthBloc(authRepository: AuthRepository())
            ..add(const AuthEvent.checkLoginStatus()),
        ),
        BlocProvider(
          create: (context) =>
              UserBloc(userRepository: UserRepository())..add(FetchAllUsers()),
        ),
        BlocProvider(
          create: (context) =>
              ShowroomBloc(showroomRepository: ShowroomRepository())
                ..add(FetchAllShowrooms()),
        ),
        BlocProvider(
          create: (context) => VehicleCompanyBloc(
              vehicleCompanyRepository: VehicleCompanyRepository())
            ..add(FetchAllVehicleCompany()),
        ),
        BlocProvider(
          create: (context) =>
              VehicleBloc(vehicleRepository: VehicleRepository())
                ..add(FetchAllVehicles()),
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
