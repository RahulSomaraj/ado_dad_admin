import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/features/login/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminDrawer extends StatefulWidget {
  final String? userType;
  final String? userName;

  const AdminDrawer({
    super.key,
    required this.userType,
    this.userName,
  });

  @override
  State<AdminDrawer> createState() => _AdminDrawerState();
}

class _AdminDrawerState extends State<AdminDrawer> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {});
  }

  String get _currentRoute => GoRouterState.of(context).uri.toString();

  bool _isActive(String route) {
    final current = _currentRoute;
    switch (route) {
      case '/users':
        return ['/users', '/add-user', '/edit-user', '/view-user']
            .contains(current);
      case '/vehicle-manufactures':
        return [
          '/vehicle-manufactures',
          '/add-vehiclemanufacturer',
          '/edit-vehicle_manufacturer',
          '/view-vehicle_manufacturer',
        ].contains(current);
      case '/vehicle-models':
        return [
          '/vehicle-models',
          '/add-vehiclemodel',
          '/edit-vehicle_model',
          '/view-vehicle_model',
          '/add-vehiclevariant',
          '/edit-vehiclevariant',
        ].contains(current);
      case '/vehicle-variants':
        return [
          '/vehicle-variants',
          '/view-vehiclevariant',
        ].contains(current);
      case '/showrooms':
        return [
          '/showrooms',
          '/add-showroom',
          '/edit-showroom',
          '/view-showroom',
        ].contains(current);
      case '/reports':
        return ['/reports', '/report-detail', '/user-moderation-history']
            .contains(current);
      case '/banners':
        return ['/banners', '/upload-banners', '/edit-banner']
            .contains(current);
      default:
        return current == route;
    }
  }

  String _initials(String name) {
    final words = name.trim().split(RegExp(r'\s+'));
    return words.length > 1
        ? '${words[0][0]}${words[1][0]}'.toUpperCase()
        : words[0][0].toUpperCase();
  }

  String _roleLabel(String? type) {
    switch (type) {
      case 'SA':
        return 'Super Admin';
      case 'AD':
        return 'Admin';
      case 'SR':
        return 'Showroom';
      default:
        return type ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      color: AppColors.surface,
      child: Column(
        children: [
          _buildLogo(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: _buildMenu(),
            ),
          ),
          _buildUserChip(),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        children: [
          Flexible(
            child: Image.asset('assets/images/splashVector.png', height: 28),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Image.asset('assets/images/Ado Dad11.png', height: 32),
          ),
        ],
      ),
    );
  }

  Widget _buildMenu() {
    if (widget.userType == 'SA' || widget.userType == 'AD') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _section('MAIN', [
            _navItem(
              icon: Icons.grid_view_outlined,
              activeIcon: Icons.grid_view_rounded,
              label: 'Dashboard',
              route: '/dashboard',
            ),
            _navItem(
              icon: Icons.person_outline_rounded,
              activeIcon: Icons.person_rounded,
              label: 'Profile',
              route: '/profile',
            ),
          ]),
          _section('PEOPLE', [
            _navItem(
              icon: Icons.people_outline_rounded,
              activeIcon: Icons.people_rounded,
              label: 'Users',
              route: '/users',
            ),
            _navItem(
              icon: Icons.store_outlined,
              activeIcon: Icons.store_rounded,
              label: 'Showrooms',
              route: '/showrooms',
            ),
          ]),
          _section('CATALOG', [
            _navItem(
              icon: Icons.factory_outlined,
              activeIcon: Icons.factory_rounded,
              label: 'Manufacturers',
              route: '/vehicle-manufactures',
            ),
            _navItem(
              icon: Icons.directions_car_outlined,
              activeIcon: Icons.directions_car_rounded,
              label: 'Vehicle Models',
              route: '/vehicle-models',
            ),
            _navItem(
              icon: Icons.tune_outlined,
              activeIcon: Icons.tune,
              label: 'Vehicle Variants',
              route: '/vehicle-variants',
            ),
          ]),
          _section('CONTENT', [
            if (widget.userType == 'SA')
              _navItem(
                icon: Icons.view_list_outlined,
                activeIcon: Icons.view_list_rounded,
                label: 'Advertisements',
                route: '/advertisements',
              ),
            _navItem(
              icon: Icons.view_carousel_outlined,
              activeIcon: Icons.view_carousel_rounded,
              label: 'Banners',
              route: '/banners',
            ),
            _navItem(
              icon: Icons.notifications_outlined,
              activeIcon: Icons.notifications_rounded,
              label: 'Notifications',
              route: '/notifications',
            ),
          ]),
          _section('MODERATION', [
            _navItem(
              icon: Icons.flag_outlined,
              activeIcon: Icons.flag_rounded,
              label: 'Reports',
              route: '/reports',
            ),
            _navItem(
              icon: Icons.block_outlined,
              activeIcon: Icons.block_rounded,
              label: 'Suspensions',
              route: '/suspension-management',
            ),
            _navItem(
              icon: Icons.gavel_outlined,
              activeIcon: Icons.gavel_rounded,
              label: 'Appeals',
              route: '/appeals',
            ),
            if (widget.userType == 'SA')
              _navItem(
                icon: Icons.tune_outlined,
                activeIcon: Icons.tune_rounded,
                label: 'Mod. Settings',
                route: '/moderation-settings',
              ),
          ]),
        ],
      );
    } else if (widget.userType == 'SR') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _section('MAIN', [
            _navItem(
              icon: Icons.grid_view_outlined,
              activeIcon: Icons.grid_view_rounded,
              label: 'Dashboard',
              route: '/dashboard',
            ),
            _navItem(
              icon: Icons.person_outline_rounded,
              activeIcon: Icons.person_rounded,
              label: 'Profile',
              route: '/profile',
            ),
          ]),
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _section('MAIN', [
          _navItem(
            icon: Icons.grid_view_outlined,
            activeIcon: Icons.grid_view_rounded,
            label: 'Dashboard',
            route: '/dashboard',
          ),
          _navItem(
            icon: Icons.person_outline_rounded,
            activeIcon: Icons.person_rounded,
            label: 'Profile',
            route: '/profile',
          ),
          _navItem(
            icon: Icons.add_circle_outline_rounded,
            activeIcon: Icons.add_circle_rounded,
            label: 'Add Advertisement',
            route: '/create-ad',
          ),
        ]),
      ],
    );
  }

  Widget _section(String label, List<Widget> items) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            child: Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: AppColors.textMuted,
                letterSpacing: 0.8,
              ),
            ),
          ),
          ...items,
        ],
      ),
    );
  }

  Widget _navItem({
    required IconData icon,
    IconData? activeIcon,
    required String label,
    required String route,
  }) {
    final active = _isActive(route);
    return InkWell(
      onTap: () => context.go(route),
      borderRadius: BorderRadius.circular(8),
      hoverColor: AppColors.surfaceAlt,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
        decoration: BoxDecoration(
          color: active ? AppColors.accentSoft : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              width: 3,
              height: 18,
              decoration: BoxDecoration(
                color: active ? AppColors.accent : Colors.transparent,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 10),
            Icon(
              active ? (activeIcon ?? icon) : icon,
              size: 18,
              color: active ? AppColors.accent : AppColors.textSecondary,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: 13.5,
                  fontWeight:
                      active ? FontWeight.w600 : FontWeight.w400,
                  color:
                      active ? AppColors.accent : AppColors.textSecondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserChip() {
    final name = widget.userName ?? 'User';
    final initials = _initials(name);
    final role = _roleLabel(widget.userType);

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Initial) {
          context.replace('/');
        }
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: AppColors.border)),
        ),
        child: InkWell(
          onTap: () => _showLogoutDialog(context),
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.surfaceAlt,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: AppColors.accent,
                  child: Text(
                    initials,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.inter(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        role,
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          color: AppColors.textMuted,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.logout_rounded,
                  size: 16,
                  color: AppColors.textMuted,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Text(
          'Sign out?',
          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
        ),
        content: Text(
          'You will be returned to the login screen.',
          style: GoogleFonts.inter(color: AppColors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: GoogleFonts.inter(color: AppColors.textSecondary),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.danger,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: () {
              Navigator.pop(context);
              context.read<AuthBloc>().add(AuthEvent.logout());
            },
            child: Text('Sign out', style: GoogleFonts.inter()),
          ),
        ],
      ),
    );
  }
}
