import 'package:ado_dad_admin/app.dart';
import 'package:ado_dad_admin/core/bloc/auth/auth_bloc.dart';
import 'package:ado_dad_admin/core/bloc/auth/auth_event.dart';
import 'package:ado_dad_admin/core/bloc/auth/auth_state.dart';
import 'package:ado_dad_admin/core/bloc/login/login_bloc.dart';
import 'package:ado_dad_admin/core/network/user_dio_client.dart';
import 'package:ado_dad_admin/dashboard/home/dashboard.dart';
import 'package:ado_dad_admin/core/repository/auth_service.dart';
import 'package:ado_dad_admin/dashboard/login/login_repository.dart';
import 'package:ado_dad_admin/core/repository/users/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/router.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
// import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  setUrlStrategy(PathUrlStrategy());
  final dioClient = DioClient();
  final authService = AuthService();

  // Check if the user is authenticated before app startup
  // final bool isAuthenticated = await authService.isAuthenticated();

  runApp(
    MyApp(
      dioClient: dioClient,
      authService: authService,
      // isAuthenticated: isAuthenticated,
    ),
  );
}

class MyApp extends StatelessWidget {
  final DioClient dioClient;
  final AuthService authService;
  // final bool isAuthenticated;

  const MyApp({
    super.key,
    required this.dioClient,
    required this.authService,
    // required this.isAuthenticated,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<LoginRepository>(
          create: (context) => LoginRepository(dioClient: dioClient),
        ),
        RepositoryProvider<UserRepository>(
          create: (context) => UserRepository(dioClient: dioClient),
        ),
        RepositoryProvider<AuthService>(
          create: (context) => authService,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(
              loginRepository: context.read<LoginRepository>(),
              authBloc: context.read<AuthBloc>(), // Pass AuthBloc to LoginBloc
            ),
          ),
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
              authService: context.read<AuthService>(),
            )..add(AppStarted()), // Start AuthBloc to check auth state
          ),
        ],
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return MaterialApp(
              title: 'Admin Web App',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                fontFamily: GoogleFonts.inter().fontFamily,
                scaffoldBackgroundColor:
                    const Color.fromARGB(101, 247, 242, 184),
                textTheme: TextTheme(
                  bodyLarge: GoogleFonts.inter(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                  bodyMedium: GoogleFonts.inter(fontSize: 16.0),
                  bodySmall: GoogleFonts.inter(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                  headlineLarge: GoogleFonts.poppins(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                  headlineMedium: GoogleFonts.poppins(fontSize: 24.0),
                  titleLarge: GoogleFonts.poppins(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                    textStyle: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              onGenerateRoute: generateRoute,
              home: state is AuthAuthenticated
                  ? const HomeDashBoard(initialIndex: 0)
                  : const AdminPage(),
            );
          },
        ),
      ),
    );
  }
}
