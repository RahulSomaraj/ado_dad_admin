import 'package:flutter/material.dart';
import 'dart:typed_data';

/// Individual image tile widget.
class ImageTile extends StatelessWidget {
  final Uint8List? image;
  final VoidCallback onPick;
  final VoidCallback onRemove;

  const ImageTile({
    super.key,
    required this.image,
    required this.onPick,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPick,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
          image: image != null
              ? DecorationImage(
                  image: MemoryImage(image!),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: image == null
            ? const Center(
                child: Icon(
                  Icons.add_a_photo,
                  color: Colors.grey,
                  size: 40,
                ),
              )
            : Stack(
                children: [
                  Positioned(
                    top: 5,
                    right: 5,
                    child: GestureDetector(
                      onTap: onRemove,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(4),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
