import 'dart:typed_data';

import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/features/banner/bloc/banner_bloc.dart';
import 'package:ado_dad_admin/models/banner_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class EditBanner extends StatefulWidget {
  final BannerUploadRequest banner;
  const EditBanner({super.key, required this.banner});

  @override
  State<EditBanner> createState() => _EditBannerState();
}

class _EditBannerState extends State<EditBanner> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _linkController;

  Uint8List? _desktopImage;
  Uint8List? _tabletImage;
  Uint8List? _phoneImage;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.banner.title);
    _linkController = TextEditingController(text: widget.banner.link);
  }

  Future<void> _pickImage(Function(Uint8List) setImage) async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      final bytes = await picked.readAsBytes();
      setImage(bytes);
    }
  }

  Widget _imagePreview({
    required String label,
    required String url,
    required Uint8List? file,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        height: 120,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: file != null
              ? Image.memory(file, fit: BoxFit.cover)
              : (url.isNotEmpty
                  ? Image.network(
                      url,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Center(child: Text("Failed to load $label image")),
                    )
                  : Center(
                      child: Text("Upload\n$label Image",
                          textAlign: TextAlign.center))),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildHeaderSection(),
          const SizedBox(height: 30),
          // _buildUpdateForm(state),

          Center(
            child: SizedBox(
              width: 800,
              child: Card(
                elevation: 5,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        TextFormField(
                          controller: _titleController,
                          decoration:
                              const InputDecoration(labelText: "Banner Title"),
                          validator: (val) =>
                              val == null || val.isEmpty ? "Required" : null,
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _linkController,
                          decoration:
                              const InputDecoration(labelText: "Banner Link"),
                          validator: (val) =>
                              val == null || val.isEmpty ? "Required" : null,
                        ),
                        const SizedBox(height: 24),
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: [
                            _imagePreview(
                              label: "Desktop",
                              url: widget.banner.desktopImage,
                              file: _desktopImage,
                              onTap: () => _pickImage(
                                  (img) => setState(() => _desktopImage = img)),
                            ),
                            _imagePreview(
                              label: "Tablet",
                              url: widget.banner.tabletImage,
                              file: _tabletImage,
                              onTap: () => _pickImage(
                                  (img) => setState(() => _tabletImage = img)),
                            ),
                            _imagePreview(
                              label: "Phone",
                              url: widget.banner.phoneImage,
                              file: _phoneImage,
                              onTap: () => _pickImage(
                                  (img) => setState(() => _phoneImage = img)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState?.validate() ?? false) {
                              final bloc = context.read<BannerBloc>();

                              String desktopUrl = widget.banner.desktopImage;
                              String tabletUrl = widget.banner.tabletImage;
                              String phoneUrl = widget.banner.phoneImage;

                              try {
                                if (_desktopImage != null) {
                                  desktopUrl = await bloc.repository
                                          .uploadImageToS3(
                                              _desktopImage!, 'desktopImage') ??
                                      desktopUrl;
                                }
                                if (_tabletImage != null) {
                                  tabletUrl = await bloc.repository
                                          .uploadImageToS3(
                                              _tabletImage!, 'tabletImage') ??
                                      tabletUrl;
                                }
                                if (_phoneImage != null) {
                                  phoneUrl = await bloc.repository
                                          .uploadImageToS3(
                                              _phoneImage!, 'phoneImage') ??
                                      phoneUrl;
                                }

                                final updatedBanner = BannerUploadRequest(
                                  id: widget.banner.id,
                                  title: _titleController.text.trim(),
                                  link: _linkController.text.trim(),
                                  desktopImage: desktopUrl,
                                  tabletImage: tabletUrl,
                                  phoneImage: phoneUrl,
                                );

                                bloc.add(
                                    UpdateBanner(updatedBanner: updatedBanner));
                                context.pop(); // go back
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Update failed: $e')),
                                );
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.blackColor,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 14),
                          ),
                          child: const Text("Update Banner"),
                        )
                      ],
                    ),
                  ),
                ),
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
                context.read<BannerBloc>().add(FetchAllBanners());
              },
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Edit Banner",
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
