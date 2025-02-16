// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'image_grid.dart';
import 'main_image_picker.dart';

class ImagePickerSection extends StatefulWidget {
  final List<Uint8List?> images;
  final Function(List<Uint8List?>) onImagesChanged;
  final int maxFileCount;
  final int maxFileSize;

  const ImagePickerSection({
    Key? key,
    required this.images,
    required this.onImagesChanged,
    this.maxFileCount = 10,
    this.maxFileSize = 5 * 1024 * 1024, // 5 MB per image
  }) : super(key: key);

  @override
  _ImagePickerSectionState createState() => _ImagePickerSectionState();
}

class _ImagePickerSectionState extends State<ImagePickerSection> {
  late List<Uint8List?> _localImages;

  @override
  void initState() {
    super.initState();
    _localImages = List.from(widget.images);
  }

  Future<void> _pickMultipleImages() async {
    try {
      final uploadInput = html.FileUploadInputElement()
        ..multiple = true
        ..accept = 'image/*';
      uploadInput.click();

      uploadInput.onChange.listen((event) async {
        final files = uploadInput.files;
        if (files != null) {
          for (var file in files) {
            if (file.size > widget.maxFileSize) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('File "${file.name}" exceeds 5 MB.')),
              );
              continue;
            }

            final emptyIndex = _localImages.indexOf(null);
            if (emptyIndex == -1) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(
                        'Maximum ${widget.maxFileCount} images can be uploaded.')),
              );
              break;
            }

            final reader = html.FileReader();
            reader.readAsArrayBuffer(file);
            await reader.onLoadEnd.first;

            reader.onError.listen((event) {
              debugPrint('Error reading file: ${file.name}');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error reading file "${file.name}".')),
              );
            });

            setState(() {
              _localImages[emptyIndex] = reader.result as Uint8List;
            });
            widget.onImagesChanged(_localImages);
          }
        }
      });
    } catch (e) {
      debugPrint('Error picking multiple images: $e');
    }
  }

  // You can also implement _pickImageForIndex if needed.
  void _removeImage(int index) {
    setState(() {
      _localImages.removeAt(index);
      _localImages.add(null);
    });
    widget.onImagesChanged(_localImages);
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainImagePicker(
          images: _localImages,
          onPick: _pickMultipleImages,
        ),
        SizedBox(height: screenHeight * 0.02),
        ImageGrid(
          images: _localImages,
          onPickImageForIndex: _pickMultipleImages,
          onRemoveImage: _removeImage,
        ),
      ],
    );
  }
}
