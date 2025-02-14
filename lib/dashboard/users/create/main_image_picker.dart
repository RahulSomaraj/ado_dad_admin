import 'dart:typed_data';
import 'package:flutter/material.dart';

class MainImagePicker extends StatelessWidget {
  final List<Uint8List?> images;
  final VoidCallback onPick;

  const MainImagePicker({
    Key? key,
    required this.images,
    required this.onPick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPick,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.shade200,
          image: images.any((image) => image != null)
              ? DecorationImage(
                  image: MemoryImage(
                    images.firstWhere((image) => image != null)!,
                  ),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: images.every((image) => image == null)
            ? const Center(
                child: Icon(
                  Icons.add_a_photo,
                  color: Colors.grey,
                  size: 40,
                ),
              )
            : null,
      ),
    );
  }
}
