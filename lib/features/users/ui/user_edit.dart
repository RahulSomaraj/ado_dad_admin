import 'dart:typed_data';
import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/common/data_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ado_dad_admin/features/users/bloc/user_bloc.dart';
import 'package:ado_dad_admin/models/user_model.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:country_picker/country_picker.dart';
import 'package:google_fonts/google_fonts.dart';

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
  late String _userType;

  // Profile picture state
  Uint8List? _profilePicBytes;
  String? _currentProfilePicUrl;

  // Country code state
  Country? _selectedCountry;
  final TextEditingController _phoneController = TextEditingController();

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
    _phoneController.text = widget.user.phoneNumber;
    _userType = _userTypeMap[widget.user.userType] ?? "Normal User";
    _currentProfilePicUrl = widget.user.profilePic;

    // Initialize country code from user's countryCode
    // First try from UserModel (which profile page sets), then from storage as fallback
    _initializeCountryCode();

    // Also check storage as fallback for SA/AD users coming from profile
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeCountryCodeFromStorage();
    });
  }

  /// Initialize country code from user's countryCode in UserModel
  void _initializeCountryCode() {
    String? countryCode = widget.user.countryCode;

    // Initialize country picker with the country code
    if (countryCode != null && countryCode.isNotEmpty) {
      try {
        // Try to find country by phone code (e.g., "+1" -> find country with phoneCode "1")
        String phoneCode = countryCode.replaceFirst('+', '');
        final allCountries = CountryService().getAll();
        _selectedCountry = allCountries.firstWhere(
          (country) => country.phoneCode == phoneCode,
          orElse: () => Country.parse('US'),
        );
      } catch (e) {
        _selectedCountry = Country.parse('US');
      }
    } else {
      _selectedCountry = Country.parse('US');
    }
  }

  /// Initialize country code from storage as fallback (for SA/AD users from profile)
  Future<void> _initializeCountryCodeFromStorage() async {
    // Only check storage if countryCode is not already set from UserModel
    if (widget.user.countryCode == null || widget.user.countryCode!.isEmpty) {
      final userType = await getUserType();
      final currentUserId = await getUserId();

      // Only fetch from storage if this is the logged-in SA/AD user editing their own profile
      if ((userType == 'SA' || userType == 'AD') &&
          currentUserId != null &&
          currentUserId == widget.user.id) {
        final countryCode = await getUserCountryCode();

        if (countryCode != null && countryCode.isNotEmpty && mounted) {
          try {
            // Try to find country by phone code
            String phoneCode = countryCode.replaceFirst('+', '');
            final allCountries = CountryService().getAll();
            _selectedCountry = allCountries.firstWhere(
              (country) => country.phoneCode == phoneCode,
              orElse: () => Country.parse('US'),
            );

            // Update UI
            setState(() {});
          } catch (e) {
            // Keep default US if error
          }
        }
      }
    }
  }

  @override
  void dispose() {
    _phoneController.dispose();
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

      final countryCode = '+${_selectedCountry?.phoneCode ?? '1'}';

      final updatedUser = UserModel(
        id: widget.user.id,
        name: _name,
        email: _email,
        phoneNumber: _phoneController.text.trim(),
        userType: _getShortForm(_userType),
        profilePic: _currentProfilePicUrl,
        countryCode: countryCode,
        password: _showPasswordSection && _passwordController.text.isNotEmpty
            ? _passwordController.text.trim()
            : null, // Only include password if it's being changed
      );

      if (_profilePicBytes != null) {
        // User is uploading a new profile picture
        context.read<UserBloc>().add(UserEvent.updateUserWithProfilePic(
              updatedUser: updatedUser,
              profilePicBytes: _profilePicBytes!,
            ));
      } else {
        // User is not changing profile picture (keep existing or no profile picture)
        // Always use the regular update path - it handles existing profilePic URLs correctly
        context.read<UserBloc>().add(UpdateUser(updatedUser: updatedUser));
      }
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
                  if ((userType == 'AD' || userType == 'SA') &&
                      currentUserId != null &&
                      currentUserId == widget.user.id) {
                    // For AD/SA users editing their own profile, go back to profile page
                    context.read<UserBloc>().add(const FetchAllUsers());
                    context.go('/profile');
                  } else {
                    // For all other cases (editing other users), go to users list
                    context.read<UserBloc>().add(const FetchAllUsers());
                    context.go('/users');
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

  /// Update stored user data if the logged-in user (AD or SA) is editing their own profile
  Future<void> _updateStoredUserDataIfOwnProfile() async {
    final userType = await getUserType();
    final currentUserId = await getUserId();

    // Only update stored data if AD or SA user is editing their own profile
    if ((userType == 'AD' || userType == 'SA') &&
        currentUserId != null &&
        currentUserId == widget.user.id) {
      final countryCode = '+${_selectedCountry?.phoneCode ?? '1'}';
      await updateUserName(_name);
      await updateUserEmail(_email);
      await updateUserPhoneNumber(_phoneController.text);
      await updateUserCountryCode(countryCode);
      if (_currentProfilePicUrl != null && _currentProfilePicUrl!.isNotEmpty) {
        await updateUserProfilePicture(_currentProfilePicUrl!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserUpdated) {
          // Update stored data if AD user is editing their own profile
          _updateStoredUserDataIfOwnProfile().then((_) {
            _showSuccessPopup(
                context, "User details have been updated successfully.");
          });
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

  /// Header Section with Back Button
  Widget _buildHeaderSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () {
            context.pop();
            context.read<UserBloc>().add(FetchAllUsers());
          },
        ),
        const SizedBox(width: 4),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Users / Edit",
                style: GoogleFonts.inter(
                    fontSize: 12, color: AppColors.textMuted)),
            const SizedBox(height: 2),
            Text("Edit user",
                style: GoogleFonts.inter(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary)),
          ],
        ),
      ],
    );
  }

  Widget _buildUpdateForm(UserState state) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 640),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.border),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _photoBlock(),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _userEditFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _twoCol([
                        _labeled("Name",
                            _buildFormField("Name", _name, (v) => _name = v!)),
                        _labeled(
                            "Email",
                            _buildFormField("Email", _email, (v) => _email = v!,
                                isEmail: true)),
                        _labeled("Phone number", _buildPhoneField()),
                        _labeled("User type",
                            _buildDropdownField("User Type", _userType)),
                      ]),
                      const SizedBox(height: 16),
                      _buildChangePasswordSection(),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: state is UserLoading ? null : _updateUser,
                          child: state is UserLoading
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                      strokeWidth: 2, color: Colors.white),
                                )
                              : Text("Save changes",
                                  style: GoogleFonts.inter(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _photoBlock() {
    final img = _photoImage();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: const BoxDecoration(
        color: AppColors.surfaceAlt,
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: _pickProfilePicture,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.accentSoft,
                    image: img,
                  ),
                  child: img == null
                      ? Center(
                          child: Text(_initials(_name),
                              style: GoogleFonts.inter(
                                  color: AppColors.accent,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20)))
                      : null,
                ),
                Positioned(
                  right: -2,
                  bottom: -2,
                  child: Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                        color: AppColors.accent,
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: AppColors.surface, width: 2)),
                    child: const Icon(Icons.camera_alt,
                        color: Colors.white, size: 11),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Profile photo",
                  style: GoogleFonts.inter(
                      fontSize: 14, fontWeight: FontWeight.w600)),
              const SizedBox(height: 2),
              Text("PNG or JPG, tap to change",
                  style: GoogleFonts.inter(
                      fontSize: 12, color: AppColors.textSecondary)),
            ],
          ),
        ],
      ),
    );
  }

  DecorationImage? _photoImage() {
    if (_profilePicBytes != null) {
      return DecorationImage(
          image: MemoryImage(_profilePicBytes!), fit: BoxFit.cover);
    }
    if (_currentProfilePicUrl != null &&
        _currentProfilePicUrl!.isNotEmpty &&
        _currentProfilePicUrl != 'default-profile-pic-url') {
      return DecorationImage(
          image: NetworkImage(_currentProfilePicUrl!), fit: BoxFit.cover);
    }
    return null;
  }

  Widget _labeled(String label, Widget field) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_fieldLabel(label), field],
      );

  Widget _twoCol(List<Widget> items) {
    return LayoutBuilder(builder: (context, c) {
      if (c.maxWidth < 480) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0; i < items.length; i++) ...[
              items[i],
              if (i != items.length - 1) const SizedBox(height: 16),
            ],
          ],
        );
      }
      const gap = 16.0;
      final w = (c.maxWidth - gap) / 2;
      return Wrap(
        spacing: gap,
        runSpacing: gap,
        children: items.map((it) => SizedBox(width: w, child: it)).toList(),
      );
    });
  }

  String _initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.length > 1 && parts[0].isNotEmpty && parts[1].isNotEmpty) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return parts.isNotEmpty && parts[0].isNotEmpty
        ? parts[0][0].toUpperCase()
        : 'U';
  }

  Widget _fieldLabel(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Text(text,
            style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary)),
      );

  Widget _buildFormField(
      String label, String initialValue, Function(String?) onSaved,
      {bool isEmail = false, bool isPhone = false}) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        hintText: "Enter $label",
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
        if (isPhone && value.isEmpty) {
          return "Enter a valid phone number";
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
        _fieldLabel("Profile picture"),
        const SizedBox(height: 2),
        GestureDetector(
          onTap: _pickProfilePicture,
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: AppColors.surfaceAlt,
              border: Border.all(color: AppColors.border),
              borderRadius: BorderRadius.circular(12),
            ),
            child: _profilePicBytes != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(11),
                    child: Image.memory(
                      _profilePicBytes!,
                      fit: BoxFit.cover,
                    ),
                  )
                : _currentProfilePicUrl != null &&
                        _currentProfilePicUrl!.isNotEmpty
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(11),
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
        const Icon(
          Icons.add_a_photo_outlined,
          size: 32,
          color: AppColors.textMuted,
        ),
        const SizedBox(height: 6),
        Text(
          "Add photo",
          style: GoogleFonts.inter(
            fontSize: 12,
            color: AppColors.textSecondary,
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
              color: AppColors.surfaceAlt,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.lock_outline,
                  size: 19,
                  color: AppColors.textSecondary,
                ),
                const SizedBox(width: 12),
                Text(
                  "Change password",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const Spacer(),
                Icon(
                  _showPasswordSection ? Icons.expand_less : Icons.expand_more,
                  color: AppColors.textSecondary,
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

  Widget _buildPhoneField() {
    return TextFormField(
      controller: _phoneController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: "Phone number",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        prefixIcon: _buildCountryCodeSelector(),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Phone Number is required";
        }
        return null;
      },
    );
  }

  Widget _buildCountryCodeSelector() {
    return GestureDetector(
      onTap: () => _showCountryPicker(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_selectedCountry != null)
              Text(
                _selectedCountry!.flagEmoji,
                style: const TextStyle(fontSize: 20),
              ),
            const SizedBox(width: 4),
            Text(
              '+${_selectedCountry?.phoneCode ?? '1'}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.arrow_drop_down, size: 20),
          ],
        ),
      ),
    );
  }

  void _showCountryPicker() {
    showCountryPicker(
      context: context,
      onSelect: (Country country) {
        setState(() {
          _selectedCountry = country;
        });
      },
      favorite: ['US', 'IN', 'GB'],
      showPhoneCode: true,
    );
  }
}
