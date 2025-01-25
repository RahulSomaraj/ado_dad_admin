import 'package:ado_dad_admin/dashboard/login/phone_number.dart';
import 'package:flutter/material.dart';

class OtpSection extends StatefulWidget {
  final TextEditingController otpController;
  final Function(bool) setButtonEnabled;

  const OtpSection({
    super.key,
    required this.otpController,
    required this.setButtonEnabled,
  });
  @override
  State<OtpSection> createState() => _OtpSectionState();
}

class _OtpSectionState extends State<OtpSection> {
  final FocusNode _otpFocusNode = FocusNode();
  bool _showOtpField = false;

  @override
  void dispose() {
    _otpFocusNode.dispose();
    super.dispose();
  }

  void _sendPhoneNumber() {
    // Simulate sending phone number and receiving OTP
    setState(() {
      _showOtpField = true;
    });
    widget.setButtonEnabled(true);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('OTP Sent Successfully'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PhoneNumberField(
          onSubmit:
              _sendPhoneNumber, // Trigger OTP logic when phone number is submitted
        ),
        const SizedBox(height: 20),
        if (_showOtpField) ...[
          TextFormField(
            focusNode: _otpFocusNode,
            controller: widget.otpController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'OTP',
              hintText: 'Enter OTP',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              prefixIcon: const Icon(Icons.lock),
            ),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                // Logic to resend OTP
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Resending OTP...'),
                  ),
                );
              },
              child: const Text(
                'Resend OTP?',
                style: TextStyle(
                  color: Color.fromARGB(255, 29, 29, 29),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
