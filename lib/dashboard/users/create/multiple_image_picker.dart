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
      final uploadInput = html.FileUploadInputElement()
        ..multiple = true
        ..accept = 'image/*';
      uploadInput.click();

      uploadInput.onChange.listen((event) async {
        final files = uploadInput.files;
        if (files != null) {
          for (var file in files) {
            if (file.size > _maxFileSize) {
              _showSnackBar('File "${file.name}" exceeds 5 MB.');
              continue;
            }

            final emptyIndex = _images.indexOf(null);
            if (emptyIndex == -1) {
              _showSnackBar('Maximum 10 images can be uploaded.');
              break;
            }

            final reader = html.FileReader();
            reader.readAsArrayBuffer(file);
            await reader.onLoadEnd.first;

            reader.onError.listen((event) {
              debugPrint('Error reading file: ${file.name}');
              _showSnackBar('Error reading file "${file.name}".');
            });

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
      final uploadInput = html.FileUploadInputElement()..accept = 'image/*';
      uploadInput.click();

      uploadInput.onChange.listen((event) async {
        final files = uploadInput.files;
        if (files != null && files.isNotEmpty) {
          final file = files.first;

          if (file.size > _maxFileSize) {
            _showSnackBar('File "${file.name}" exceeds 5 MB.');
            return;
          }

          final reader = html.FileReader();
          reader.readAsArrayBuffer(file);
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

  /// Remove an image and maintain the list length.
  void _removeImage(int index) {
    setState(() {
      _images.removeAt(index);
      _images.add(null);
    });
  }

  /// Display a snackbar with a custom message.
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Responsive text scaling
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double pixelRatio = MediaQuery.of(context).devicePixelRatio;

    String? selectedUserType; // Variable to store the selected user type

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Add Images (${_images.where((image) => image != null).length}/10, Max Size: 5 MB)",
          style: TextStyle(
            fontSize:
                18 * pixelRatio, // Scale font size based on device pixel ratio
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: screenHeight * 0.02), // 2% of screen height
        Expanded(
          child: ListView(
            children: [
              // First Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left Section: Image Selector and Tiles
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MainImagePicker(
                          images: _images,
                          onPick: _pickMultipleImages,
                        ),
                        SizedBox(
                            height: screenHeight * 0.02), // 2% of screen height
                        ImageGrid(
                          images: _images,
                          onPickImageForIndex: _pickMultipleImages,
                          onRemoveImage: _removeImage,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.05), // 5% of screen width
                  // Right Section: Form
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "User",
                          style: TextStyle(
                            fontSize: 16 * pixelRatio,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                            height: screenHeight * 0.02), // 2% of screen height
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "E-mail",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  12.0), // 12.0 is the radius
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "PhoneNumber",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: "User Type",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          value: selectedUserType, // Default value
                          items: const [
                            DropdownMenuItem(
                              value: "admin",
                              child: Text("Admin"),
                            ),
                            DropdownMenuItem(
                              value: "user",
                              child: Text("User"),
                            ),
                            DropdownMenuItem(
                              value: "showroom",
                              child: Text("Showroom"),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              selectedUserType = value; // Update selected type
                            });
                          },
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        SizedBox(
                          width: double.infinity,
                          height: screenHeight *
                              0.06, // Match the height of the TextFormField
                          child: ElevatedButton(
                            onPressed: () {
                              // Add form submission logic
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(181, 250, 242, 125), // White background
                              foregroundColor: Colors.black, // Black text
                            ),
                            child: Text(
                              "Save User",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
            ],
          ),
        ),
      ],
    );
  }
}
