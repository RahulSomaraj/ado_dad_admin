import 'package:flutter/material.dart';

class UserFormSection extends StatefulWidget {
  const UserFormSection({Key? key}) : super(key: key);

  @override
  _UserFormSectionState createState() => _UserFormSectionState();
}

class _UserFormSectionState extends State<UserFormSection> {
  String? selectedUserType;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double pixelRatio = MediaQuery.of(context).devicePixelRatio;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "User",
          style: TextStyle(
            fontSize: 16 * pixelRatio,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: screenHeight * 0.02),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Name",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.02),
        TextFormField(
          decoration: InputDecoration(
            labelText: "E-mail",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.02),
        TextFormField(
          decoration: InputDecoration(
            labelText: "PhoneNumber",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.02),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: "User Type",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          value: selectedUserType,
          items: const [
            DropdownMenuItem(
              value: "admin",
              child: Text("Admin"),
            ),
            DropdownMenuItem(
              value: "user",
              child: Text("User"),
            ),
            DropdownMenuItem(
              value: "showroom",
              child: Text("Showroom"),
            ),
          ],
          onChanged: (value) {
            setState(() {
              selectedUserType = value;
            });
          },
        ),
        // The form here does not handle the image upload.
        // The Save button in the parent widget will use the images.
      ],
    );
  }
}
