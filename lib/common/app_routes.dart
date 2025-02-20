import 'package:ado_dad_admin/features/login/ui/login.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginPage(),
      ),
         GoRoute(
        path: '/dashboard',
        builder: (context, state) => const LoginPage(),
      ),
      // GoRoute(
      //   path: '/wishlist',
      //   builder: (context, state) {
      //     final wishListItems = state.extra as List<BaseModel>?;

      //     return WishList(
      //       wishListItems: wishListItems ?? [],
      //     );
      //   },
      // ),
      // GoRoute(
      //   path: '/details/:id',
      //   builder: (context, state) {
      //     final id = int.parse(state.pathParameters['id']!);
      //     return ItemDetail(itemId: id);
      //   },
      // ),
      // GoRoute(
      //   path: '/seller',
      //   name: 'seller',
      //   builder: (context, state) => const Seller(),
      // ),
    ],
  );
}
