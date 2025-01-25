import 'package:flutter/material.dart';
import 'package:ado_dad_admin/dashboard/login/password_section.dart';

class EmailSection extends StatefulWidget {
  final FocusNode? focusNode;
  final FocusNode? passFocusNode;
  final TextEditingController emailController;
  final ValueChanged<String> onChanged; // Callback for value change

  const EmailSection({
    super.key,
    required this.emailController,
    this.focusNode,
    this.passFocusNode,
    required FocusNode passwordFocusNode,
    required this.onChanged,
  });

  @override
  State<EmailSection> createState() => _EmailSectionState();
}

class _EmailSectionState extends State<EmailSection> {
  late FocusNode _internalFocusNode;
  late FocusNode _internalPassFocusNode;
  String? errorText;

  @override
  void initState() {
    super.initState();
    _internalFocusNode = widget.focusNode ?? FocusNode();
    _internalPassFocusNode = widget.passFocusNode ?? FocusNode();
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _internalFocusNode.dispose();
    }
    super.dispose();
  }

  // Email Validation Logic
  void _validateEmail(String value) {
    const String emailPattern =
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final regExp = RegExp(emailPattern);

    setState(() {
      if (value.isEmpty) {
        errorText = 'Email is required';
      } else if (!regExp.hasMatch(value)) {
        errorText = 'Enter a valid email address';
      } else {
        errorText = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildEmailForm(),
        const SizedBox(height: 10),
        PasswordTextField(
          passwordFocusNode: _internalPassFocusNode,
          onChanged: widget.onChanged,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              // Forgot password logic
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Forgot password tapped')),
              );
            },
            child: const Text(
              'Forgot Password?',
              style: TextStyle(
                color: Color.fromARGB(255, 29, 29, 29),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailForm() {
    return TextFormField(
      focusNode: _internalFocusNode,
      controller: widget.emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Enter your email',
        errorText: errorText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        prefixIcon: const Padding(
          padding: EdgeInsets.all(12),
          child: Icon(Icons.email),
        ),
      ),
      onChanged: (value) {
        _validateEmail(value);
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        if (errorText != null) {
          return errorText;
        }
        return null;
      },
    );
  }
}
