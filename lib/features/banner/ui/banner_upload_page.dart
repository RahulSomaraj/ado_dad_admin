import 'dart:typed_data';

import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/features/banner/bloc/banner_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class BannerUploadPage extends StatefulWidget {
  const BannerUploadPage({super.key});

  @override
  State<BannerUploadPage> createState() => _BannerUploadPageState();
}

class _BannerUploadPageState extends State<BannerUploadPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _linkController = TextEditingController();

  Uint8List? _desktopImage;
  Uint8List? _tabletImage;
  Uint8List? _mobileImage;

  Future<void> _pickImage(Function(Uint8List) setImage) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setImage(bytes);
    }
  }

  void _upload() {
    if (_formKey.currentState!.validate() &&
        _desktopImage != null &&
        _tabletImage != null &&
        _mobileImage != null) {
      // final images = [_desktopImage!, _tabletImage!, _mobileImage!];
      // context.read<BannerBloc>().add(BannerEvent.uploadBannerToS3(images));
      // Navigator.pop(context);

      context.read<BannerBloc>().add(
            BannerEvent.uploadBannerToS3(
              title: _nameController.text.trim(),
              link: _linkController.text.trim(),
              desktopImage: _desktopImage!,
              tabletImage: _tabletImage!,
              phoneImage: _mobileImage!,
            ),
          );
      Navigator.pop(context, true);
    }
  }

  Widget _imageContainer({
    required String label,
    required Uint8List? image,
    required VoidCallback onPick,
  }) {
    return GestureDetector(
      onTap: onPick,
      child: Container(
        width: 220,
        height: 140,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          border: Border.all(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(12),
        ),
        child: image != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.memory(image, fit: BoxFit.cover),
              )
            : Center(
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 700;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          _buildHeaderSection(),
          const SizedBox(height: 30),
          Center(
            child: Container(
              height: 450,
              width: 900,
              color: Colors.white,
              constraints: const BoxConstraints(maxWidth: 800),
              padding: const EdgeInsets.all(24),
              child: BlocConsumer<BannerBloc, BannerState>(
                listener: (context, state) {
                  state.whenOrNull(
                    success: (banners) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Upload successful")),
                      );
                      // WidgetsBinding.instance.addPostFrameCallback((_) {
                      //   Navigator.pop(context);
                      // });
                    },
                    failure: (message) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Upload failed: $message")),
                      );
                    },
                  );
                },
                builder: (context, state) {
                  return Form(
                    key: _formKey,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            labelText: "Banner Name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          validator: (val) => val == null || val.isEmpty
                              ? "Please enter a name"
                              : null,
                        ),
                        const SizedBox(height: 24),
                        TextFormField(
                          controller: _linkController,
                          decoration: InputDecoration(
                            labelText: "Banner Link",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          validator: (val) => val == null || val.isEmpty
                              ? "Please enter a link"
                              : null,
                        ),
                        const SizedBox(height: 24),
                        Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 12,
                          runSpacing: 12,
                          children: [
                            _imageContainer(
                              label: "Upload\nDesktop Image",
                              image: _desktopImage,
                              onPick: () => _pickImage(
                                  (img) => setState(() => _desktopImage = img)),
                            ),
                            _imageContainer(
                              label: "Upload\nTablet Image",
                              image: _tabletImage,
                              onPick: () => _pickImage(
                                  (img) => setState(() => _tabletImage = img)),
                            ),
                            _imageContainer(
                              label: "Upload\nMobile Image",
                              image: _mobileImage,
                              onPick: () => _pickImage(
                                  (img) => setState(() => _mobileImage = img)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        ElevatedButton(
                          onPressed: _upload,
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(
                                  isSmallScreen ? double.infinity : 200, 48),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              backgroundColor: AppColors.blackColor,
                              foregroundColor: Colors.white),
                          child: const Text("OK"),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new,
                  color: AppColors.blackColor),
              onPressed: () {
                context.pop();
                // context.read<UserBloc>().add(FetchAllUsers());
              },
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Add Banner",
                style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
