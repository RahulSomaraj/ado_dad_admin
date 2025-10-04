import 'dart:typed_data';
import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ado_dad_admin/features/users/bloc/user_bloc.dart';
import 'package:ado_dad_admin/models/user_model.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class EditUser extends StatefulWidget {
  final UserModel user;

  const EditUser({super.key, required this.user});

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  final GlobalKey<FormState> _userEditFormKey = GlobalKey<FormState>();

  late String _name;
  late String _email;
  late String _phone;
  late String _userType;

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

  /// Short form to full form mapping
  final Map<String, String> _userTypeMap = {
    'SA': "Super Admin",
    'AD': "Admin",
    'NU': "Normal User",
    'SR': "Showroom",
  };

  @override
  void initState() {
    super.initState();
    _name = widget.user.name;
    _email = widget.user.email;
    _phone = widget.user.phoneNumber;
    _userType = _userTypeMap[widget.user.userType] ?? "Normal User";
    _currentProfilePicUrl = widget.user.profilePic;
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  /// Convert full form to short code for API request
  String _getShortForm(String fullType) {
    return _userTypeMap.entries
        .firstWhere(
          (entry) => entry.value == fullType,
          orElse: () => const MapEntry('NU', "Normal User"),
        )
        .key;
  }

  /// Validate password strength
  String? _validatePasswordStrength(String password) {
    if (password.isEmpty)
      return null; // Let required validation handle empty passwords

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

  void _updateUser() {
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

    if (_userEditFormKey.currentState!.validate()) {
      _userEditFormKey.currentState!.save();

      final updatedUser = UserModel(
        id: widget.user.id,
        name: _name,
        email: _email,
        phoneNumber: _phone,
        userType: _getShortForm(_userType),
        profilePic: _currentProfilePicUrl,
        password: _showPasswordSection && _passwordController.text.isNotEmpty
            ? _passwordController.text.trim()
            : null, // Only include password if it's being changed
      );

      print(
          '🔍 UserEdit: Profile pic bytes: ${_profilePicBytes != null ? "Has new image" : "No new image"}');
      print('🔍 UserEdit: Current profile pic URL: "$_currentProfilePicUrl"');

      if (_profilePicBytes != null) {
        // User is uploading a new profile picture
        print('🔍 UserEdit: Using profile picture upload path');
        context.read<UserBloc>().add(UserEvent.updateUserWithProfilePic(
              updatedUser: updatedUser,
              profilePicBytes: _profilePicBytes!,
            ));
      } else {
        // User is not changing profile picture (keep existing or no profile picture)
        // Always use the regular update path - it handles existing profilePic URLs correctly
        print('🔍 UserEdit: Using regular update path');
        context.read<UserBloc>().add(UpdateUser(updatedUser: updatedUser));
      }
    }
  }

  void _showSuccessPopup(BuildContext context, String message) {
    print('🔍 UserEdit: Showing success popup with message: "$message"');
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Success"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                print(
                    '🔍 UserEdit: Success popup OK clicked, refreshing users list');
                // Explicitly refresh data before navigating
                context.read<UserBloc>().add(const FetchAllUsers());
                context.pop();
                context.go('/users');
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
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        print('🔍 UserEdit: BlocListener received state: ${state.runtimeType}');
        if (state is UserUpdated) {
          print(
              '🔍 UserEdit: UserUpdated state received, showing success popup');
          _showSuccessPopup(
              context, "User details have been updated successfully.");
        } else if (state is UserError) {
          print('🔍 UserEdit: UserError state received: ${state.message}');
        }
      },
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildHeaderSection(),
                  const SizedBox(height: 30),
                  _buildUpdateForm(state),
                  const SizedBox(height: 50), // Add bottom padding
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /// ✅ Header Section with Back Button
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
                context.read<UserBloc>().add(FetchAllUsers());
              },
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Edit User",
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

  Center _buildUpdateForm(UserState state) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width > 600
              ? 600
              : MediaQuery.of(context).size.width - 32,
        ),
        child: Card(
          elevation: 5,
          color: AppColors.primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: EdgeInsets.all(
                MediaQuery.of(context).size.width > 600 ? 20 : 16),
            child: Form(
              key: _userEditFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildFormField("Name", _name, (value) => _name = value!),
                  const SizedBox(height: 15),
                  _buildFormField("Email", _email, (value) => _email = value!,
                      isEmail: true),
                  const SizedBox(height: 15),
                  _buildFormField(
                      "Phone Number", _phone, (value) => _phone = value!,
                      isPhone: true),
                  const SizedBox(height: 15),
                  _buildDropdownField("User Type", _userType),
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
                      onPressed: state is UserLoading ? null : _updateUser,
                      child: state is UserLoading
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

  Widget _buildDropdownField(String label, String selectedValue) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      items: _userTypeMap.values
          .map(
              (String type) => DropdownMenuItem(value: type, child: Text(type)))
          .toList(),
      onChanged: (value) => setState(() => _userType = value!),
      validator: (value) => value == null ? "Please select a user type" : null,
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
