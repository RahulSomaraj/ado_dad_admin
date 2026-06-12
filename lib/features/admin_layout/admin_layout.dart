import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/common/data_storage.dart';
import 'package:ado_dad_admin/common/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminLayout extends StatefulWidget {
  final Widget child;

  const AdminLayout({super.key, required this.child});

  @override
  State<AdminLayout> createState() => _AdminLayoutState();
}

class _AdminLayoutState extends State<AdminLayout> {
  String? userType;
  String? userName;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final name = await getUserName();
    final type = await getUserType();
    if (mounted) {
      setState(() {
        userType = type;
        userName = name;
      });
    }
  }

  String _initials(String name) {
    final words = name.trim().split(RegExp(r'\s+'));
    return words.length > 1
        ? '${words[0][0]}${words[1][0]}'.toUpperCase()
        : words[0][0].toUpperCase();
  }

  String _titleFromRoute(String route) {
    if (route == '/dashboard') return 'Dashboard';
    if (route == '/profile') return 'My Profile';
    if (['/users', '/add-user', '/edit-user', '/view-user']
        .contains(route)) return 'Users';
    if (route == '/advertisements') return 'Advertisements';
    if ([
      '/vehicle-manufactures',
      '/add-vehiclemanufacturer',
      '/edit-vehicle_manufacturer',
      '/view-vehicle_manufacturer',
    ].contains(route)) return 'Manufacturers';
    if ([
      '/vehicle-models',
      '/add-vehiclemodel',
      '/edit-vehicle_model',
      '/view-vehicle_model',
      '/add-vehiclevariant',
      '/edit-vehiclevariant',
    ].contains(route)) return 'Vehicle Models';
    if (['/showrooms', '/add-showroom', '/edit-showroom', '/view-showroom']
        .contains(route)) return 'Showrooms';
    if (['/reports', '/report-detail', '/user-moderation-history']
        .contains(route)) return 'Reports';
    if (route == '/notifications') return 'Notifications';
    if (['/banners', '/upload-banners', '/edit-banner']
        .contains(route)) return 'Banners';
    if (route == '/suspension-management') return 'Suspensions';
    if (route == '/appeals') return 'Appeals';
    if (route == '/moderation-settings') return 'Moderation Settings';
    return 'Dashboard';
  }

  @override
  Widget build(BuildContext context) {
    if (userType == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = constraints.maxWidth < 900;
        final route = GoRouterState.of(context).uri.toString();
        final pageTitle = _titleFromRoute(route);

        return Scaffold(
          backgroundColor: AppColors.background,
          drawer: isTablet
              ? AdminDrawer(userType: userType, userName: userName)
              : null,
          appBar: isTablet
              ? AppBar(
                  backgroundColor: AppColors.surface,
                  surfaceTintColor: Colors.transparent,
                  elevation: 0,
                  scrolledUnderElevation: 0,
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(1),
                    child: Container(height: 1, color: AppColors.border),
                  ),
                  title: Text(
                    pageTitle,
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  actions: [
                    if (userName != null)
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: AppColors.accent,
                          child: Text(
                            _initials(userName!),
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                  ],
                )
              : null,
          body: Row(
            children: [
              if (!isTablet)
                AdminDrawer(userType: userType, userName: userName),
              Expanded(child: widget.child),
            ],
          ),
        );
      },
    );
  }

}
