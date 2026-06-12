import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/features/login/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:country_picker/country_picker.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _obscureText = true;
  Country? _selectedCountry;
  bool _showCountryCode = true; // Show by default

  @override
  void initState() {
    super.initState();
    _selectedCountry = Country.parse('US');
    // Listen to username field changes to detect if it's email or phone
    _usernameController.addListener(_detectInputType);
  }

  @override
  void dispose() {
    _usernameController.removeListener(_detectInputType);
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  /// Detect if user is typing email or phone number based on first character
  void _detectInputType() {
    final text = _usernameController.text.trim();
    if (text.isEmpty) {
      setState(() {
        _showCountryCode = true; // Show by default when empty
      });
      return;
    }

    // Check first character - if it's a letter, likely email (hide country code)
    // If it's a number, likely phone (show country code)
    final firstChar = text[0];
    final isLetter = RegExp(r'[a-zA-Z]').hasMatch(firstChar);

    setState(() {
      _showCountryCode =
          !isLetter; // Hide if starts with letter, show if starts with number
    });
  }

  /// Check if the input is an email address
  bool _isEmail(String input) {
    return input.contains('@') && input.contains('.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final showBrandPanel = constraints.maxWidth >= 880;

              return ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: showBrandPanel ? 940 : 440,
                ),
                child: Material(
                  elevation: 0,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.border),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 30,
                          offset: const Offset(0, 12),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          if (showBrandPanel)
                            Expanded(child: _buildBrandPanel()),
                          Expanded(child: _buildFormPanel()),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // -------------------------------------------------------------------------
  // Left brand panel (wide screens only)
  // -------------------------------------------------------------------------
  Widget _buildBrandPanel() {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.accent, AppColors.accentHover],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Image.asset(
              "assets/images/splashVector.png",
              height: 40,
              errorBuilder: (_, __, ___) =>
                  const Icon(Icons.directions_car_filled,
                      color: Colors.white, size: 40),
            ),
          ),
          const Spacer(),
          Text(
            "Ado-dad\nAdmin Console",
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 32,
              height: 1.2,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Manage users, showrooms, the vehicle catalog, "
            "advertisements and reports — all in one place.",
            style: GoogleFonts.inter(
              color: Colors.white.withOpacity(0.85),
              fontSize: 15,
              height: 1.5,
            ),
          ),
          const Spacer(),
          Text(
            "© ${DateTime.now().year} Ado-dad",
            style: GoogleFonts.inter(
              color: Colors.white.withOpacity(0.7),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  // -------------------------------------------------------------------------
  // Right form panel
  // -------------------------------------------------------------------------
  Widget _buildFormPanel() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 48),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/Ado Dad11.png",
              height: 44,
              errorBuilder: (_, __, ___) => const SizedBox.shrink(),
            ),
            const SizedBox(height: 28),
            Text(
              "Welcome back",
              style: GoogleFonts.inter(
                fontSize: 26,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              "Sign in to your admin account",
              style: GoogleFonts.inter(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 28),
            _fieldLabel("Phone number or email"),
            const SizedBox(height: 6),
            _buildUsername(),
            const SizedBox(height: 18),
            _fieldLabel("Password"),
            const SizedBox(height: 6),
            _buildPassword(),
            const SizedBox(height: 28),
            _buildLoginBtnn(),
          ],
        ),
      ),
    );
  }

  Widget _fieldLabel(String text) => Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
      );

  InputDecoration _decoration(String hint,
      {Widget? suffixIcon, Widget? prefixIcon}) {
    return InputDecoration(
      hintText: hint,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      isDense: true,
    );
  }

  // -------------------------------------------------------------------------
  // Fields — phone/email detection + validators preserved
  // -------------------------------------------------------------------------
  TextFormField _buildUsername() {
    return TextFormField(
      controller: _usernameController,
      keyboardType: TextInputType.text,
      decoration: _decoration(
        'Phone number or email',
        prefixIcon: _showCountryCode ? _buildCountryCodeSelector() : null,
      ),
      style: GoogleFonts.inter(fontSize: 15, color: AppColors.textPrimary),
      validator: (value) => (value == null || value.isEmpty)
          ? "Enter Phone Number or Email"
          : null,
    );
  }

  Widget _buildCountryCodeSelector() {
    return GestureDetector(
      onTap: () => _showCountryPicker(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_selectedCountry != null)
              Text(
                _selectedCountry!.flagEmoji,
                style: const TextStyle(fontSize: 20),
              ),
            const SizedBox(width: 4),
            Text(
              '+${_selectedCountry?.phoneCode ?? '1'}',
              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(width: 2),
            const Icon(Icons.arrow_drop_down,
                size: 20, color: AppColors.textSecondary),
          ],
        ),
      ),
    );
  }

  void _showCountryPicker() {
    showCountryPicker(
      context: context,
      onSelect: (Country country) {
        setState(() {
          _selectedCountry = country;
        });
      },
      favorite: ['US', 'IN', 'GB'],
      showPhoneCode: true,
    );
  }

  TextFormField _buildPassword() {
    return TextFormField(
      controller: _passwordController,
      obscureText: _obscureText,
      decoration: _decoration(
        'Enter your password',
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            color: AppColors.textMuted,
            size: 20,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
      style: GoogleFonts.inter(fontSize: 15, color: AppColors.textPrimary),
      validator: (value) => value!.isEmpty ? "Enter Password" : null,
    );
  }

  BlocConsumer<AuthBloc, AuthState> _buildLoginBtnn() {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (username, userType) {
            if (context.mounted) {
              context.go('/dashboard');
            }
          },
          failure: (message) {
            if (context.mounted) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                  title: const Text("Login Failed"),
                  content: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(message),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => context.pop(),
                      child: const Text("OK"),
                    ),
                  ],
                ),
              );
            }
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );
        return SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: isLoading
                ? null
                : () {
                    if (_formKey.currentState!.validate()) {
                      String username = _usernameController.text.trim();

                      // If input is not an email, treat it as phone number and
                      // prepend the selected country code.
                      if (!_isEmail(username)) {
                        final countryCode =
                            '+${_selectedCountry?.phoneCode ?? '1'}';
                        username = '$countryCode$username';
                      }

                      context.read<AuthBloc>().add(AuthEvent.login(
                            username: username,
                            password: _passwordController.text.trim(),
                          ));
                    }
                  },
            child: isLoading
                ? const SizedBox(
                    height: 22,
                    width: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.4,
                      color: Colors.white,
                    ),
                  )
                : Text(
                    "Sign in",
                    style: GoogleFonts.inter(
                        fontSize: 15, fontWeight: FontWeight.w600),
                  ),
          ),
        );
      },
    );
  }
}
