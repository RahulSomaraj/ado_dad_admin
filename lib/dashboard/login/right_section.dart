import 'package:ado_dad_admin/core/model/auth/login_model.dart';
import 'package:ado_dad_admin/core/bloc/login/login_bloc.dart';
import 'package:ado_dad_admin/dashboard/login/email_section.dart';
import 'package:ado_dad_admin/dashboard/login/otp_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ado_dad_admin/core/bloc/login/login_event.dart';
import 'package:ado_dad_admin/core/bloc/login/login_state.dart';

class RightSection extends StatefulWidget {
  const RightSection({super.key});

  @override
  State<RightSection> createState() => _RightSectionState();
}

class _RightSectionState extends State<RightSection> {
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  bool _signInOtp = false; // Toggle between email and OTP login
  bool _isOtpSend = false; // Toggle between email and OTP login
  late String _loginString;
  final bool _isEmailLogin = true; // Track if email login is active
  String _password = '';

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _phoneFocusNode.dispose();
    _emailController.dispose();
    _otpController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _loginString = _signInOtp ? 'Login with OTP' : 'Login with Email';
    super.initState();
  }

  // Form validation before triggering login
  bool _validateForm() {
    if (_emailController.text.isEmpty || _password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all fields'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
    return true;
  }

  void _onPasswordChanged(String value) {
    setState(() {
      _password = value;
    });
  }

  void showTopRightDialog(BuildContext context, String message, Color color) {
    final overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 50,
        right: 20,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.error, color: Colors.white),
                const SizedBox(width: 10),
                Text(
                  message,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    if (overlayEntry.mounted) {
                      overlayEntry.remove();
                    }
                  },
                  child: const Icon(Icons.close, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    // Auto-dismiss after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (overlayEntry.mounted) {
        overlayEntry.remove();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        print('BLoC State: $state');
        if (state is LoginLoaded) {
          showTopRightDialog(
              context, state.user.id, const Color.fromARGB(255, 149, 248, 129));
          Navigator.pushReplacementNamed(context, '/home');
        } else if (state is LoginError) {
          showTopRightDialog(
              context, state.message, const Color.fromARGB(255, 245, 15, 15));
        }
      },
      child: Container(
        color: Colors.white,
        child: Center(
          child: Container(
            width: 800,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Login To Your Account !',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Securely log in and enjoy a seamless experience with us!',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 100, 100, 100),
                    ),
                  ),
                  const SizedBox(height: 40),
                  _signInOtp ? _buildOtpForm() : _buildEmailForm(),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: (state is! LoginLoading &&
                                  (!_signInOtp ||
                                      (_isEmailLogin && _isOtpSend)))
                              ? () {
                                  if (_validateForm()) {
                                    context.read<LoginBloc>().add(
                                          LoginWithEmail(
                                            loginModel: LoginModel(
                                              username: _emailController.text,
                                              password: _password,
                                            ),
                                          ),
                                        );
                                  }
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                (!_signInOtp || (_isEmailLogin && _isOtpSend))
                                    ? const Color(0xFFF05555)
                                    : Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: state is LoginLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  _loginString,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _signInOtp
                            ? 'Login with Email instead?'
                            : 'Login with OTP instead?',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 100, 100, 100),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _signInOtp = !_signInOtp;
                            _isOtpSend = false;
                            _loginString = _signInOtp
                                ? 'Login with OTP'
                                : 'Login with Email';
                          });
                        },
                        child: Text(
                          _signInOtp ? 'Email Login' : 'OTP Login',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 29, 29, 29),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailForm() {
    return EmailSection(
      emailController: _emailController,
      passwordFocusNode: _passwordFocusNode,
      onChanged: _onPasswordChanged,
    );
  }

  Widget _buildOtpForm() {
    return OtpSection(
      otpController: _otpController,
      setButtonEnabled: (bool isButtonEnabled) {
        setState(() {
          _isOtpSend = isButtonEnabled;
        });
      },
    );
  }
}
