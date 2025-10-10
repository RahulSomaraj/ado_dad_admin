import 'dart:typed_data';
import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/common/data_storage.dart';
import 'package:ado_dad_admin/features/showroom/bloc/showroom_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ado_dad_admin/models/user_model.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class EditShowroom extends StatefulWidget {
  final UserModel showroomuser;

  const EditShowroom({super.key, required this.showroomuser});

  @override
  State<EditShowroom> createState() => _EditShowroomState();
}

class _EditShowroomState extends State<EditShowroom> {
  // final _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _showroomEditFormKey = GlobalKey<FormState>();

  late String _name;
  late String _email;
  late String _phone;

  // Profile picture state
  Uint8List? _profilePicBytes;
  String? _currentProfilePicUrl;

  // Password change state
  bool _showPasswordSection = false;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _name = widget.showroomuser.name;
    _email = widget.showroomuser.email;
    _phone = widget.showroomuser.phoneNumber;
    _currentProfilePicUrl = widget.showroomuser.profilePic;
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  /// Validate password strength
  String? _validatePasswordStrength(String password) {
    if (password.isEmpty) {
      return null; // Let required validation handle empty passwords
    }

    List<String> errors = [];

    // Check for uppercase letter
    if (!password.contains(RegExp(r'[A-Z]'))) {
      errors.add('uppercase letter');
    }

    // Check for lowercase letter
    if (!password.contains(RegExp(r'[a-z]'))) {
      errors.add('lowercase letter');
    }

    // Check for number
    if (!password.contains(RegExp(r'[0-9]'))) {
      errors.add('number');
    }

    // Check for special character
    if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      errors.add('special character');
    }

    // Check minimum length
    if (password.length < 6) {
      errors.add('at least 6 characters');
    }

    if (errors.isNotEmpty) {
      return 'Password must contain ${errors.join(', ')}';
    }

    return null;
  }

  Future<void> _pickProfilePicture() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 512,
      maxHeight: 512,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _profilePicBytes = bytes;
      });
    }
  }

  void _updateShowroom() {
    // Validate password strength and matching if password section is shown and has content
    if (_showPasswordSection && _passwordController.text.isNotEmpty) {
      // Check password strength
      String? strengthError =
          _validatePasswordStrength(_passwordController.text.trim());
      if (strengthError != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(strengthError),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      // Check password matching
      if (_passwordController.text != _confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Password and Confirm Password do not match"),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }
    }

    if (_showroomEditFormKey.currentState!.validate()) {
      _showroomEditFormKey.currentState!.save();

      final updatedShowroom = UserModel(
        id: widget.showroomuser.id,
        name: _name,
        email: _email,
        phoneNumber: _phone,
        userType: 'SR',
        profilePic: _currentProfilePicUrl,
        password: _showPasswordSection && _passwordController.text.isNotEmpty
            ? _passwordController.text.trim()
            : null, // Only include password if it's being changed
      );

      if (_profilePicBytes != null) {
        // Showroom is uploading a new profile picture
        context
            .read<ShowroomBloc>()
            .add(ShowroomEvent.updateShowroomWithProfilePic(
              updatedShowroom: updatedShowroom,
              profilePicBytes: _profilePicBytes!,
            ));
      } else {
        // Showroom is not changing profile picture (keep existing or no profile picture)
        context
            .read<ShowroomBloc>()
            .add(UpdateShowroom(updatedShowroom: updatedShowroom));
      }
    } else {}
  }

  /// Update stored user data with current form values
  Future<void> _updateStoredUserData() async {
    await updateUserName(_name);
    await updateUserEmail(_email);
    await updateUserPhoneNumber(_phone);
    if (_currentProfilePicUrl != null && _currentProfilePicUrl!.isNotEmpty) {
      await updateUserProfilePicture(_currentProfilePicUrl!);
    }
  }

  /// Update stored user data with updated user from server
  Future<void> _updateStoredUserDataFromServer(UserModel updatedUser) async {
    await updateUserName(updatedUser.name);
    await updateUserEmail(updatedUser.email);
    await updateUserPhoneNumber(updatedUser.phoneNumber);
    if (updatedUser.profilePic != null && updatedUser.profilePic!.isNotEmpty) {
      await updateUserProfilePicture(updatedUser.profilePic!);
    }
  }

  /// Update stored user data only if SR user is editing their own profile
  Future<void> _updateStoredUserDataIfOwnProfile() async {
    final userType = await getUserType();
    final currentUserId = await getUserId();

    // Only update stored data if SR user is editing their own profile
    if (userType == 'SR' && currentUserId == widget.showroomuser.id) {
      await _updateStoredUserData();
    }
  }

  void _showSuccessPopup(BuildContext context, String message) async {
    // Get current user type and ID to determine navigation
    final userType = await getUserType();
    final currentUserId = await getUserId();

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text("Success"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.of(dialogContext).pop(); // Close the dialog

                // Wait a moment for dialog to close, then navigate
                await Future.delayed(const Duration(milliseconds: 100));

                if (mounted) {
                  // Navigate based on user type and if editing own profile
                  if (userType == 'SR' &&
                      currentUserId == widget.showroomuser.id) {
                    // For SR users editing their own profile, go back to profile page

                    context.go('/profile');
                    print(
                        '🔍 Navigation: SR user editing own profile, going to profile page');
                  } else {
                    // For all other cases (AD/SA editing any user, or SR editing other users), go to showrooms page
                    print(
                        '🔍 Navigation: Non-SR user or SR editing other user, going to showrooms page');
                    context.go('/showrooms');
                  }
                }
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ShowroomBloc, ShowroomState>(
      listener: (context, state) {
        if (state is ShowroomUpdated) {
          // Update stored user data only if SR user is editing their own profile
          if (state.updatedUser != null) {
            _updateStoredUserDataFromServer(state.updatedUser!).then((_) {
              _showSuccessPopup(
                  context, "Showroom details have been updated successfully.");
            });
          } else {
            _updateStoredUserDataIfOwnProfile().then((_) {
              _showSuccessPopup(
                  context, "Showroom details have been updated successfully.");
            });
          }
        } else if (state is ShowroomError) {}
      },
      child: BlocBuilder<ShowroomBloc, ShowroomState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildHeaderSection(),
                const SizedBox(height: 30),
                _buildUpdateForm(state),
              ],
            ),
          );
        },
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
              },
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Edit Showroom",
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

  Center _buildUpdateForm(ShowroomState state) {
    return Center(
      child: SizedBox(
        width: 500,
        child: Card(
          elevation: 5,
          color: AppColors.primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _showroomEditFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFormField(
                      "Showroom Name", _name, (value) => _name = value!),
                  const SizedBox(height: 15),
                  _buildFormField("Email", _email, (value) => _email = value!,
                      isEmail: true),
                  const SizedBox(height: 15),
                  _buildFormField(
                      "Phone Number", _phone, (value) => _phone = value!,
                      isPhone: true),
                  const SizedBox(height: 15),
                  _buildProfilePictureSection(),
                  const SizedBox(height: 15),
                  _buildChangePasswordSection(),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed:
                          state is ShowroomLoading ? null : _updateShowroom,
                      child: state is ShowroomLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                  strokeWidth: 2, color: Colors.white),
                            )
                          : const Text("Update",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormField(
      String label, String initialValue, Function(String?) onSaved,
      {bool isEmail = false, bool isPhone = false}) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      keyboardType: isEmail
          ? TextInputType.emailAddress
          : (isPhone ? TextInputType.phone : TextInputType.text),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "$label is required";
        }
        if (isEmail &&
            !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                .hasMatch(value)) {
          return "Enter a valid email address";
        }
        if (isPhone && !RegExp(r"^[0-9]{10,}$").hasMatch(value)) {
          return "Enter a valid phone number (10+ digits)";
        }
        return null;
      },
      onSaved: onSaved,
    );
  }

  Widget _buildProfilePictureSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Profile Picture",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: _pickProfilePicture,
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(8),
            ),
            child: _profilePicBytes != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.memory(
                      _profilePicBytes!,
                      fit: BoxFit.cover,
                    ),
                  )
                : _currentProfilePicUrl != null &&
                        _currentProfilePicUrl!.isNotEmpty
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          _currentProfilePicUrl!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              _buildPlaceholder(),
                        ),
                      )
                    : _buildPlaceholder(),
          ),
        ),
      ],
    );
  }

  Widget _buildPlaceholder() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.add_a_photo,
          size: 40,
          color: Colors.grey.shade600,
        ),
        const SizedBox(height: 4),
        Text(
          "Add Photo",
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  Widget _buildChangePasswordSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Change Password Header
        GestureDetector(
          onTap: () {
            setState(() {
              _showPasswordSection = !_showPasswordSection;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.lock_outline,
                  color: Colors.grey.shade600,
                ),
                const SizedBox(width: 12),
                Text(
                  "Change Password",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade700,
                  ),
                ),
                const Spacer(),
                Icon(
                  _showPasswordSection ? Icons.expand_less : Icons.expand_more,
                  color: Colors.grey.shade600,
                ),
              ],
            ),
          ),
        ),

        // Password Fields (shown when expanded)
        if (_showPasswordSection) ...[
          const SizedBox(height: 15),
          _buildPasswordField(
              "New Password", _passwordController, _isPasswordVisible, (value) {
            setState(() {
              _isPasswordVisible = value;
            });
          }),
          const SizedBox(height: 15),
          _buildPasswordField("Confirm Password", _confirmPasswordController,
              _isConfirmPasswordVisible, (value) {
            setState(() {
              _isConfirmPasswordVisible = value;
            });
          }),
        ],
      ],
    );
  }

  Widget _buildPasswordField(String label, TextEditingController controller,
      bool isVisible, Function(bool) onToggleVisibility) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        suffixIcon: IconButton(
          icon: Icon(
            isVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: () => onToggleVisibility(!isVisible),
        ),
      ),
      obscureText: !isVisible,
      validator: (value) {
        if (_showPasswordSection) {
          if (value == null || value.trim().isEmpty) {
            return "$label is required";
          }

          // For "New Password" field, validate password strength
          if (label == "New Password") {
            String? strengthError = _validatePasswordStrength(value.trim());
            if (strengthError != null) {
              return strengthError;
            }
          }

          // For "Confirm Password" field, check if it matches the new password
          if (label == "Confirm Password") {
            if (value.trim() != _passwordController.text.trim()) {
              return "Passwords do not match";
            }
          }
        }
        return null;
      },
    );
  }
}
