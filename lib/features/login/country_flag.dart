import 'package:flutter/material.dart';

class CountryFlagSelector extends StatelessWidget {
  final String countryCode;
  final VoidCallback onTap;

  const CountryFlagSelector({
    super.key,
    required this.countryCode,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Opens country picker when tapped
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromARGB(
              255, 250, 250, 250), // Background of the flag circle
        ),
        child: ClipRRect(
          borderRadius:
              BorderRadius.circular(12), // Adjust the radius for rounded edges
          child: SizedBox(
            width: 42,
            height: 42,
            child: Image.asset(
              'packages/intl_phone_number_input/assets/flags/${countryCode.toLowerCase()}.png',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.flag, size: 28, color: Colors.grey);
              },
            ),
          ),
        ),
      ),
    );
  }
}
