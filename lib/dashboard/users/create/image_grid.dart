import 'dart:typed_data';
import 'package:flutter/material.dart';

class ImageGrid extends StatelessWidget {
  final List<Uint8List?> images;
  final void Function(int index) onPickImageForIndex;
  final void Function(int index) onRemoveImage;

  const ImageGrid({
    super.key,
    required this.images,
    required this.onPickImageForIndex,
    required this.onRemoveImage,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5, // Display 5 containers per row
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: images.length, // Always display 10 containers
      itemBuilder: (context, index) {
        return ImageTile(
          image: images[index],
          onPick: () => onPickImageForIndex(index),
          onRemove: () => onRemoveImage(index),
        );
      },
    );
  }
}

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
        width: 100,
        height: 100,
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
                    top: 1,
                    right: 1,
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
