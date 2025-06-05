import 'package:ado_dad_admin/common/data_storage.dart';
import 'package:ado_dad_admin/features/admin_layout/admin_layout.dart';
import 'package:ado_dad_admin/features/login/ui/login.dart';
import 'package:ado_dad_admin/features/profile/user_profile.dart';
import 'package:ado_dad_admin/features/showroom/ui/showroom_add.dart';
import 'package:ado_dad_admin/features/showroom/ui/showroom_detail_view.dart';
import 'package:ado_dad_admin/features/showroom/ui/showroom_edit.dart';
import 'package:ado_dad_admin/features/showroom/ui/showroom_list.dart';
import 'package:ado_dad_admin/features/users/ui/add_user.dart';
import 'package:ado_dad_admin/features/users/ui/user_edit.dart';
import 'package:ado_dad_admin/features/users/ui/user_list.dart';
import 'package:ado_dad_admin/features/vehicle/ui/vehicle_add.dart';
import 'package:ado_dad_admin/features/vehicle/ui/vehicle_list.dart';
import 'package:ado_dad_admin/features/vehicle_company/ui/vehicle_company_add.dart';
import 'package:ado_dad_admin/features/vehicle_company/ui/vehicle_company_edit.dart';
import 'package:ado_dad_admin/features/vehicle_company/ui/vehicle_company_list.dart';
import 'package:ado_dad_admin/features/vehicle_company/ui/vehicle_company_view.dart';
import 'package:ado_dad_admin/models/user_model.dart';
import 'package:ado_dad_admin/models/vehicle_company_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginPage(),
      ),
      ShellRoute(
        builder: (context, state, child) {
          return AdminLayout(child: child);
        },
        routes: [
          _noTransitionRoute(
              '/dashboard', const Center(child: Text("Dashboard Content"))),
          _noTransitionRoute('/profile', const MyProfile()),
          _noTransitionRoute('/users', Users()),
          _noTransitionRoute('/add-user', AddUser()),
          _noTransitionRoute(
              '/create-ad', const Center(child: Text("Listing Management"))),
          _noTransitionRoute('/vehicles', VehicleList()),
          _noTransitionRoute('/add-vehicle', AddVehicle()),
          _noTransitionRoute('/vehicle-companies', VehicleCompanyList()),
          _noTransitionRoute('/add-vehiclecompany', VehicleCompanyAdd()),
          _noTransitionRoute('/showrooms', Showroom()),
          _noTransitionRoute('/add-showroom', ShowroomAdd()),
          _noTransitionRoute(
              '/reports', const Center(child: Text("Reports Management"))),
          _noTransitionRoute(
              '/notifications', const Center(child: Text("Noti Management"))),
          GoRoute(
            path: '/edit-user',
            pageBuilder: (context, state) {
              final user = state.extra as UserModel;
              return NoTransitionPage(child: EditUser(user: user));
            },
          ),
          GoRoute(
            path: '/edit-showroom',
            pageBuilder: (context, state) {
              final showroomuser = state.extra as UserModel;
              return NoTransitionPage(
                  child: EditShowroom(showroomuser: showroomuser));
            },
          ),
          GoRoute(
            path: '/view-showroom',
            pageBuilder: (context, state) {
              final showroomuser = state.extra as UserModel;
              return NoTransitionPage(
                  child: ShowroomDetailView(showroomuser: showroomuser));
            },
          ),
          GoRoute(
            path: '/edit-vehicle_company',
            pageBuilder: (context, state) {
              final vehiclecompany = state.extra as VehicleCompanyModel;
              return NoTransitionPage(
                  child: EditVehicleCompany(vehiclecompany: vehiclecompany));
            },
          ),
          GoRoute(
            path: '/view-vehicle_company',
            pageBuilder: (context, state) {
              final vehiclecompany = state.extra as VehicleCompanyModel;
              return NoTransitionPage(
                  child:
                      VehicleCompanyDetailView(vehiclecompany: vehiclecompany));
            },
          ),
        ],
      ),
    ],
    redirect: (context, state) async {
      final isAuthenticated = await _isLoggedIn();

      if (!isAuthenticated) {
        if (state.uri.toString() != '/') {
          return '/';
        }
      } else {
        if (state.uri.toString() == '/' ||
            state.uri.toString() == '/dashboard') {
          return '/dashboard';
        }
      }

      return null;
    },
  );
}

/// ✅ Helper function to apply `NoTransitionPage` to all routes
GoRoute _noTransitionRoute(String path, Widget page) {
  return GoRoute(
    path: path,
    pageBuilder: (context, state) =>
        NoTransitionPage(child: page), // ✅ Use `pageBuilder`
  );
}

Future<bool> _isLoggedIn() async {
  final token = await getToken();
  return token != null;
}
