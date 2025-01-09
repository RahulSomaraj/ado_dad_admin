import 'package:ado_dad_admin/features/login/country_flag.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:country_phone_validator/country_phone_validator.dart';

class PhoneNumberField extends StatefulWidget {
  final FocusNode? focusNode;
  final VoidCallback? onSubmit;

  const PhoneNumberField({super.key, this.focusNode, this.onSubmit});

  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN', dialCode: '+91');
  final TextEditingController phoneController = TextEditingController();
  late FocusNode _internalFocusNode;
  String? errorText;

  @override
  void initState() {
    super.initState();
    _internalFocusNode = widget.focusNode ?? FocusNode();
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _internalFocusNode.dispose();
    }
    super.dispose();
  }

  Future<void> _validatePhoneNumber(String value, String dialCode) async {
    bool isValid = CountryUtils.validatePhoneNumber(value, dialCode);
    setState(() {
      errorText = isValid ? null : 'Invalid phone number Entered';
    });
  }

  void _onSubmit() {
    if (errorText == null && phoneController.text.isNotEmpty) {
      widget.onSubmit?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          focusNode: _internalFocusNode,
          controller: phoneController,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            labelText: 'Phone Number',
            hintText: 'Enter your phone number',
            errorText: errorText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CountryFlagSelector(
                    countryCode: 'IN',
                    onTap: () {
                      // showCountrySelectorDialog(context);
                    },
                  ),
                  const SizedBox(width: 10),
                  Text(number.dialCode ?? '+'),
                  const Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
            prefixIconConstraints: const BoxConstraints(
              minWidth: 0,
              minHeight: 0,
              maxHeight: 58,
              maxWidth: 150,
            ),
          ),
          onChanged: (value) {
            _validatePhoneNumber(value, '${number.dialCode}');
          },
          onFieldSubmitted: (value) => _onSubmit(),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your phone number';
            }
            if (errorText != null) {
              return errorText;
            }
            return null;
          },
        ),
      ],
    );
  }
}
