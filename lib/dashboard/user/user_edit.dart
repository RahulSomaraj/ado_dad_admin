import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ado_dad_admin/core/model/user_model.dart';
import 'package:ado_dad_admin/core/bloc/users/user_bloc.dart';
import 'package:ado_dad_admin/core/bloc/users/user_event.dart';
import 'package:ado_dad_admin/core/bloc/users/user_state.dart';

enum UserRole { admin, user, showroom }

class UserEditPageDetail extends StatefulWidget {
  final UserModel? user;
  final void Function(int previousPageIndex) onGoBack;
  final void Function(int editPageIndex, String userId) onEditPage;

  const UserEditPageDetail({
    super.key,
    this.user,
    required this.onGoBack,
    required this.onEditPage,
  });

  @override
  State<UserEditPageDetail> createState() => _UserEditPageDetailState();
}

class _UserEditPageDetailState extends State<UserEditPageDetail> {
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  UserRole? _selectedRole;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user?.name ?? '');
    _phoneController =
        TextEditingController(text: widget.user?.phoneNumber ?? '');
    _emailController = TextEditingController(text: widget.user?.email ?? '');
    _selectedRole = widget.user?.type != null
        ? UserRole.values.firstWhere(
            (role) => role.toString().split('.').last == widget.user!.type,
            orElse: () => UserRole.user,
          )
        : null;
  }

  @override
  Widget build(BuildContext context) {
    bool isNew = widget.user == null;

    return Scaffold(
      body: Center(
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            width: 400, // Fixed width for the card
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize:
                  MainAxisSize.min, // Minimize height based on content
              children: [
                const Text(
                  'User Details',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                // Name TextField
                TextField(
                  controller: _nameController,
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Phone Number TextField
                TextField(
                  controller: _phoneController,
                  onChanged: (value) {
                    // Trigger state updates if needed
                  },
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Email TextField
                TextField(
                  controller: _emailController,
                  onChanged: (value) {
                    // Trigger state updates if needed
                  },
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Role Dropdown
                DropdownButtonFormField<UserRole>(
                  value: _selectedRole,
                  decoration: InputDecoration(
                    labelText: 'Role',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  items: UserRole.values.map((role) {
                    return DropdownMenuItem<UserRole>(
                      value: role,
                      child:
                          Text(role.toString().split('.').last.toUpperCase()),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedRole = value;
                    });
                  },
                ),
                const SizedBox(height: 30),
                // Save/Create Button
                ElevatedButton(
                    onPressed: () {
                      final userId = widget.user?.id ?? '';
                      final name = _nameController.text;
                      final phoneNumber = _phoneController.text;
                      final email = _emailController.text;
                      final type =
                          _selectedRole?.toString().split('.').last ?? '';

                      if (name.isNotEmpty &&
                          phoneNumber.isNotEmpty &&
                          email.isNotEmpty &&
                          type.isNotEmpty) {
                        context.read<UserBloc>().add(
                              UpdateUser(
                                userId: userId,
                                updatedData: {
                                  'type': type,
                                  'name': name,
                                  'phoneNumber': phoneNumber,
                                  'email': email,
                                },
                              ),
                            );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('All fields are required')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize:
                          const Size(double.infinity, 50), // Full-width button
                    ),
                    child: Text(isNew ? 'Create' : 'Save Changes')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
