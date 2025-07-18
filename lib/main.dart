import 'package:ado_dad_admin/common/app_routes.dart';
import 'package:ado_dad_admin/common/app_theme.dart';
import 'package:ado_dad_admin/common/data_storage.dart';
import 'package:ado_dad_admin/features/banner/bloc/banner_bloc.dart';
import 'package:ado_dad_admin/features/login/bloc/auth_bloc.dart';
import 'package:ado_dad_admin/features/showroom/bloc/showroom_bloc.dart';
import 'package:ado_dad_admin/features/users/bloc/user_bloc.dart';
import 'package:ado_dad_admin/features/vehicle_manufacturer/bloc/bloc/vehicle_manufacturer_bloc.dart';
import 'package:ado_dad_admin/features/vehicle_model/bloc/vehicle_model_bloc.dart';
import 'package:ado_dad_admin/features/vehicle_variant/bloc/bloc/vehicle_variant_bloc.dart';
import 'package:ado_dad_admin/repositories/auth_rep.dart';
import 'package:ado_dad_admin/repositories/banner_rep.dart';
import 'package:ado_dad_admin/repositories/showroom_rep.dart';
import 'package:ado_dad_admin/repositories/user_rep.dart';
import 'package:ado_dad_admin/repositories/vehicle_manufacturer_rep.dart';
import 'package:ado_dad_admin/repositories/vehicle_model_rep.dart';
import 'package:ado_dad_admin/repositories/vehicle_variant_rep.dart';
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
        // BlocProvider(
        //   create: (context) => VehicleCompanyBloc(
        //       vehicleCompanyRepository: VehicleCompanyRepository())
        //     ..add(FetchAllVehicleCompany()),
        // ),
        BlocProvider(
          create: (context) => VehicleManufacturerBloc(
              repository: VehicleManufacturerRepository())
            ..add(FetchAllVehicleManufacturers()),
        ),
        // BlocProvider(
        //   create: (context) =>
        //       VehicleBloc(vehicleRepository: VehicleRepository())
        //         ..add(FetchAllVehicles()),
        // ),
        BlocProvider(
          create: (context) =>
              VehicleModelBloc(repository: VehicleModelRepository())
                ..add(FetchAllVehicleModels()),
        ),
        BlocProvider(
          create: (context) =>
              VehicleVariantBloc(repository: VehicleVariantRepository()),
        ),

        BlocProvider(
          create: (context) => BannerBloc(repository: BannerRepository())
            ..add(FetchAllBanners()),
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
