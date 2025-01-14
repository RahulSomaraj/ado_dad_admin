import 'package:flutter/material.dart';
import 'package:ado_dad_admin/core/model/user_model.dart';

class UserEditPageDetail extends StatefulWidget {
  final UserModel? user;
  final void Function(int previousPageIndex) onGoBack;
  final void Function(int editPageIndex, String userId) onEditPage;

  const UserEditPageDetail(
      {super.key, this.user, required this.onGoBack, required this.onEditPage});

  @override
  State<UserEditPageDetail> createState() => _UserEditPageDetailState();
}

class _UserEditPageDetailState extends State<UserEditPageDetail> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user?.name ?? '');
    _descriptionController =
        TextEditingController(text: widget.user?.phoneNumber ?? '');
  }

  @override
  Widget build(BuildContext context) {
    bool isNew = widget.user == null;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(isNew ? 'Create' : 'Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
