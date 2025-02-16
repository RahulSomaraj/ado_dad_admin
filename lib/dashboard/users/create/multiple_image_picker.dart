import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'image_picker_section.dart';
import 'user_form_section.dart';

class MultipleImagePicker extends StatefulWidget {
  const MultipleImagePicker({Key? key}) : super(key: key);

  @override
  _MultipleImagePickerState createState() => _MultipleImagePickerState();
}

class _MultipleImagePickerState extends State<MultipleImagePicker> {
  // The parent holds the list of images.
  List<Uint8List?> _images = List.generate(10, (index) => null);

  // Update callback to be passed down to children.
  void _updateImages(List<Uint8List?> newImages) {
    setState(() {
      _images = newImages;
    });
  }

  // Upload each non-null image to S3 using a pre-signed URL.
  Future<void> _uploadFilesToS3() async {
    final dio = Dio();
    // Filter out null images.
    final validImages = _images.where((img) => img != null).toList();

    if (validImages.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No images to upload.")),
      );
      return;
    }

    for (int i = 0; i < validImages.length; i++) {
      final imageData = validImages[i]!;
      // Create a filename (you can modify this to use a UUID or timestamp)
      final fileName = "image_$i.jpg";
      // Define the MIME type.
      const String fileType = "image/jpeg";

      try {
        // Step 1: Request a pre-signed URL from your backend.
        // Replace 'http://your-backend-url/s3/presigned-url' with your actual endpoint.
        final presignedResponse = await dio.get(
          'http://your-backend-url/s3/presigned-url',
          queryParameters: {
            'fileName': fileName,
            'fileType': fileType,
          },
        );

        if (presignedResponse.statusCode == 200) {
          final presignedUrl = presignedResponse.data['url'];
          debugPrint("Pre-signed URL for image $i: $presignedUrl");

          // Step 2: Upload the image to S3.
          await dio.put(
            presignedUrl,
            data: imageData,
            options: Options(
              headers: {
                'Content-Type': fileType,
              },
            ),
            onSendProgress: (int sent, int total) {
              final progress = (sent / total) * 100;
              debugPrint("Uploading image $i: ${progress.toStringAsFixed(0)}%");
            },
          );
          debugPrint("Uploaded image $i successfully.");
        } else {
          debugPrint("Failed to get pre-signed URL for image $i.");
        }
      } catch (e) {
        debugPrint("Error uploading image $i: $e");
      }
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("All images uploaded successfully.")),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double pixelRatio = MediaQuery.of(context).devicePixelRatio;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header for the image picker section.
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Add Images (${_images.where((img) => img != null).length}/10, Max Size: 5 MB)",
            style: TextStyle(
              fontSize: 18 * pixelRatio,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              // Left: Image picker section.
              Expanded(
                flex: 1,
                child: ImagePickerSection(
                  images: _images,
                  onImagesChanged: _updateImages,
                ),
              ),
              SizedBox(width: screenWidth * 0.05),
              // Right: User form section.
              Expanded(
                flex: 1,
                child: const UserFormSection(),
              ),
            ],
          ),
        ),
        // Save Button: triggers S3 upload.
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity,
            height: screenHeight * 0.06,
            child: ElevatedButton(
              onPressed: _uploadFilesToS3,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(181, 250, 242, 125),
                foregroundColor: Colors.black,
              ),
              child: const Text(
                "Save",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
