import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ado_dad_admin/features/users/bloc/user_bloc.dart';
import 'package:ado_dad_admin/models/user_model.dart';
import 'package:go_router/go_router.dart';

class EditUser extends StatefulWidget {
  final UserModel user;

  const EditUser({super.key, required this.user});

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  final _formKey = GlobalKey<FormState>();

  late String _name;
  late String _email;
  late String _phone;
  late String _userType; // Full form for UI dropdown

  /// ✅ Short form to Full form mapping
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
    _userType = _userTypeMap[widget.user.type] ??
        "Unknown"; // Convert short form to full form
  }

  /// ✅ Convert Full Form to Short Form before sending API request
  String _getShortForm(String fullType) {
    return _userTypeMap.entries
        .firstWhere((entry) => entry.value == fullType,
            orElse: () => const MapEntry('Unknown', 'Unknown'))
        .key;
  }

  void _updateUser() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // ✅ Save values

      final updatedUser = UserModel(
        id: widget.user.id,
        name: _name,
        email: _email,
        phoneNumber: _phone,
        type: _getShortForm(_userType), // Convert full form back to short form
      );

      context.read<UserBloc>().add(UpdateUser(updatedUser: updatedUser));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserUpdated) {
          _showSuccessDialog(context);
        } else if (state is UserError) {
          _showErrorDialog(context, state.message);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            _buildHeaderSection(),
            SizedBox(height: 30),
            _buildUpdateForm(),
          ],
        ),
      ),
    );
  }

  /// ✅ Success Dialog
  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text("Success",
              style: TextStyle(fontWeight: FontWeight.bold)),
          content: const Text("User details have been updated successfully."),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: const Text("OK", style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }

  /// ✅ Error Dialog
  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Error",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => context.pop(),
              child: const Text("OK", style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }

  /// ✅ UI for the Update Form
  Center _buildUpdateForm() {
    return Center(
      child: SizedBox(
        width: 500,
        child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  _buildFormField("Name", _name, (value) => _name = value!),
                  const SizedBox(height: 15),
                  _buildFormField("Email", _email, (value) => _email = value!,
                      isEmail: true),
                  const SizedBox(height: 15),
                  _buildFormField(
                      "Phone Number", _phone, (value) => _phone = value!),
                  const SizedBox(height: 15),
                  _buildDropdownField("User Type", _userType),
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
                      onPressed: _updateUser,
                      child: const Text("Update",
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

  /// ✅ Header Section
  Widget _buildHeaderSection() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Edit User",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ✅ Text Field Builder with Validation
  Widget _buildFormField(
      String label, String initialValue, Function(String?) onSaved,
      {bool isEmail = false}) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.black, width: 1.5)),
      ),
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      validator: (value) {
        if (value == null || value.isEmpty) return "$label is required";
        return null;
      },
      onSaved: onSaved,
    );
  }

  /// ✅ Dropdown Field for User Type
  Widget _buildDropdownField(String label, String selectedValue) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.black, width: 1.5)),
      ),
      items: _userTypeMap.values.map((String type) {
        return DropdownMenuItem<String>(
          value: type,
          child: Text(type),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _userType = value!;
        });
      },
      validator: (value) => value == null ? "Please select a user type" : null,
    );
  }
}
