import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final FocusNode passwordFocusNode;
  final ValueChanged<String> onChanged; // Callback for value change

  const PasswordTextField(
      {super.key, required this.passwordFocusNode, required this.onChanged});

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _obscureText,
      focusNode: widget.passwordFocusNode,
      onChanged: (value) {
        widget.onChanged(value);
      },
      decoration: InputDecoration(
        labelText: 'Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText; // Toggle obscure state
                print(_passwordController.value);
              });
              widget.passwordFocusNode.requestFocus();
            },
          ),
        ),
      ),
    );
  }
}
