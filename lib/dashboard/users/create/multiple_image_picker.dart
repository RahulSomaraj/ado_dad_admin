// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'image_grid.dart';
import 'main_image_picker.dart';

class MultipleImagePicker extends StatefulWidget {
  const MultipleImagePicker({super.key});

  @override
  State<MultipleImagePicker> createState() => _MultipleImagePickerState();
}

class _MultipleImagePickerState extends State<MultipleImagePicker> {
  final List<Uint8List?> _images = List.generate(10, (index) => null);
  final int _maxFileCount = 10; // Maximum number of images
  final int _maxFileSize = 5 * 1024 * 1024; // 5 MB per image

  /// Pick multiple images and fill available slots.
  Future<void> _pickMultipleImages() async {
    try {
      final html.FileUploadInputElement uploadInput =
          html.FileUploadInputElement();
      uploadInput.multiple = true; // Allow multiple file selection
      uploadInput.accept = 'image/*'; // Accept only image files
      uploadInput.click(); // Trigger the file picker dialog

      uploadInput.onChange.listen((event) async {
        final files = uploadInput.files;
        if (files != null) {
          for (var file in files) {
            if (file.size > _maxFileSize) {
              // File size exceeds the limit
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      'File "${file.name}" is too large (max 5 MB allowed).'),
                ),
              );
              continue;
            }

            final emptyIndex =
                _images.indexOf(null); // Find the first null slot
            if (emptyIndex == -1) {
              // No slots available
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Maximum 10 images can be uploaded.'),
                ),
              );
              break;
            }

            final reader = html.FileReader();
            reader.readAsArrayBuffer(file); // Read the file as bytes

            // Wait for file reading to complete
            await reader.onLoadEnd.first;

            setState(() {
              _images[emptyIndex] = reader.result as Uint8List;
            });
          }
        }
      });
    } catch (e) {
      debugPrint('Error picking multiple images: $e');
    }
  }

  /// Pick an image for a specific index.
  Future<void> _pickImageForIndex(int index) async {
    try {
      final html.FileUploadInputElement uploadInput =
          html.FileUploadInputElement();
      uploadInput.accept = 'image/*';
      uploadInput.click();

      uploadInput.onChange.listen((event) async {
        final files = uploadInput.files;
        if (files != null && files.isNotEmpty) {
          final file = files.first;

          if (file.size > _maxFileSize) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    'File "${file.name}" is too large (max 5 MB allowed).'),
              ),
            );
            return;
          }

          final reader = html.FileReader();
          reader.readAsArrayBuffer(file); // Read the file as bytes

          // Wait for file reading to complete
          await reader.onLoadEnd.first;

          setState(() {
            _images[index] = reader.result as Uint8List;
          });
        }
      });
    } catch (e) {
      debugPrint('Error picking image for index $index: $e');
    }
  }

  /// Remove an image and rearrange the list to shift remaining images.
  void _removeImage(int index) {
    setState(() {
      _images.removeAt(index);
      _images.add(null); // Maintain the length of 10 slots
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Add Images (Max: 10, Max Size: 5 MB)",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Image Picker
            MainImagePicker(
              images: _images,
              onPick: _pickMultipleImages,
            ),
            const SizedBox(width: 20),
            // Image Grid with Flexible to occupy remaining space
            Expanded(
              child: ImageGrid(
                images: _images,
                onPickImageForIndex: _pickImageForIndex,
                onRemoveImage: _removeImage,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
