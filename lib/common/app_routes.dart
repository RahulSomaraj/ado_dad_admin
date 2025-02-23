import 'package:ado_dad_admin/common/data_storage.dart';
import 'package:ado_dad_admin/showroom/features/admin_layout/admin_layout.dart';
import 'package:ado_dad_admin/showroom/features/login/ui/login.dart';
import 'package:ado_dad_admin/showroom/features/profile/user_profile.dart';
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
          GoRoute(
            path: '/dashboard',
            builder: (context, state) =>
                const Center(child: Text("Dashboard Content")),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const MyProfile(),
          ),
          GoRoute(
            path: '/users',
            builder: (context, state) => const Center(child: Text("Users")),
          ),
          GoRoute(
            path: '/create-ad',
            builder: (context, state) =>
                const Center(child: Text("Listing Management")),
          ),
          GoRoute(
            path: '/listing-management',
            builder: (context, state) =>
                const Center(child: Text(" Management")),
          ),
          GoRoute(
            path: '/promotion',
            builder: (context, state) =>
                const Center(child: Text("promotion Management")),
          ),
          GoRoute(
            path: '/showrooms',
            builder: (context, state) =>
                const Center(child: Text("showrooms Management")),
          ),
          GoRoute(
            path: '/reports',
            builder: (context, state) =>
                const Center(child: Text("reports Management")),
          ),
          GoRoute(
            path: '/notifications',
            builder: (context, state) =>
                const Center(child: Text("Noti Management")),
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

Future<bool> _isLoggedIn() async {
  final token = await getToken();
  return token != null;
}
