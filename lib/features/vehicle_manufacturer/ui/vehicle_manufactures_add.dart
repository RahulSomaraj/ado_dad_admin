import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/common/vehicle_categories.dart';
import 'package:ado_dad_admin/features/vehicle_manufacturer/bloc/bloc/vehicle_manufacturer_bloc.dart';
import 'package:ado_dad_admin/features/widgets/form_kit.dart';
import 'package:ado_dad_admin/models/vehicle_manufacturer/vehicle_manufacturer_model.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:file_picker/file_picker.dart';

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
  bool _isPremium = false;
  String? _vehicleCategory;

  List<String> _countryList = [];

  @override
  void initState() {
    super.initState();
    _loadCountries();
  }

  Future<void> _loadCountries() async {
    List<String> countries =
        CountryService().getAll().map((country) => country.name).toList();

    setState(() {
      _countryList = countries;
    });
  }

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

      if (_vehicleCategory == null || _vehicleCategory!.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please select a vehicle category")),
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
        isPremium: _isPremium,
        vehicleCategory: _vehicleCategory!,
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

  Future<void> _uploadCsvFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['csv'],
        withData: true,
      );

      if (result != null && result.files.single.bytes != null) {
        final fileBytes = result.files.single.bytes!;
        final fileName = result.files.single.name;

        if (mounted) {
          context.read<VehicleManufacturerBloc>().add(
                VehicleManufacturerEvent.uploadCsv(fileBytes, fileName),
              );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error picking file: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<VehicleManufacturerBloc, VehicleManufacturerState>(
      listener: (context, state) {
        state.maybeWhen(
          loaded: (response) {
            _showSuccessPopup(context, "Operation completed successfully.");
          },
          error: (message) {
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          orElse: () {},
        );
      },
      child: BlocBuilder<VehicleManufacturerBloc, VehicleManufacturerState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormHeaderBar(
                  breadcrumb: "Manufacturers / Add",
                  title: "Add Manufacturer",
                  onBack: () {
                    if (mounted) {
                      context.pop();
                      context
                          .read<VehicleManufacturerBloc>()
                          .add(FetchAllVehicleManufacturers());
                    }
                  },
                  actions: [
                    OutlinedButton.icon(
                      onPressed: _uploadCsvFile,
                      icon: const Icon(Icons.upload_file, size: 16),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.textSecondary,
                        side: const BorderSide(color: AppColors.border),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 12),
                      ),
                      label: const Text("Upload CSV"),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildVehicleManufactureForm(state),
              ],
            ),
          );
        },
      ),
    );
  }

  // ignore: unused_element
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
            const Spacer(),
            ElevatedButton.icon(
              onPressed: _uploadCsvFile,
              icon: const Icon(Icons.upload_file, color: Colors.white),
              label: const Text(
                'Upload CSV',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
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
        child: Container(
          decoration: formCardDecoration(),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FormHeaderStrip(
                icon: Icons.factory_outlined,
                title: "New manufacturer",
                subtitle: "Add a brand to the vehicle catalog",
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _manufactureFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FormSectionTitle("Brand details"),
                      _buildFormRow([
                        _buildFormField(
                            "Manufacturer Name", "", (v) => _name = v!),
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
                    LabeledField(
                      label: "Origin country",
                      child: DropdownButtonFormField<String>(
                        value: _origincountry,
                        isExpanded: true,
                        decoration: formInputDecoration("Select country"),
                        items: _countryList
                            .map((country) => DropdownMenuItem(
                                  value: country,
                                  child: Text(
                                    country,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ))
                            .toList(),
                        onChanged: (value) =>
                            setState(() => _origincountry = value),
                        validator: (value) => (value == null || value.isEmpty)
                            ? 'Country is required'
                            : null,
                      ),
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
                  const SizedBox(height: 20),
                  const FormSectionTitle("Classification & status"),
                  LabeledField(
                    label: "Vehicle category",
                    child: DropdownButtonFormField<String>(
                      value: _vehicleCategory,
                      isExpanded: true,
                      decoration: formInputDecoration("Select category"),
                      items: kVehicleCategories
                          .map((category) => DropdownMenuItem(
                                value: category.value,
                                child: Text(category.label),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _vehicleCategory = value;
                        });
                      },
                      onSaved: (value) {
                        _vehicleCategory = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Vehicle Category is required';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 14),
                  _toggleRow(
                    activeValue: _isActive,
                    onActive: (v) => setState(() => _isActive = v),
                    premiumValue: _isPremium,
                    onPremium: (v) => setState(() => _isPremium = v),
                  ),
                  const SizedBox(height: 22),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        backgroundColor: AppColors.accent,
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormRow(List<Widget> children) => TwoColGrid(children);

  Widget _toggleRow({
    required bool activeValue,
    required ValueChanged<bool> onActive,
    required bool premiumValue,
    required ValueChanged<bool> onPremium,
  }) {
    return Wrap(
      spacing: 24,
      runSpacing: 8,
      children: [
        _switchTile("Active", activeValue, onActive),
        _switchTile("Premium", premiumValue, onPremium),
      ],
    );
  }

  Widget _switchTile(String label, bool value, ValueChanged<bool> onChanged) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Switch(
          value: value,
          activeColor: AppColors.accent,
          onChanged: (v) {
            if (mounted) onChanged(v);
          },
        ),
        const SizedBox(width: 4),
        Text(label,
            style: const TextStyle(
                fontSize: 14, color: AppColors.textPrimary)),
      ],
    );
  }

  Widget _buildFormField(
    String label,
    String initialValue,
    Function(String?) onSaved, {
    bool required = true,
  }) {
    return LabeledField(
      label: label,
      child: TextFormField(
        decoration: formInputDecoration("Enter ${label.toLowerCase()}"),
        validator: required
            ? (value) {
                if (value == null || value.isEmpty) {
                  return "$label is required";
                }
                return null;
              }
            : null,
        onSaved: onSaved,
      ),
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
