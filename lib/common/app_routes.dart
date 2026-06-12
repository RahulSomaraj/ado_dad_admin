import 'package:ado_dad_admin/common/data_storage.dart';
import 'package:ado_dad_admin/features/admin_layout/admin_layout.dart';
import 'package:ado_dad_admin/features/banner/ui/banner.dart';
import 'package:ado_dad_admin/features/banner/ui/banner_edit.dart';
import 'package:ado_dad_admin/features/banner/ui/banner_upload_page.dart';
import 'package:ado_dad_admin/features/dashboard/admin_ads_dashboard.dart';
import 'package:ado_dad_admin/features/dashboard/role_based_dashboard.dart';
import 'package:ado_dad_admin/features/login/ui/login.dart';
import 'package:ado_dad_admin/features/notification/ui/notification.dart';
import 'package:ado_dad_admin/features/profile/user_profile.dart';
import 'package:ado_dad_admin/features/showroom/ui/showroom_add.dart';
import 'package:ado_dad_admin/features/showroom/ui/showroom_detail_view.dart';
import 'package:ado_dad_admin/features/showroom/ui/showroom_edit.dart';
import 'package:ado_dad_admin/features/showroom/ui/showroom_list.dart';
import 'package:ado_dad_admin/features/users/ui/add_user.dart';
import 'package:ado_dad_admin/features/users/ui/user_edit.dart';
import 'package:ado_dad_admin/features/users/ui/user_list.dart';
import 'package:ado_dad_admin/features/users/ui/user_view.dart';
import 'package:ado_dad_admin/features/reports/ui/report_list.dart';
import 'package:ado_dad_admin/features/vehicle_manufacturer/ui/vehicle_manufactures_add.dart';
import 'package:ado_dad_admin/features/vehicle_manufacturer/ui/vehicle_manufactures_edit.dart';
import 'package:ado_dad_admin/features/vehicle_manufacturer/ui/vehicle_manufactures_list.dart';
import 'package:ado_dad_admin/features/vehicle_manufacturer/ui/vehicle_manufactures_view.dart';
import 'package:ado_dad_admin/features/vehicle_model/ui/vehicle_model_add.dart';
import 'package:ado_dad_admin/features/vehicle_model/ui/vehicle_model_edit.dart';
import 'package:ado_dad_admin/features/vehicle_model/ui/vehicle_model_view.dart';
import 'package:ado_dad_admin/features/vehicle_model/ui/vehicle_models_list.dart';
import 'package:ado_dad_admin/features/vehicle_variant/ui/vehicle_variant_add.dart';
import 'package:ado_dad_admin/features/vehicle_variant/ui/vehicle_variant_edit.dart';
import 'package:ado_dad_admin/models/banner_model.dart';
import 'package:ado_dad_admin/models/user_model.dart';
import 'package:ado_dad_admin/models/vehicle_manufacturer/vehicle_manufacturer_model.dart';
import 'package:ado_dad_admin/models/vehicle_model/vehicle_model.dart'; // ✅ consistent path
import 'package:ado_dad_admin/models/vehicle_variant/vehicle_variant_response_model.dart';
import 'package:flutter/material.dart' hide Notification;
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
          _noTransitionRoute('/dashboard', const RoleBasedDashboard()),
          _noTransitionRoute('/profile', const MyProfile()),
          _noTransitionRoute('/users', Users()),
          _noTransitionRoute('/advertisements', const AdminAdsDashboard()),
          _noTransitionRoute('/add-user', AddUser()),
          _noTransitionRoute(
              '/create-ad', const Center(child: Text("Listing Management"))),
          _noTransitionRoute('/vehicle-models', VehicleModelsList()),
          _noTransitionRoute('/add-vehiclemodel', VehicleModelAdd()),
          _noTransitionRoute(
              '/vehicle-manufactures', VehicleManufacturesList()),
          _noTransitionRoute(
              '/add-vehiclemanufacturer', VehicleManufacturesAdd()),
          _noTransitionRoute('/showrooms', Showroom()),
          _noTransitionRoute('/add-showroom', ShowroomAdd()),
          _noTransitionRoute('/reports', const ReportList()),
          _noTransitionRoute('/banners', const BannerPage()),
          _noTransitionRoute('/upload-banners', const BannerUploadPage()),
          _noTransitionRoute('/notifications', Notification()),
          GoRoute(
            path: '/edit-user',
            pageBuilder: (context, state) {
              final user = state.extra as UserModel;
              return NoTransitionPage(child: EditUser(user: user));
            },
          ),
          GoRoute(
            path: '/view-user',
            pageBuilder: (context, state) {
              final user = state.extra as UserModel;
              return NoTransitionPage(child: UserView(user: user));
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
            path: '/edit-vehicle_manufacturer',
            pageBuilder: (context, state) {
              final vehiclemanufacturer = state.extra as VehicleManufacturer;
              return NoTransitionPage(
                  child: VehicleManufacturesEdit(
                      vehiclemanufacturer: vehiclemanufacturer));
            },
          ),
          GoRoute(
            path: '/view-vehicle_manufacturer',
            pageBuilder: (context, state) {
              final vehiclemanufacturer = state.extra as VehicleManufacturer;
              return NoTransitionPage(
                  child: VehicleManufacturerDetailView(
                      vehiclemanufacturer: vehiclemanufacturer));
            },
          ),
          GoRoute(
            path: '/view-vehicle_model',
            pageBuilder: (context, state) {
              final extra = state.extra;
              if (extra is! VehicleModel) {
                return const NoTransitionPage(
                  child: Center(
                    child: Text("⚠️ Vehicle Model data missing or invalid."),
                  ),
                );
              }

              return NoTransitionPage(
                  child: VehicleModelView(vehiclemodel: extra));
            },
          ),
          GoRoute(
            path: '/edit-vehicle_model',
            pageBuilder: (context, state) {
              final extra = state.extra;
              if (extra is! VehicleModel) {
                return const NoTransitionPage(
                  child: Center(
                      child: Text("⚠️ Vehicle Model data missing or invalid.")),
                );
              }
              return NoTransitionPage(child: VehicleModelEdit(model: extra));
            },
          ),
          GoRoute(
            path: '/add-vehiclevariant',
            builder: (context, state) {
              final vehicleModel = state.extra as VehicleModel;
              return VehicleVariantAdd(vehicleModel: vehicleModel);
            },
          ),
          GoRoute(
            path: '/edit-vehiclevariant',
            pageBuilder: (context, state) {
              final extra = state.extra;
              if (extra is! Map<String, dynamic>) {
                return const NoTransitionPage(
                  child: Center(
                    child: Text("⚠️ Variant data missing or invalid."),
                  ),
                );
              }
              final variant = extra['variant'] as VehicleVariantResponseModel;
              final vehicleModel = extra['vehicleModel'] as VehicleModel;
              return NoTransitionPage(
                child: VehicleVariantEdit(
                  variant: variant,
                  vehicleModel: vehicleModel,
                ),
              );
            },
          ),
          GoRoute(
            path: '/edit-banner',
            pageBuilder: (context, state) {
              final banner = state.extra as BannerUploadRequest;
              return NoTransitionPage(child: EditBanner(banner: banner));
            },
          ),
        ],
      ),
    ],
    redirect: (context, state) async {
      final isAuthenticated = await _isLoggedIn();
      final path = state.uri.toString();

      if (!isAuthenticated && path != '/') return '/';
      if (isAuthenticated && path == '/') return '/dashboard';
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
