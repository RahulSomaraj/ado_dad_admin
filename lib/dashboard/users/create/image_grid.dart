import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'image_tile.dart';

class ImageGrid extends StatelessWidget {
  final List<Uint8List?> images;
  final VoidCallback onPickImageForIndex;
  final void Function(int index) onRemoveImage;

  const ImageGrid({
    Key? key,
    required this.images,
    required this.onPickImageForIndex,
    required this.onRemoveImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Adjust gridDelegate values as needed.
    return SizedBox(
      width: double.infinity,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.sizeOf(context).width ~/ 150,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return ImageTile(
            image: images[index],
            onPick: onPickImageForIndex,
            onRemove: () => onRemoveImage(index),
          );
        },
      ),
    );
  }
}
