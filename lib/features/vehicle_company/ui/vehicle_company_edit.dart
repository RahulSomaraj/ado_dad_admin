import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/features/vehicle_company/bloc/vehicle_company_bloc.dart';
import 'package:ado_dad_admin/models/vehicle_company_model.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EditVehicleCompany extends StatefulWidget {
  final VehicleCompanyModel vehiclecompany;
  const EditVehicleCompany({super.key, required this.vehiclecompany});

  @override
  State<EditVehicleCompany> createState() => _EditVehicleCompanyState();
}

class _EditVehicleCompanyState extends State<EditVehicleCompany> {
  final GlobalKey<FormState> _vehiclecompanyEditFormKey =
      GlobalKey<FormState>();

  late String _companyName;
  late String _originContry;
  late String _vehicleType;
  late String _logo;

  List<String> _countryList = [];
  final List<String> _vehicleTypes = ["TWO_WHEELER", "FOUR_WHEELER"];

  @override
  void initState() {
    super.initState();
    _companyName = widget.vehiclecompany.name!;
    _originContry = widget.vehiclecompany.originCountry!;
    _vehicleType = widget.vehiclecompany.vehicleType!;
    _logo = widget.vehiclecompany.logo ?? '';
    _loadCountries();
  }

  Future<void> _loadCountries() async {
    List<String> countries =
        CountryService().getAll().map((country) => country.name).toList();

    setState(() {
      _countryList = countries;
    });
  }

  void _updateVehicleCompany() {
    if (_vehiclecompanyEditFormKey.currentState!.validate()) {
      _vehiclecompanyEditFormKey.currentState!.save();

      final updatedVehicleCompany = VehicleCompanyModel(
        id: widget.vehiclecompany.id,
        name: _companyName,
        originCountry: _originContry,
        vehicleType: _vehicleType,
        logo: _logo,
      );

      context.read<VehicleCompanyBloc>().add(
          UpdateVehicleCompany(updatedVehicleCompany: updatedVehicleCompany));
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
                context.go('/vehicle-companies');
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
    return BlocListener<VehicleCompanyBloc, VehicleCompanyState>(
      listener: (context, state) {
        if (state is VehicleCompanyUpdated) {
          _showSuccessPopup(context,
              "Vehicle Company details have been updated successfully.");
        }
      },
      child: BlocBuilder<VehicleCompanyBloc, VehicleCompanyState>(
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
                context
                    .read<VehicleCompanyBloc>()
                    .add(FetchAllVehicleCompany());
              },
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Edit Vehicle Company",
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

  Center _buildUpdateForm(VehicleCompanyState state) {
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
              key: _vehiclecompanyEditFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFormField("Vehicle Company Name", _companyName,
                      (value) => _companyName = value!),
                  const SizedBox(height: 15),
                  _buildFormField(
                      "Company Logo", _logo, (value) => _logo = value!),
                  const SizedBox(height: 15),
                  _buildDropdownField(
                    "Origin Country of Vehicle Company",
                    _originContry,
                    _countryList,
                    (value) => _originContry = value,
                  ),
                  const SizedBox(height: 15),
                  _buildDropdownField(
                    "Vehicle Type",
                    _vehicleType,
                    _vehicleTypes,
                    (value) => _vehicleType = value,
                  ),
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
                      onPressed: state is VehicleCompanyLoading
                          ? null
                          : _updateVehicleCompany,
                      child: state is VehicleCompanyLoading
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
    String label,
    String initialValue,
    Function(String?) onSaved,
  ) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "$label is required";
        }
        return null;
      },
      onSaved: onSaved,
    );
  }

  Widget _buildDropdownField(String label, String? selectedValue,
      List<String> options, Function(String) onChanged) {
    return DropdownButtonFormField<String>(
      value: selectedValue, // Ensure this is valid or set to null
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      items: options.map((String value) {
        return DropdownMenuItem(value: value, child: Text(value));
      }).toList(),
      onChanged: (value) => setState(() => onChanged(value!)),
      validator: (value) =>
          value == null || value.isEmpty ? "Please select $label" : null,
    );
  }
}
