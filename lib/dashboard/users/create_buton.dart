import 'package:flutter/material.dart';

class CreateButton extends StatelessWidget {
  final bool isProcessing;
  final VoidCallback onCreate;

  const CreateButton({
    super.key,
    required this.isProcessing,
    required this.onCreate,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          isProcessing ? null : onCreate, // Disable interaction if processing
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 240, 150, 66),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 6,
              offset: const Offset(4, 4),
            ),
            BoxShadow(
              color: Colors.white,
              blurRadius: 6,
              offset: const Offset(-4, -4),
            ),
          ],
        ),
        child: const Center(
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 28,
          ),
        ),
      ),
    );
  }
}
