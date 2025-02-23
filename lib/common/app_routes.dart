import 'package:ado_dad_admin/showroom/features/home/home.dart';
import 'package:ado_dad_admin/showroom/features/login/ui/login.dart';
import 'package:ado_dad_admin/showroom/features/user_profile.dart';
import 'package:ado_dad_admin/common/data_storage.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const Home(selectedPage: 0),
      ),
      GoRoute(
        path: "/profile",
        builder: (context, state) => const ProfilePage(),
      ),
      GoRoute(
        path: '/users',
        builder: (context, state) => const Home(selectedPage: 1),
      ),
      GoRoute(
        path: '/add-user',
        builder: (context, state) => const Home(selectedPage: 8),
      ),
      GoRoute(
        path: '/listing-management',
        builder: (context, state) => const Home(selectedPage: 2),
      ),
      GoRoute(
        path: '/promotion',
        builder: (context, state) => const Home(selectedPage: 3),
      ),
      GoRoute(
        path: '/showrooms',
        builder: (context, state) => const Home(selectedPage: 4),
      ),
      GoRoute(
        path: '/reports',
        builder: (context, state) => const Home(selectedPage: 5),
      ),
      GoRoute(
        path: '/notifications',
        builder: (context, state) => const Home(selectedPage: 6),
      ),
    ],
    redirect: (context, state) async {
      final isAuthenticated = await _isLoggedIn();

      if (!isAuthenticated) {
        if (state.uri.toString() != '/') {
          return '/';
        }
      } else {
        if (state.uri.toString() == '/' || state.uri.toString() == '/login') {
          return '/home';
        }
      }

      return null;
    },
  );

  static Future<bool> _isLoggedIn() async {
    final token = await getToken();
    return token != null;
  }
}
