import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'image_tile.dart';

class ImageGrid extends StatelessWidget {
  final List<Uint8List?> images;
  final void Function() onPickImageForIndex;
  final void Function(int index) onRemoveImage;

  const ImageGrid({
    super.key,
    required this.images,
    required this.onPickImageForIndex,
    required this.onRemoveImage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Constrain the width to match its parent
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.sizeOf(context).width ~/
              150, // Display 5 containers per row
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return ImageTile(
            image: images[index],
            onPick: () => onPickImageForIndex(),
            onRemove: () => onRemoveImage(index),
          );
        },
      ),
    );
  }
}
