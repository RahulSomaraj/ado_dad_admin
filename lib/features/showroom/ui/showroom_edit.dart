import 'package:ado_dad_admin/features/showroom/bloc/showroom_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ado_dad_admin/models/user_model.dart';
import 'package:go_router/go_router.dart';

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

  @override
  void initState() {
    super.initState();
    _name = widget.showroomuser.name;
    _email = widget.showroomuser.email;
    _phone = widget.showroomuser.phoneNumber;
  }

  void _updateShowroom() {
    if (_showroomEditFormKey.currentState!.validate()) {
      _showroomEditFormKey.currentState!.save();

      final updatedShowroom = UserModel(
        id: widget.showroomuser.id,
        name: _name,
        email: _email,
        phoneNumber: _phone,
        type: 'SR',
      );
      context
          .read<ShowroomBloc>()
          .add(UpdateShowroom(updatedShowroom: updatedShowroom));
      Future.delayed(const Duration(milliseconds: 500), () {
        _showSuccessPopup(
            context, "Showroom details have been updated successfully.");
      });
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
                context.pop();
                context.go('/showrooms');
                context.read<ShowroomBloc>().add(FetchAllShowrooms());
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
    return BlocBuilder<ShowroomBloc, ShowroomState>(
      builder: (context, state) {
        return Padding(
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
    );
  }

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
                context.pop();
                context.read<ShowroomBloc>().add(FetchAllShowrooms());
              },
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Edit Showroom",
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

  Center _buildUpdateForm(ShowroomState state) {
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
}
