import 'package:flutter/material.dart';

class CustomChart extends StatelessWidget {
  final String title;

  const CustomChart({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title, style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              Container(
                height: 150,
                width: double.infinity,
                color: Colors.blueGrey,
                child: const Center(
                  child: Text('Chart Placeholder'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
