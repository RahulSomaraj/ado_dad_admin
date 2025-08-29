import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/features/vehicle_manufacturer/bloc/bloc/vehicle_manufacturer_bloc.dart';
import 'package:ado_dad_admin/features/vehicle_model/bloc/vehicle_model_bloc.dart';
import 'package:ado_dad_admin/models/vehicle_manufacturer/vehicle_manufacturer_model.dart';
import 'package:ado_dad_admin/models/vehicle_model/fuel_transmission_models.dart';
import 'package:ado_dad_admin/models/vehicle_model/vehicle_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VehicleModelAdd extends StatefulWidget {
  const VehicleModelAdd({super.key});

  @override
  State<VehicleModelAdd> createState() => _VehicleModelAddState();
}

class _VehicleModelAddState extends State<VehicleModelAdd> {
  final GlobalKey<FormState> _modelFormKey = GlobalKey<FormState>();
  String _modelname = '';
  String _displayname = '';
  String? _description = '';
  String? _launchyear = '';
  // String _brochureurl = '';
  bool _isActive = false;
  VehicleManufacturer? _selectedManufacturer;
  String? _vehicleType;
  // String? _bodyType;
  String? _segment;
  // bool _isCommercial = false;
  // String? _commercialVehicleType;
  // String? _commercialBodyType;
  // String? _payloadCapacity;
  // String? _payloadUnit;
  // String? _axleCount;
  // String? _seatingCapacity;

  final vehicleTypes = [
    'SUV',
    'Sedan',
    'Truck',
    'Coupe',
    'Hatchback',
    'Convertible',
    'two-wheeler',
    'MUV',
    'Compact SUV',
    'Sub-Compact SUV'
  ];
  final bodyTypes = [
    'Flatbed',
    'Container',
    'Refrigerated',
    'Tanker',
    'Dump',
    'Pickup',
    'Box',
    'Passenger'
  ];
  final segments = ['A', 'B', 'C', 'D', 'E'];

  // final Map<String, String> fuelTypeOptions = {
  //   'Petrol': 'Petrol',
  //   'Diesel': 'Diesel',
  //   'Compressed Natural Gas': 'CNG',
  //   'Electric': 'Electric',
  //   'Hybrid': 'Hybrid',
  //   'Plugin Hybrid': 'Pligin_Hybrid',
  //   'Flex Fuel': 'Flex_Fuel',
  // };

  // final Map<String, String> transmissionTypeOptions = {
  //   'Manual': 'Manual',
  //   'Automatic': 'Automatic',
  //   'AMT/Automated Manual Transmission': 'AMT',
  //   'CVT/Continuously Variable Transmission': 'CVT',
  //   'Dual-Clutch': 'Dual_Clutch',
  //   'Semi-Automatic': 'Semi_Automatic',
  //   'IMT/Intelligent Manual Transmission': 'IMT',
  // };

  final List<String> _selectedFuelTypeKeys = [];
  final List<String> _selectedTransmissionKeys = [];

  final payloadUnits = ['kg', 'ton', 'lbs'];
  final commercialBodyTypes = ['flatbed', 'container', 'box', 'dump'];
  final commercialVehicleTypes = ['truck', 'van', 'pickup', 'bus'];

  List<PlatformFile> _selectedImages = [];

  Future<void> _pickImages() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.image,
      withData: true,
    );
    if (result != null && mounted) {
      setState(() {
        _selectedImages.addAll(result.files.where((f) => f.bytes != null));
      });
    }
  }

  Future<void> addVehicleModel(BuildContext context) async {
    if (_modelFormKey.currentState?.validate() ?? false) {
      _modelFormKey.currentState?.save();

      // final model = VehicleModel(
      //   // id: "",
      //   name: _modelname,
      //   displayName: _displayname,
      //   description: _description,
      //   launchYear: int.parse(_launchyear),
      //   brochureUrl: _brochureurl,
      //   isActive: _isActive,
      //   images: [], // placeholder; will be added in bloc
      //   manufacturer: _selectedManufacturer!,
      //   vehicleType: _vehicleType!,
      //   bodyType: _bodyType!,
      //   segment: _segment!,
      //   availableFuelTypes: _selectedFuelTypes,
      //   availableTransmissionTypes: _selectedTransmissionTypes,
      // );
      final model = VehicleModel(
        name: _modelname,
        displayName: _displayname,
        manufacturer: _selectedManufacturer!,
        vehicleType: _vehicleType!,
        description: _description!.isNotEmpty ? _description : null,
        launchYear: _launchyear!.isNotEmpty ? int.tryParse(_launchyear!) : null,
        segment: _segment,
        images: [],
        isActive: _isActive,
        availableFuelTypes:
            _selectedFuelTypeKeys.isNotEmpty ? _selectedFuelTypeKeys : null,
        availableTransmissionTypes: _selectedTransmissionKeys.isNotEmpty
            ? _selectedTransmissionKeys
            : null,
      );

      context.read<VehicleModelBloc>().add(
            VehicleModelEvent.createVehicleModel(
              model: model,
              rawImages: _selectedImages,
            ),
          );
      // Future.delayed(const Duration(milliseconds: 500), () {
      //   if (!mounted) return;
      //   _showSuccessPopup(
      //       context, "Vehicle Model has been added successfully.");
      // });
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
                  context.go('/vehicle-models');
                }
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  Future<void> _selectLaunchYear(BuildContext context) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year),
      firstDate: DateTime(1700),
      lastDate: DateTime(now.year + 1),
      initialDatePickerMode: DatePickerMode.year, // 👈 Start with year mode
      helpText: 'Select Launch Year',
    );

    if (picked != null && mounted) {
      setState(() {
        _launchyear = picked.year.toString();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _isActive = true;
    context
        .read<VehicleManufacturerBloc>()
        .add(FetchAllManufacturersForDropdown());
    context
        .read<VehicleModelBloc>()
        .add(const VehicleModelEvent.fetchOptions());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<VehicleModelBloc, VehicleModelState>(
      listenWhen: (prev, curr) => curr.maybeWhen(
        created: () => true,
        error: (_) => true,
        orElse: () => false,
      ),
      listener: (context, state) {
        state.maybeWhen(
          created: () => _showSuccessPopup(
              context, "Vehicle Model has been added successfully."),
          error: (msg) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text('Create failed: $msg'),
                backgroundColor: Colors.red),
          ),
          orElse: () {},
        );
      },
      child: BlocBuilder<VehicleModelBloc, VehicleModelState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildHeaderSection(),
                const SizedBox(height: 30),
                _buildVehicleModelForm(state),
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
                  context.read<VehicleModelBloc>().add(FetchAllVehicleModels());
                }
              },
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Add Vehicle Model",
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

  Widget _buildVehicleModelForm(VehicleModelState state) {
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
              key: _modelFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFormRow([
                    _buildFormField("Model Name", "", (v) => _modelname = v!),
                    _buildFormField(
                        "Display Name", "", (v) => _displayname = v!),
                  ]),
                  const SizedBox(height: 15),
                  _buildFormRow([
                    _buildFormField("Description", "", (v) => _description = v!,
                        isRequired: false),
                    // _buildFormField("Launch Year", "", (v) => _launchyear = v!,
                    //     isRequired: false),
                    GestureDetector(
                      onTap: () => _selectLaunchYear(context),
                      child: AbsorbPointer(
                        child: TextFormField(
                          controller:
                              TextEditingController(text: _launchyear ?? ''),
                          decoration: InputDecoration(
                            labelText: 'Launch Year',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            suffixIcon: const Icon(Icons.calendar_today),
                          ),
                          validator: (value) =>
                              null, // Optional: no validation needed
                        ),
                      ),
                    ),
                  ]),
                  const SizedBox(height: 15),
                  _buildFormRow([
                    buildDropdownField<String>(
                        label: 'Segment',
                        value: _segment,
                        items: segments,
                        onChanged: (v) => setState(() => _segment = v),
                        getLabel: (v) => v,
                        isRequired: false),
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
                  ]),
                  const SizedBox(height: 15),
                  BlocBuilder<VehicleManufacturerBloc,
                      VehicleManufacturerState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        dropdownLoaded: (manufacturers) {
                          return _buildFormRow([
                            buildDropdownField<VehicleManufacturer>(
                              label: 'Manufacturer',
                              value: _selectedManufacturer,
                              items: manufacturers,
                              onChanged: (v) =>
                                  setState(() => _selectedManufacturer = v),
                              getLabel: (m) => m.name,
                            ),
                            buildDropdownField<String>(
                              label: 'Vehicle Type',
                              value: _vehicleType,
                              items: vehicleTypes,
                              onChanged: (v) =>
                                  setState(() => _vehicleType = v),
                              getLabel: (v) => v,
                            ),
                          ]);
                        },
                        loading: () =>
                            const Center(child: CircularProgressIndicator()),
                        orElse: () =>
                            const Text('Failed to load manufacturers'),
                      );
                    },
                  ),

                  const SizedBox(height: 15),

                  BlocBuilder<VehicleModelBloc, VehicleModelState>(
                    // Only rebuild this part for the states we care about
                    buildWhen: (prev, curr) => curr.maybeWhen(
                      loading: () => true,
                      optionsLoaded: (_, __) => true,
                      error: (_) => true,
                      orElse: () => false,
                    ),
                    builder: (context, state) {
                      return state.maybeWhen(
                        loading: () =>
                            const Center(child: CircularProgressIndicator()),
                        optionsLoaded: (fuelOpts, transOpts) {
                          return _buildFormRow([
                            _buildMultiSelectChips<FuelType>(
                              label: 'Fuel Types',
                              options: fuelOpts,
                              selectedValues: _selectedFuelTypeKeys,
                              displayLabel: (f) => f.displayName ?? f.name,
                              valueKey: (f) => f.name,
                              onChanged: (list) => setState(() {
                                _selectedFuelTypeKeys
                                  ..clear()
                                  ..addAll(list);
                              }),
                            ),
                            _buildMultiSelectChips<TransmissionType>(
                              label: 'Transmission Types',
                              options: transOpts,
                              selectedValues: _selectedTransmissionKeys,
                              displayLabel: (t) => t.displayName ?? t.name,
                              valueKey: (t) => t.name,
                              onChanged: (list) => setState(() {
                                _selectedTransmissionKeys
                                  ..clear()
                                  ..addAll(list);
                              }),
                            ),
                          ]);
                        },
                        error: (msg) => Text(msg,
                            style: const TextStyle(color: Colors.red)),
                        orElse: () => const SizedBox.shrink(),
                      );
                    },
                  ),

                  // _buildFormRow([
                  // buildDropdownField<String>(
                  //   label: 'Body Type',
                  //   value: _bodyType,
                  //   items: bodyTypes,
                  //   onChanged: (v) => setState(() => _bodyType = v),
                  //   getLabel: (v) => v,
                  // ),
                  // buildDropdownField<String>(
                  //   label: 'Segment',
                  //   value: _segment,
                  //   items: segments,
                  //   onChanged: (v) => setState(() => _segment = v),
                  //   getLabel: (v) => v,
                  // ),
                  // ]),

                  // const SizedBox(height: 15),
                  // _buildFormRow([
                  //   _buildMultiSelectField(
                  //     label: 'Fuel Types',
                  //     options: fuelTypeOptions,
                  //     selectedValues: _selectedFuelTypes,
                  //     onChanged: (updatedList) {
                  //       setState(() {
                  //         _selectedFuelTypes
                  //           ..clear()
                  //           ..addAll(updatedList);
                  //       });
                  //     },
                  //   ),
                  //   _buildMultiSelectField(
                  //     label: 'Transmission Types',
                  //     options: transmissionTypeOptions,
                  //     selectedValues: _selectedTransmissionTypes,
                  //     onChanged: (updatedList) {
                  //       setState(() {
                  //         _selectedTransmissionTypes
                  //           ..clear()
                  //           ..addAll(updatedList);
                  //       });
                  //     },
                  //   ),
                  // ]),
                  // const SizedBox(height: 20),
                  // CheckboxListTile(
                  //   title: const Text("Is Commercial Vehicle?"),
                  //   value: _isCommercial,
                  //   onChanged: (val) =>
                  //       setState(() => _isCommercial = val ?? false),
                  //   controlAffinity: ListTileControlAffinity.leading,
                  // ),
                  // if (_isCommercial) ...[
                  //   const SizedBox(height: 15),
                  //   _buildFormRow([
                  //     buildDropdownField<String>(
                  //       label: 'Commercial Vehicle Type',
                  //       value: _commercialVehicleType,
                  //       items: commercialVehicleTypes,
                  //       onChanged: (v) =>
                  //           setState(() => _commercialVehicleType = v),
                  //       getLabel: (v) => v,
                  //     ),
                  //     buildDropdownField<String>(
                  //       label: 'Commercial Body Type',
                  //       value: _commercialBodyType,
                  //       items: commercialBodyTypes,
                  //       onChanged: (v) =>
                  //           setState(() => _commercialBodyType = v),
                  //       getLabel: (v) => v,
                  //     ),
                  //   ]),
                  //   const SizedBox(height: 15),
                  //   _buildFormRow([
                  //     _buildFormField(
                  //         'Payload Capacity', '', (v) => _payloadCapacity = v),
                  //     TextFormField(
                  //       initialValue: "kg",
                  //       enabled: false,
                  //       decoration: InputDecoration(
                  //         labelText: 'Payload Unit',
                  //         border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(10)),
                  //       ),
                  //     )
                  //   ]),
                  //   const SizedBox(height: 15),
                  //   _buildFormRow([
                  //     _buildFormField('Axle Count', '', (v) => _axleCount = v),
                  //     _buildFormField(
                  //         'Seating Capacity', '', (v) => _seatingCapacity = v),
                  //   ]),
                  // ],
                  const SizedBox(height: 15),
                  _buildImagePickerPreview(),
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
                      onPressed:
                          isLoading ? null : () => addVehicleModel(context),
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
                              "Add Vehicle Model",
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
    Function(String?) onSaved, {
    bool isRequired = true,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      validator: (value) {
        if (isRequired && (value == null || value.isEmpty)) {
          return "$label is required";
        }
        return null;
      },
      onSaved: onSaved,
    );
  }

  Widget buildDropdownField<T>({
    required String label,
    required T? value,
    required List<T> items,
    required void Function(T?) onChanged,
    required String Function(T) getLabel,
    bool isRequired = true,
  }) {
    return DropdownButtonFormField<T>(
      value: value,
      items: items
          .map((item) => DropdownMenuItem<T>(
                value: item,
                child: Text(getLabel(item)),
              ))
          .toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      validator:
          isRequired && (value == null) ? (_) => '$label is required' : null,
    );
  }

  // Widget _buildMultiSelectField({
  //   required String label,
  //   required Map<String, String> options, // key: label, value: backend
  //   required List<String> selectedValues,
  //   required void Function(List<String>) onChanged,
  // }) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 8),
  //     child: InputDecorator(
  //       decoration: InputDecoration(
  //         labelText: label,
  //         border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
  //         contentPadding: const EdgeInsets.all(10),
  //       ),
  //       child: Wrap(
  //         spacing: 10,
  //         runSpacing: 10,
  //         children: options.entries.map((entry) {
  //           final label = entry.key;
  //           final value = entry.value;
  //           final isSelected = selectedValues.contains(value);
  //           return FilterChip(
  //             label: Text(label),
  //             selected: isSelected,
  //             onSelected: (selected) {
  //               final updated = List<String>.from(selectedValues);
  //               if (selected) {
  //                 updated.add(value);
  //               } else {
  //                 updated.remove(value);
  //               }
  //               onChanged(updated);
  //             },
  //           );
  //         }).toList(),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildImagePickerPreview() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: [
          // Image previews
          ..._selectedImages.map((file) {
            return Stack(
              children: [
                InkWell(
                  onTap: _pickImages,
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: MemoryImage(file.bytes!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedImages.remove(file);
                      });
                    },
                    child: const CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.black54,
                      child: Icon(Icons.close, color: Colors.white, size: 16),
                    ),
                  ),
                ),
              ],
            );
          }),

          // Add image box
          GestureDetector(
            onTap: _pickImages,
            child: Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[200],
              ),
              child: const Center(child: Icon(Icons.add_a_photo)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMultiSelectChips<T>({
    required String label,
    required List<T> options,
    required List<String> selectedValues, // stores keys
    required String Function(T) displayLabel, // e.g., (FuelType f) => f.name
    required String Function(T) valueKey, // e.g., (FuelType f) => f.key
    required void Function(List<String>) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          contentPadding: const EdgeInsets.all(10),
        ),
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          children: options.map((opt) {
            final key = valueKey(opt);
            final selected = selectedValues.contains(key);
            return FilterChip(
              label: Text(displayLabel(opt)),
              selected: selected,
              onSelected: (s) {
                final updated = List<String>.from(selectedValues);
                if (s) {
                  if (!updated.contains(key)) updated.add(key);
                } else {
                  updated.remove(key);
                }
                onChanged(updated);
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
