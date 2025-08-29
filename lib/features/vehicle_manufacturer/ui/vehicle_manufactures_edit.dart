import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/common/countries.dart';
import 'package:ado_dad_admin/features/vehicle_manufacturer/bloc/bloc/vehicle_manufacturer_bloc.dart';
import 'package:ado_dad_admin/models/vehicle_manufacturer/vehicle_manufacturer_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VehicleManufacturesEdit extends StatefulWidget {
  final VehicleManufacturer vehiclemanufacturer;
  const VehicleManufacturesEdit({super.key, required this.vehiclemanufacturer});

  @override
  State<VehicleManufacturesEdit> createState() =>
      _VehicleManufacturesEditState();
}

class _VehicleManufacturesEditState extends State<VehicleManufacturesEdit> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String _name;
  late String _displayname;
  late String _description;
  late String _logo;
  late String _website;
  late String _foundedYear;
  late String _headquarters;
  late String _originCountry;
  late bool _isActive;

  @override
  void initState() {
    super.initState();
    final m = widget.vehiclemanufacturer;
    _name = m.name;
    _displayname = m.displayName;
    _description = m.description;
    _logo = m.logo;
    _website = m.website;
    _foundedYear = m.foundedYear.toString();
    _headquarters = m.headquarters;
    _originCountry = m.originCountry;
    _isActive = m.isActive;
  }

  void _updateVehicleManufacturer() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final updated = VehicleManufacturer(
        id: widget.vehiclemanufacturer.id,
        name: _name,
        displayName: _displayname,
        originCountry: _originCountry,
        description: _description,
        logo: _logo,
        website: _website,
        foundedYear: int.tryParse(_foundedYear) ?? 0,
        headquarters: _headquarters,
        isActive: _isActive,
      );

      context.read<VehicleManufacturerBloc>().add(
            VehicleManufacturerEvent.updateManufacturer(updated),
          );
    }
  }

  void _showSuccessPopup(BuildContext context, String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text("Success"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                context.go('/vehicle-manufactures');
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
    return BlocListener<VehicleManufacturerBloc, VehicleManufacturerState>(
      listener: (context, state) {
        state.maybeWhen(
          loaded: (response) {
            _showSuccessPopup(context, "Manufacturer updated successfully.");
          },
          orElse: () {},
        );
      },
      child: BlocBuilder<VehicleManufacturerBloc, VehicleManufacturerState>(
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
                    .read<VehicleManufacturerBloc>()
                    .add(FetchAllVehicleManufacturers());
              },
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Edit Vehicle Manufacturer",
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

  Widget _buildFormRow(List<Widget> children) {
    return Row(
      children: [
        Expanded(child: children[0]),
        const SizedBox(width: 16),
        Expanded(child: children[1]),
      ],
    );
  }

  Widget _buildUpdateForm(VehicleManufacturerState state) {
    final isLoading = state.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 900),
        child: Card(
          elevation: 5,
          color: AppColors.primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildFormRow([
                    _buildFormField(
                        "Manufacturer Name", _name, (v) => _name = v!),
                    _buildFormField(
                        "Display Name", _displayname, (v) => _displayname = v!),
                  ]),
                  const SizedBox(height: 15),
                  _buildFormRow([
                    DropdownButtonFormField<String>(
                      value: _originCountry,
                      decoration: InputDecoration(
                        labelText: 'Country',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      items: countryList
                          .map((country) => DropdownMenuItem(
                                value: country,
                                child: Text(country),
                              ))
                          .toList(),
                      onChanged: (v) =>
                          setState(() => _originCountry = v ?? ''),
                      validator: (v) => (v == null || v.isEmpty)
                          ? 'Country is required'
                          : null,
                    ),
                    _buildFormField(
                        "Description", _description, (v) => _description = v!),
                  ]),
                  const SizedBox(height: 15),
                  _buildFormRow([
                    _buildFormField("Logo URL", _logo, (v) => _logo = v!),
                    _buildFormField("Website", _website, (v) => _website = v!),
                  ]),
                  const SizedBox(height: 15),
                  _buildFormRow([
                    _buildFormField(
                        "Founded Year", _foundedYear, (v) => _foundedYear = v!),
                    _buildFormField("Headquarters", _headquarters,
                        (v) => _headquarters = v!),
                  ]),
                  const SizedBox(height: 15),
                  CheckboxListTile(
                    value: _isActive,
                    onChanged: (v) => setState(() => _isActive = v ?? true),
                    title: const Text("Is Active"),
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
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
                      onPressed: isLoading ? null : _updateVehicleManufacturer,
                      child: isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                  strokeWidth: 2, color: Colors.white),
                            )
                          : const Text("Update Manufacturer",
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
}
