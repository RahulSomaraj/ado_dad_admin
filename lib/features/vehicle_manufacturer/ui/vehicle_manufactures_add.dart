import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/common/countries.dart';
import 'package:ado_dad_admin/features/vehicle_manufacturer/bloc/bloc/vehicle_manufacturer_bloc.dart';
import 'package:ado_dad_admin/models/vehicle_manufacturer/vehicle_manufacturer_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VehicleManufacturesAdd extends StatefulWidget {
  const VehicleManufacturesAdd({super.key});

  @override
  State<VehicleManufacturesAdd> createState() => _VehicleManufacturesAddState();
}

class _VehicleManufacturesAddState extends State<VehicleManufacturesAdd> {
  final GlobalKey<FormState> _manufactureFormKey = GlobalKey<FormState>();
  // List<String> _countryList = [];
  String _name = '';
  String _displayname = '';
  String? _origincountry;
  String _logo = '';
  String _website = '';
  String _description = '';
  String _foundedyear = '';
  String _headquarters = '';
  bool _isActive = false;

  String? _country;

  @override
  void dispose() {
    super.dispose();
  }

  void _addVehicleManufacturer() {
    if (!mounted) return;

    if (_manufactureFormKey.currentState?.validate() ?? false) {
      _manufactureFormKey.currentState?.save();

      if (_origincountry == null || _origincountry!.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please select an origin country")),
        );
        return;
      }

      final manufacturer = VehicleManufacturer(
        id: "", // Leave empty; server should generate it
        name: _name,
        displayName: _displayname,
        originCountry: _origincountry!,
        description: _description,
        logo: _logo,
        website: _website,
        foundedYear: int.tryParse(_foundedyear) ?? 0,
        headquarters: _headquarters,
        isActive: _isActive,
        // isDeleted: false,
        // createdAt: DateTime.now(),
        // updatedAt: DateTime.now(),
      );

      context
          .read<VehicleManufacturerBloc>()
          .add(VehicleManufacturerEvent.createManufacturer(manufacturer));
    }
  }

  void _showSuccessPopup(BuildContext context, String message) {
    if (!mounted) return;

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
                if (mounted) {
                  Navigator.of(context).pop();
                  context.go('/vehicle-manufactures');
                }
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
            _showSuccessPopup(
                context, "Manufacturer has been added successfully.");
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
                _buildVehicleManufactureForm(state),
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
                if (mounted) {
                  context.pop();
                  context
                      .read<VehicleManufacturerBloc>()
                      .add(FetchAllVehicleManufacturers());
                }
              },
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Add Vehicle Manufacturer",
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

  Widget _buildVehicleManufactureForm(VehicleManufacturerState state) {
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
              key: _manufactureFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFormRow([
                    _buildFormField("Manufacturer Name", "", (v) => _name = v!),
                    _buildFormField(
                        "Display Name", "", (v) => _displayname = v!),
                  ]),
                  const SizedBox(height: 15),
                  _buildFormRow([
                    // _buildDropdownField(
                    //     "Origin Country", _origincountry, _countryList, (v) {
                    //   setState(() => _origincountry = v!);
                    // }),
                    // DropdownButtonFormField<String>(
                    //   value: _country,
                    //   decoration: InputDecoration(
                    //     labelText: 'Country',
                    //     border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(10)),
                    //   ),
                    //   items: _countryList
                    //       .map((country) => DropdownMenuItem(
                    //             value: country,
                    //             child: Text(country),
                    //           ))
                    //       .toList(),
                    //   onChanged: (value) =>
                    //       setState(() => _origincountry = value),
                    //   validator: (value) => (value == null || value.isEmpty)
                    //       ? 'Country is required'
                    //       : null,
                    // ),
                    DropdownButtonFormField<String>(
                      value: _country,
                      decoration: InputDecoration(
                        labelText: 'Country',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      items: countryList
                          .map((country) => DropdownMenuItem(
                                value: country,
                                child: Text(country),
                              ))
                          .toList(),
                      onChanged: (value) =>
                          setState(() => _origincountry = value),
                      validator: (value) => (value == null || value.isEmpty)
                          ? 'Country is required'
                          : null,
                    ),

                    _buildFormField(
                        "Description", "", (v) => _description = v!),
                  ]),
                  const SizedBox(height: 15),
                  _buildFormRow([
                    _buildFormField("Manufacturer Logo", "", (v) => _logo = v!),
                    _buildFormField("Website", "", (v) => _website = v!),
                  ]),
                  const SizedBox(height: 15),
                  _buildFormRow([
                    _buildFormField(
                        "Founded Year", "", (v) => _foundedyear = v!),
                    _buildFormField(
                        "Headquarters", "", (v) => _headquarters = v!),
                  ]),
                  const SizedBox(height: 15),
                  CheckboxListTile(
                    value: _isActive,
                    onChanged: (value) {
                      if (mounted) {
                        setState(() => _isActive = value ?? true);
                      }
                    },
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
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: isLoading ? null : _addVehicleManufacturer,
                      child: isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Text(
                              "Add Vehicle Manufacturer",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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

  Widget _buildFormRow(List<Widget> children) {
    return Row(
      children: [
        Expanded(child: children[0]),
        const SizedBox(width: 16),
        Expanded(child: children[1]),
      ],
    );
  }

  Widget _buildFormField(
    String label,
    String initialValue,
    Function(String?) onSaved,
  ) {
    return TextFormField(
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

  // Widget _buildDropdownField(
  //   String label,
  //   String? selectedValue,
  //   List<String> items,
  //   Function(String?) onChanged,
  // ) {
  //   // Don't render dropdown if items list is empty
  //   if (items.isEmpty) {
  //     return TextFormField(
  //       enabled: false,
  //       decoration: InputDecoration(
  //         labelText: label,
  //         border: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(10),
  //         ),
  //         hintText: "Loading countries...",
  //       ),
  //       validator: (value) {
  //         if (value == null || value.isEmpty) {
  //           return "$label is required";
  //         }
  //         return null;
  //       },
  //     );
  //   }

  //   return DropdownButtonFormField<String>(
  //     value: selectedValue,
  //     isExpanded: true,
  //     decoration: InputDecoration(
  //       labelText: label,
  //       border: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //     ),
  //     items: items
  //         .map((type) => DropdownMenuItem<String>(
  //               value: type,
  //               child: Text(
  //                 type,
  //                 overflow: TextOverflow.ellipsis,
  //                 style: const TextStyle(fontSize: 14),
  //               ),
  //             ))
  //         .toList(),
  //     onChanged: (value) {
  //       // Use a post-frame callback to avoid setState during build
  //       WidgetsBinding.instance.addPostFrameCallback((_) {
  //         if (mounted) {
  //           onChanged(value);
  //         }
  //       });
  //     },
  //     validator: (value) {
  //       if (value == null || value.isEmpty) {
  //         return "$label is required";
  //       }
  //       return null;
  //     },
  //     // Add these properties to prevent layout issues
  //     menuMaxHeight: 200,
  //     dropdownColor: Colors.white,
  //     icon: const Icon(Icons.arrow_drop_down),
  //   );
  // }
}
