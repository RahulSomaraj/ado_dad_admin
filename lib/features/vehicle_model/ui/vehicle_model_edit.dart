// features/vehicle_model/ui/vehicle_model_edit.dart

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

class VehicleModelEdit extends StatefulWidget {
  final VehicleModel model; // pass the object you want to edit
  const VehicleModelEdit({super.key, required this.model});

  @override
  State<VehicleModelEdit> createState() => _VehicleModelEditState();
}

class _VehicleModelEditState extends State<VehicleModelEdit> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isSubmitting = false;
  bool _hasShownSuccessDialog = false; // Add flag to prevent multiple popups

  late String _name;
  late String _displayName;
  String? _description;
  String? _launchYear;
  bool _isActive = true;
  VehicleManufacturer? _manufacturer;
  String? _vehicleType;
  String? _segment;

  // images
  late List<String> _existingImageUrls; // remaining existing urls
  final List<PlatformFile> _newImages = []; // newly added files (to upload)

  final List<String> _selectedFuelTypeKeys = [];
  final List<String> _selectedTransmissionKeys = [];

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
  final segments = ['A', 'B', 'C', 'D', 'E'];

  @override
  void initState() {
    super.initState();
    final m = widget.model;
    _name = m.name;
    _displayName = m.displayName;
    _description = m.description;
    _launchYear = m.launchYear?.toString();
    _isActive = m.isActive ?? true;
    _manufacturer = m.manufacturer;
    _vehicleType = m.vehicleType.isNotEmpty ? m.vehicleType : null;
    _segment = m.segment;

    _existingImageUrls = List<String>.from(m.images ?? const []);
    _selectedFuelTypeKeys
      ..clear()
      ..addAll(m.availableFuelTypes ?? const []);
    _selectedTransmissionKeys
      ..clear()
      ..addAll(m.availableTransmissionTypes ?? const []);

    // dropdown data
    context
        .read<VehicleManufacturerBloc>()
        .add(FetchAllManufacturersForDropdown());
    context
        .read<VehicleModelBloc>()
        .add(const VehicleModelEvent.fetchOptions());
  }

  @override
  void dispose() {
    // Don't access bloc context in dispose - it's unsafe
    super.dispose();
  }

  Future<void> _pickNewImages() async {
    final res = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.image,
      withData: true,
    );
    if (res != null && mounted) {
      setState(() {
        _newImages.addAll(res.files.where((f) => f.bytes != null));
      });
    }
  }

  Future<void> _selectLaunchYear(BuildContext context) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year),
      firstDate: DateTime(1700),
      lastDate: DateTime(now.year + 1),
      initialDatePickerMode: DatePickerMode.year,
      helpText: 'Select Launch Year',
    );
    if (picked != null && mounted) {
      setState(() => _launchYear = picked.year.toString());
    }
  }

  void _save() {
    // if (!(_formKey.currentState?.validate() ?? false)) return;
    // _formKey.currentState?.save();
    if (_isSubmitting) return; // avoid double taps
    final form = _formKey.currentState;
    if (form == null) return;
    if (!form.validate()) return;
    form.save();

    if (_manufacturer == null || (_vehicleType ?? '').isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please select Manufacturer and Vehicle Type')),
      );
      return;
    }

    final base = widget.model.copyWith(
      name: _name,
      displayName: _displayName,
      manufacturer: _manufacturer!,
      vehicleType: _vehicleType ?? '',
      description: (_description != null && _description!.isNotEmpty)
          ? _description
          : null,
      launchYear: (_launchYear != null && _launchYear!.isNotEmpty)
          ? int.tryParse(_launchYear!)
          : null,
      segment: _segment,
      isActive: _isActive,
      // images are set in bloc after merging (keep + newly uploaded)
      availableFuelTypes:
          _selectedFuelTypeKeys.isNotEmpty ? _selectedFuelTypeKeys : null,
      availableTransmissionTypes: _selectedTransmissionKeys.isNotEmpty
          ? _selectedTransmissionKeys
          : null,
    );

    setState(() => _isSubmitting = true);

    // Reset the success dialog flag when submitting
    _hasShownSuccessDialog = false;

    context.read<VehicleModelBloc>().add(
          VehicleModelEvent.updateVehicleModel(
            model: base,
            keepImageUrls: _existingImageUrls, // <— remain
            newRawImages: _newImages, // <— to upload
          ),
        );
  }

  void _showSuccessDialog(BuildContext successcontext, String message) {
    if (!mounted) return;

    showDialog(
      context: successcontext,
      barrierDismissible: false,
      builder: (dialogCtx) => AlertDialog(
        title: const Text('Success'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              // ✅ Pop the dialog using its own context
              Navigator.of(dialogCtx).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
    // After the dialog is closed, go to the list
    if (mounted) {
      context.go('/vehicle-models');
    }
  }

  void _showErrorSnack(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Update failed: $msg')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VehicleModelBloc, VehicleModelState>(
      listenWhen: (prev, curr) {
        // Only listen when we're submitting and the state changes to updated or error
        // AND we haven't shown the dialog yet
        return _isSubmitting &&
            !_hasShownSuccessDialog &&
            curr.maybeWhen(
              updated: () => true,
              error: (_) => true,
              orElse: () => false,
            );
      },
      listener: (context, state) {
        setState(() => _isSubmitting = false);
        state.maybeWhen(
          updated: () async {
            if (!_hasShownSuccessDialog && mounted) {
              _hasShownSuccessDialog = true;
              _showSuccessDialog(
                  context, "Vehicle Model has been updated successfully.");
            }
          },
          error: (msg) => _showErrorSnack(msg), // Show error snack on failure
          orElse: () {},
        );
      },
      buildWhen: (p, c) => c.maybeWhen(
        loading: () => true,
        optionsLoaded: (_, __) => true,
        error: (_) => true,
        orElse: () => false,
      ),
      builder: (context, state) {
        final isLoading =
            state.maybeWhen(loading: () => true, orElse: () => false);

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildHeader(),
                const SizedBox(height: 30),
                _buildForm(isLoading, state),
                const SizedBox(height: 50), // Add bottom padding
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader() {
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
              onPressed: () => context.pop(),
            ),
            const SizedBox(width: 8),
            const Text(
              "Edit Vehicle Model",
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm(bool isLoading, VehicleModelState state) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600 && screenWidth <= 900;

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: isTablet ? screenWidth - 32 : 900,
        ),
        child: Card(
          elevation: 5,
          color: AppColors.primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: EdgeInsets.all(isTablet ? 16.0 : 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  _row(
                    _text('Model Name',
                        initial: _name, onSaved: (v) => _name = v ?? ''),
                    _text('Display Name',
                        initial: _displayName,
                        onSaved: (v) => _displayName = v ?? ''),
                  ),
                  const SizedBox(height: 15),
                  _row(
                    _text('Description',
                        initial: _description,
                        onSaved: (v) => _description = v,
                        required: false),
                    GestureDetector(
                      onTap: () => _selectLaunchYear(context),
                      child: AbsorbPointer(
                        child: TextFormField(
                          controller:
                              TextEditingController(text: _launchYear ?? ''),
                          decoration: InputDecoration(
                            labelText: 'Launch Year',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            suffixIcon: const Icon(Icons.calendar_today),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  _row(
                    _segmentDropdown(),
                    CheckboxListTile(
                      value: _isActive,
                      onChanged: (v) => setState(() => _isActive = v ?? true),
                      title: const Text('Is Active'),
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                  const SizedBox(height: 15),

                  BlocBuilder<VehicleManufacturerBloc,
                      VehicleManufacturerState>(
                    builder: (context, st) {
                      return st.maybeWhen(
                        dropdownLoaded: (mans) => _row(
                          _dropdown<VehicleManufacturer>(
                            label: 'Manufacturer',
                            value: _manufacturer,
                            items: mans,
                            getLabel: (m) => m.name,
                            onChanged: (v) => setState(() => _manufacturer = v),
                          ),
                          _dropdown<String>(
                            label: 'Vehicle Type',
                            value: _vehicleType,
                            items: vehicleTypes,
                            getLabel: (v) => v,
                            onChanged: (v) => setState(() => _vehicleType = v),
                          ),
                        ),
                        loading: () =>
                            const Center(child: CircularProgressIndicator()),
                        orElse: () =>
                            const Text('Failed to load manufacturers'),
                      );
                    },
                  ),

                  const SizedBox(height: 15),

                  BlocBuilder<VehicleModelBloc, VehicleModelState>(
                    buildWhen: (p, c) => c.maybeWhen(
                      loading: () => true,
                      optionsLoaded: (_, __) => true,
                      error: (_) => true,
                      orElse: () => false,
                    ),
                    builder: (context, st) {
                      return st.maybeWhen(
                        loading: () =>
                            const Center(child: CircularProgressIndicator()),
                        optionsLoaded: (fuelOpts, transOpts) => _row(
                          _chips<FuelType>(
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
                          _chips<TransmissionType>(
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
                        ),
                        error: (msg) => Text(msg,
                            style: const TextStyle(color: Colors.red)),
                        orElse: () => const SizedBox.shrink(),
                      );
                    },
                  ),

                  const SizedBox(height: 15),
                  _imageEditor(), // existing + new picker
                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : _save,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: isLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                  strokeWidth: 2, color: Colors.white),
                            )
                          : const Text('Update Vehicle Model',
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

  // ————— helpers —————

  Widget _row(Widget left, Widget right) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600 && screenWidth <= 900;

    if (isTablet) {
      return Column(
        children: [
          left,
          const SizedBox(height: 15),
          right,
        ],
      );
    }

    return Row(
      children: [
        Expanded(child: left),
        const SizedBox(width: 16),
        Expanded(child: right)
      ],
    );
  }

  Widget _text(String label,
      {String? initial,
      FormFieldSetter<String?>? onSaved,
      bool required = true}) {
    return TextFormField(
      initialValue: initial ?? '',
      decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      validator: (v) =>
          (required && (v == null || v.isEmpty)) ? '$label is required' : null,
      onSaved: onSaved,
    );
  }

  Widget _dropdown<T>({
    required String label,
    required T? value,
    required List<T> items,
    required String Function(T) getLabel,
    required void Function(T?) onChanged,
    bool required = true,
  }) {
    return DropdownButtonFormField<T>(
      value: value,
      items: items
          .map((e) => DropdownMenuItem<T>(value: e, child: Text(getLabel(e))))
          .toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      validator:
          required && (value == null) ? (_) => '$label is required' : null,
    );
  }

  Widget _segmentDropdown() {
    return _dropdown<String>(
      label: 'Segment',
      value: _segment,
      items: segments,
      getLabel: (v) => v,
      onChanged: (v) => setState(() => _segment = v),
      required: false,
    );
  }

  Widget _chips<T>({
    required String label,
    required List<T> options,
    required List<String> selectedValues,
    required String Function(T) displayLabel,
    required String Function(T) valueKey,
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

  Widget _imageEditor() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Images'),
        const SizedBox(height: 8),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            // existing images (removable)
            ..._existingImageUrls.map((url) => Stack(
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: NetworkImage(url), fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () =>
                            setState(() => _existingImageUrls.remove(url)),
                        child: const CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.black54,
                          child:
                              Icon(Icons.close, color: Colors.white, size: 16),
                        ),
                      ),
                    ),
                  ],
                )),

            // new images (preview from memory)
            ..._newImages.map((file) => Stack(
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: MemoryImage(file.bytes!), fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () => setState(() => _newImages.remove(file)),
                        child: const CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.black54,
                          child:
                              Icon(Icons.close, color: Colors.white, size: 16),
                        ),
                      ),
                    ),
                  ],
                )),

            // add image
            GestureDetector(
              onTap: _pickNewImages,
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
      ],
    );
  }
}
