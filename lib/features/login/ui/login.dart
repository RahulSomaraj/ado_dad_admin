import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/common/text_style.dart';
import 'package:ado_dad_admin/features/login/bloc/auth_bloc.dart';
import 'package:ado_dad_admin/features/widgets/input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
      backgroundColor: AppColors.scaffoldColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth;

          // if (width < 768) {
          //   // For mobile screens: Show nothing or a message
          //   return const Center(
          //     child: Text(
          //       "Please use a tablet or desktop to access the admin panel.",
          //       textAlign: TextAlign.center,
          //       style: TextStyle(fontSize: 18),
          //     ),
          //   );
          // }

          // iPad and desktop
          double cardWidth = width >= 1024 ? 600 : 500;

          return Center(
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              child: Container(
                color: Colors.white,
                width: cardWidth,
                padding:
                    const EdgeInsets.symmetric(vertical: 100, horizontal: 25),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            "assets/images/splashVector.png",
                            height: 60,
                          ),
                          const SizedBox(height: 10),
                          Image.asset(
                            "assets/images/Ado Dad11.png",
                            height: 60,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      _buildUsername(),
                      const SizedBox(height: 16),
                      _buildPassword(),
                      const SizedBox(height: 20),
                      _buildLoginBtnn(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: AppColors.scaffoldColor,
  //     body: Center(
  //       child: Card(
  //         elevation: 4,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(0),
  //         ),
  //         child: Container(
  //           color: Colors.white,
  //           width: 500,
  //           padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 25),
  //           child: Form(
  //             key: _formKey,
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: [
  //                 Image.asset(
  //                   "assets/images/ado-dad-logo.png",
  //                   height: 100,
  //                 ),
  //                 const SizedBox(height: 20),
  //                 const Text(
  //                   "Login",
  //                   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
  //                 ),
  //                 const SizedBox(height: 20),
  //                 _buildUsername(),
  //                 const SizedBox(height: 16),
  //                 _buildPassword(),
  //                 const SizedBox(height: 20),
  //                 _buildLoginBtnn(),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildUsername() {
    return TextFormField(
      controller: _usernameController,
      keyboardType: TextInputType.text,
      decoration: textFieldDecoration('Phone Number or Email').copyWith(
        prefixIcon: _showCountryCode ? _buildCountryCodeSelector() : null,
      ),
      style: AppTextStyle.texttstyle,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Enter Phone Number or Email";
        }
        return null;
      },
    );
  }

  Widget _buildCountryCodeSelector() {
    return GestureDetector(
      onTap: () => _showCountryPicker(),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
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
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.arrow_drop_down, size: 20),
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
      decoration: textFieldDecoration('Password').copyWith(
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
      style: AppTextStyle.texttstyle,
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
                  title: Center(child: const Text("Login Failed")),
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
        return SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                String username = _usernameController.text.trim();

                // If input is not an email, treat it as phone number and add country code
                if (!_isEmail(username)) {
                  final countryCode = '+${_selectedCountry?.phoneCode ?? '1'}';
                  username = '$countryCode$username';
                }
                // If it's an email, use it as is (no country code)

                context.read<AuthBloc>().add(AuthEvent.login(
                      username: username,
                      password: _passwordController.text.trim(),
                    ));
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: state.maybeWhen(
              loading: () => const CircularProgressIndicator(
                color: Colors.white,
              ),
              orElse: () => Text("Login", style: AppTextStyle.buttonTextstyle),
            ),
          ),
        );
      },
    );
  }
}
