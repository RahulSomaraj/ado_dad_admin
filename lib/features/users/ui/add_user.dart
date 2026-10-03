import 'dart:typed_data';
import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ado_dad_admin/features/users/bloc/user_bloc.dart';
import 'package:ado_dad_admin/models/user_model.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:country_picker/country_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final GlobalKey<FormState> _userFormKey = GlobalKey<FormState>();

  // Replaced variable with controllrs
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Country code state
  Country? _selectedCountry;

  // Profile picture state
  Uint8List? _profilePicBytes;

  // Password visibility state
  bool _isPasswordVisible = false;

  // String _name = '';
  // String _email = '';
  // String _phone = '';
  // String _password = '';

  String _userType = "Admin";

  /// Only Admin and Super Admin
  final Map<String, String> _userTypeMap = {
    'SA': "Super Admin",
    'AD': "Admin",
    'NU': "Normal User",
    'SR': "Showroom"
  };

  String _getShortForm(String fullType) {
    return _userTypeMap.entries
        .firstWhere(
          (entry) => entry.value == fullType,
          orElse: () => const MapEntry('AD', "Admin"),
        )
        .key;
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

  void _addUser() {
    // Validate password strength first
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

    if (_userFormKey.currentState!.validate()) {
      // _userFormKey.currentState!.save();
      final countryCode = '+${_selectedCountry?.phoneCode ?? '1'}';

      final newUser = UserModel(
        id: '',
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        phoneNumber: _phoneController.text.trim(),
        password: _passwordController.text.trim(),
        userType: _getShortForm(_userType),
        countryCode: countryCode,
      );

      if (_profilePicBytes != null) {
        // Add user with profile picture
        context.read<UserBloc>().add(UserEvent.addUserWithProfilePic(
              userData: newUser,
              profilePicBytes: _profilePicBytes!,
            ));
      } else {
        // Add user without profile picture
        context.read<UserBloc>().add(UserEvent.addUser(userData: newUser));
      }
    }
  }

  void _showSuccessPopup(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Success"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                context.pop(true);
                context.go('/users');
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

// Dispose controllers
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // @override
  // void dispose() {
  //   _nameController.dispose();
  //   _emailController.dispose();
  //   _phoneController.dispose();
  //   _passwordController.dispose();
  //   super.dispose();
  // }

  @override
  void initState() {
    super.initState();
    // Initialize with US country code
    _selectedCountry = Country.parse('US');
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is UserAddedSuccess) {
          _showSuccessPopup(context, state.message);
        }
      },
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeaderSection(),
                const SizedBox(height: 16),
                _buildUserForm(state),
                const SizedBox(height: 30),
              ],
            ),
          );
        },
      ),
    );
  }

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
            Text("Users / Add",
                style: GoogleFonts.inter(
                    fontSize: 12, color: AppColors.textMuted)),
            const SizedBox(height: 2),
            Text("Add user",
                style: GoogleFonts.inter(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary)),
          ],
        ),
      ],
    );
  }

  Widget _buildUserForm(UserState state) {
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
                  key: _userFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _twoCol([
                        _labeled("Name",
                            _buildFormField("Name", _nameController)),
                        _labeled(
                            "Email",
                            _buildFormField("Email", _emailController,
                                isEmail: true)),
                        _labeled("Phone number", _buildPhoneField()),
                        _labeled(
                            "Password",
                            _buildFormField("Password", _passwordController,
                                isPassword: true)),
                        _labeled("User type",
                            _buildDropdownField("User Type", _userType)),
                      ]),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: state is UserLoading ? null : _addUser,
                          child: state is UserLoading
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                      strokeWidth: 2, color: Colors.white),
                                )
                              : Text("Add user",
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
                      ? const Icon(Icons.person_outline,
                          color: AppColors.accent, size: 28)
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
              Text("Optional · PNG or JPG, tap to add",
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
    return null;
  }

  Widget _labeled(String label, Widget field) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Text(label,
                style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary)),
          ),
          field,
        ],
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

//   Widget _buildFormField(
//     String label,
//     String initialValue,
//     Function(String?) onSaved, {
//     bool isEmail = false,
//     bool isPhone = false,
// // bool obscureText = false
//   })
  // Changed to use TextEditingController
  Widget _buildFormField(
    String label,
    TextEditingController controller, {
    bool isEmail = false,
    bool isPhone = false,
    bool obscureText = false,
    bool isPassword = false,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: "Enter $label",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              )
            : null,
      ),
      // initialValue: initialValue,
      obscureText: isPassword ? !_isPasswordVisible : obscureText,
      keyboardType: isEmail
          ? TextInputType.emailAddress
          : (isPhone ? TextInputType.phone : TextInputType.text),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "$label is required";
        }
        if (isEmail &&
            !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                .hasMatch(value.trim())) {
          return "Enter a valid email address";
        }
        if (isPhone && value.trim().isEmpty) {
          return "Enter a valid phone number";
        }

        // For password field, validate password strength
        if (isPassword) {
          String? strengthError = _validatePasswordStrength(value.trim());
          if (strengthError != null) {
            return strengthError;
          }
        }

        return null;
      },
      // onSaved: onSaved,
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

  Widget _buildDropdownField(String label, String selectedValue) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      items: _userTypeMap.values
          .map((type) => DropdownMenuItem(value: type, child: Text(type)))
          .toList(),
      onChanged: (value) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          setState(() {
            _userType = value!;
          });
        });
      },
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
        Center(
          child: GestureDetector(
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
                  : Column(
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
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
