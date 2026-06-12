import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/common/data_storage.dart';
import 'package:ado_dad_admin/models/login_model.dart';
import 'package:ado_dad_admin/models/user_model.dart';
import 'package:ado_dad_admin/repositories/user_rep.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> with RouteAware {
  String? userName;
  String? userEmail;
  String? userPhone;
  String? userType;
  String? userProfilePic;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Only refresh if we're actually on the profile route
    final currentRoute = GoRouterState.of(context).uri.toString();
    if (currentRoute == '/profile') {
      _loadUserData();
    }
  }

  @override
  void didPopNext() {
    // Called when returning to this route from another route
    super.didPopNext();
    if (mounted) {
      // Always refresh data when returning to profile page
      _loadUserData();
    }
  }

  Future<void> _loadUserData() async {
    // Always get the logged-in user's ID first to ensure we're loading the
    // correct user's data.
    final loggedInUserId = await getUserId();
    if (loggedInUserId == null) {
      return;
    }

    final name = await getUserName();
    final type = await getUserType();
    final email = await getUserEmail();
    final phone = await getUserPhoneNumber();
    final profilePic = await getUserProfilePicture();

    if (mounted) {
      setState(() {
        userType = type;
        userName = name;
        userEmail = email;
        userPhone = phone;
        userProfilePic = profilePic;
      });
    }
  }

  bool get _canEdit =>
      userType == 'SR' || userType == 'AD' || userType == 'SA';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeader(),
              const SizedBox(height: 16),
              _buildHeroCard(),
              const SizedBox(height: 16),
              _buildDetailsCard(),
            ],
          ),
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Page header
  // ---------------------------------------------------------------------------
  Widget _buildHeader() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final compact = constraints.maxWidth < 420;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Home / Profile",
                      style: GoogleFonts.inter(
                          fontSize: 12, color: AppColors.textMuted)),
                  const SizedBox(height: 2),
                  Text("My profile",
                      style: GoogleFonts.inter(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary)),
                  const SizedBox(height: 2),
                  Text("Your account information",
                      style: GoogleFonts.inter(
                          fontSize: 13, color: AppColors.textSecondary)),
                ],
              ),
            ),
            if (_canEdit)
              compact
                  ? OutlinedButton(
                      onPressed: _navigateToEditProfile,
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12),
                      ),
                      child: const Icon(Icons.edit_outlined, size: 18),
                    )
                  : OutlinedButton.icon(
                      onPressed: _navigateToEditProfile,
                      icon: const Icon(Icons.edit_outlined, size: 17),
                      label: const Text("Edit profile"),
                    ),
          ],
        );
      },
    );
  }

  // ---------------------------------------------------------------------------
  // Hero card (banner + avatar + name + role)
  // ---------------------------------------------------------------------------
  Widget _buildHeroCard() {
    const double bannerHeight = 84;
    const double avatarOuter = 88; // 80 avatar + 4px ring each side
    const double overlap = 44; // how far the avatar dips below the banner

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner with the avatar overlapping its bottom edge.
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: bannerHeight,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [AppColors.accent, AppColors.accentHover],
                  ),
                ),
              ),
              Positioned(
                left: 24,
                top: bannerHeight - overlap,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: AppColors.surface,
                    shape: BoxShape.circle,
                  ),
                  child: _buildAvatar(),
                ),
              ),
            ],
          ),
          // Reserve space for the part of the avatar hanging below the banner.
          const SizedBox(height: avatarOuter - overlap + 12),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName ?? "Loading…",
                  style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 10,
                  runSpacing: 6,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    _roleChip(getFullUserType(userType ?? "NU")),
                    if (userEmail != null && userEmail!.isNotEmpty)
                      _inlineMeta(Icons.mail_outline, userEmail!),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    final profileImage = _getProfileImage();
    return CircleAvatar(
      radius: 40,
      backgroundColor: AppColors.accentSoft,
      backgroundImage: profileImage,
      child: profileImage == null
          ? Text(
              _getInitials(userName ?? "User"),
              style: GoogleFonts.inter(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: AppColors.accent,
              ),
            )
          : null,
    );
  }

  Widget _roleChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.accentSoft,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: GoogleFonts.inter(
            fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.accent),
      ),
    );
  }

  Widget _inlineMeta(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 15, color: AppColors.textMuted),
        const SizedBox(width: 5),
        Text(text,
            style: GoogleFonts.inter(
                fontSize: 13, color: AppColors.textSecondary)),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // Details card
  // ---------------------------------------------------------------------------
  Widget _buildDetailsCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Account information",
              style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary)),
          const SizedBox(height: 16),
          LayoutBuilder(
            builder: (context, constraints) {
              final twoCol = constraints.maxWidth >= 520;
              final items = [
                _detailItem(Icons.person_outline, "Full name", userName),
                _detailItem(Icons.mail_outline, "Email", userEmail),
                _detailItem(Icons.phone_outlined, "Phone", userPhone),
                _detailItem(Icons.badge_outlined, "Role",
                    getFullUserType(userType ?? "NU")),
              ];
              if (!twoCol) {
                return Column(
                  children: [
                    for (int i = 0; i < items.length; i++) ...[
                      items[i],
                      if (i != items.length - 1) const Divider(height: 24),
                    ],
                  ],
                );
              }
              return Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: items[0]),
                      const SizedBox(width: 24),
                      Expanded(child: items[1]),
                    ],
                  ),
                  const Divider(height: 28),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: items[2]),
                      const SizedBox(width: 24),
                      Expanded(child: items[3]),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _detailItem(IconData icon, String label, String? value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: AppColors.surfaceAlt,
            borderRadius: BorderRadius.circular(9),
          ),
          child: Icon(icon, size: 17, color: AppColors.textSecondary),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: GoogleFonts.inter(
                      fontSize: 12, color: AppColors.textMuted)),
              const SizedBox(height: 3),
              Text(
                (value == null || value.isEmpty) ? "—" : value,
                style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // Preserved helpers / logic
  // ---------------------------------------------------------------------------
  ImageProvider? _getProfileImage() {
    if (userProfilePic != null &&
        userProfilePic!.isNotEmpty &&
        userProfilePic != 'default-profile-pic-url') {
      return NetworkImage(userProfilePic!);
    }
    return null;
  }

  String _getInitials(String name) {
    final words = name.trim().split(RegExp(r'\s+'));
    if (words.length > 1) {
      return "${words[0][0].toUpperCase()}${words[1][0].toUpperCase()}";
    }
    return words.isNotEmpty && words[0].isNotEmpty
        ? words[0][0].toUpperCase()
        : "U";
  }

  void _navigateToEditProfile() async {
    // Get user ID from storage
    final userId = await getUserId();

    if (userId != null && userName != null && userEmail != null && mounted) {
      UserModel? currentUser;

      // Try to fetch the latest user data from API to get countryCode
      try {
        final userRepository = UserRepository();
        currentUser = await userRepository.fetchUserById(userId);
      } catch (e) {
        // If API call fails, use data from storage
        final countryCode = await getUserCountryCode();
        currentUser = UserModel(
          id: userId,
          name: userName!,
          email: userEmail!,
          phoneNumber: userPhone ?? '',
          userType: userType ?? 'SR',
          profilePic: userProfilePic ?? '',
          countryCode: countryCode,
        );
      }

      // Navigate to edit page using GoRouter
      if (mounted) {
        // Determine which edit route to use based on user type
        final editRoute = userType == 'SR' ? '/edit-showroom' : '/edit-user';
        await context.push(editRoute, extra: currentUser);
        // Always refresh data when returning from edit page
        if (mounted) {
          _loadUserData();
        }
      }
    }
  }
}
