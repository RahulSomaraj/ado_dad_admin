import 'package:ado_dad_admin/common/text_style.dart';
import 'package:ado_dad_admin/features/login/bloc/auth_bloc.dart';
import 'package:ado_dad_admin/features/widgets/input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          child: Container(
            color: Colors.white,
            width: 500,
            padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 25),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    height: 40,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Login",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
      ),
    );
  }

  TextFormField _buildUsername() {
    return TextFormField(
      controller: _usernameController,
      decoration: textFieldDecoration('Username'),
      style: AppTextStyle.texttstyle,
      validator: (value) => value!.isEmpty ? "Enter Username" : null,
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
                context.read<AuthBloc>().add(AuthEvent.login(
                      username: _usernameController.text.trim(),
                      password: _passwordController.text.trim(),
                    ));
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
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
