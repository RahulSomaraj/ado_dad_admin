import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/features/vehicle_variant/bloc/bloc/vehicle_variant_bloc.dart';
import 'package:ado_dad_admin/models/vehicle_model/vehicle_model.dart';
import 'package:ado_dad_admin/models/vehicle_variant/variant_model.dart'
    as variant;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VehicleVariantAddSafe extends StatefulWidget {
  final VehicleModel vehicleModel;
  const VehicleVariantAddSafe({super.key, required this.vehicleModel});

  @override
  State<VehicleVariantAddSafe> createState() => _VehicleVariantAddSafeState();
}

class _VehicleVariantAddSafeState extends State<VehicleVariantAddSafe> {
  final _formKey = GlobalKey<FormState>();

  // TextEditingControllers for all text fields
  final _nameController = TextEditingController();
  final _displayNameController = TextEditingController();
  final _featurePackageController = TextEditingController();
  final _seatingCapacityController = TextEditingController();
  final _engineCapacityController = TextEditingController();
  final _maxPowerController = TextEditingController();
  final _maxTorqueController = TextEditingController();
  final _mileageController = TextEditingController();
  final _priceController = TextEditingController();
  final _vehicleModelController = TextEditingController();

  final List<variant.FuelType> fuelTypeOptions = [
    variant.FuelType(
      id: "507f1f77bcf86cd799439012",
      name: "Petrol",
      displayName: "Petrol",
    ),
  ];

  final List<variant.TransmissionType> transmissionTypeOptions = [
    variant.TransmissionType(
      id: "507f1f77bcf86cd799439013",
      name: "Manual",
      displayName: "Manual",
    ),
  ];

  variant.FuelType? _selectedFuelType;
  variant.TransmissionType? _selectedTransmissionType;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    // Initialize the vehicle model controller
    _vehicleModelController.text = widget.vehicleModel.displayName;
  }

  @override
  void dispose() {
    // Dispose all controllers
    _nameController.dispose();
    _displayNameController.dispose();
    _featurePackageController.dispose();
    _seatingCapacityController.dispose();
    _engineCapacityController.dispose();
    _maxPowerController.dispose();
    _maxTorqueController.dispose();
    _mileageController.dispose();
    _priceController.dispose();
    _vehicleModelController.dispose();
    super.dispose();
  }

  // void _submitForm() {
  //   if (!_isSubmitting && (_formKey.currentState?.validate() ?? false)) {
  //     setState(() {
  //       _isSubmitting = true;
  //     });

  //     final addedvariant = variant.VariantModel(
  //       name: _nameController.text,
  //       displayName: _displayNameController.text,
  //       vehicleModel: variant.VehicleModel(
  //         id: widget.vehicleModel.id!,
  //         name: widget.vehicleModel.name,
  //         displayName: widget.vehicleModel.displayName,
  //       ),
  //       fuelType: _selectedFuelType,
  //       transmissionType: _selectedTransmissionType,
  //       featurePackage: _featurePackageController.text,
  //       engineSpecs: variant.EngineSpecs(
  //         capacity: int.tryParse(_engineCapacityController.text) ?? 0,
  //         maxPower: int.tryParse(_maxPowerController.text) ?? 0,
  //         maxTorque: int.tryParse(_maxTorqueController.text) ?? 0,
  //       ),
  //       performanceSpecs: variant.PerformanceSpecs(
  //         mileage: double.tryParse(_mileageController.text) ?? 0,
  //       ),
  //       seatingCapacity: int.tryParse(_seatingCapacityController.text),
  //       price: int.tryParse(_priceController.text),
  //       isActive: true,
  //       isDeleted: false,
  //       createdAt: DateTime.now(),
  //       updatedAt: DateTime.now(),
  //     );

  //     context
  //         .read<VehicleVariantBloc>()
  //         .add(VehicleVariantEvent.createVariant(variant: addedvariant));
  //   }
  // }

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
                  // Use a longer delay to ensure dialog is fully dismissed
                  Future.delayed(const Duration(milliseconds: 100), () {
                    if (mounted) {
                      context.go('/vehicle-models');
                    }
                  });
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
    return BlocListener<VehicleVariantBloc, VehicleVariantState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (message) {
            if (mounted) {
              setState(() {
                _isSubmitting = false;
              });
              // Use post-frame callback to ensure safe dialog showing
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) {
                  _showSuccessPopup(context, message);
                }
              });
            }
          },
          error: (message) {
            if (mounted) {
              setState(() {
                _isSubmitting = false;
              });
              // Use post-frame callback for error handling
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error: $message')),
                  );
                }
              });
            }
          },
          orElse: () {},
        );
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildHeaderSection(),
              const SizedBox(height: 24),
              _buildForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Container(
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
            "Add Vehicle Variant",
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 800),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: AppColors.primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextField("Name", _nameController),
                const SizedBox(height: 16),
                _buildTextField("Display Name", _displayNameController),
                const SizedBox(height: 16),
                _buildTextField("Feature Package", _featurePackageController),
                const SizedBox(height: 16),
                _buildDropdownField<variant.FuelType>(
                  label: 'Fuel Type',
                  value: _selectedFuelType,
                  items: fuelTypeOptions,
                  onChanged: (val) {
                    if (mounted) {
                      setState(() => _selectedFuelType = val);
                    }
                  },
                  getLabel: (f) => f.displayName,
                ),
                const SizedBox(height: 16),
                _buildDropdownField<variant.TransmissionType>(
                  label: 'Transmission Type',
                  value: _selectedTransmissionType,
                  items: transmissionTypeOptions,
                  onChanged: (val) {
                    if (mounted) {
                      setState(() => _selectedTransmissionType = val);
                    }
                  },
                  getLabel: (t) => t.displayName,
                ),
                const SizedBox(height: 16),
                _buildTextField("Seating Capacity", _seatingCapacityController,
                    keyboardType: TextInputType.number),
                const SizedBox(height: 16),
                _buildTextField(
                    "Engine Capacity (cc)", _engineCapacityController,
                    keyboardType: TextInputType.number),
                const SizedBox(height: 16),
                _buildTextField("Max Power (hp)", _maxPowerController,
                    keyboardType: TextInputType.number),
                const SizedBox(height: 16),
                _buildTextField("Max Torque (Nm)", _maxTorqueController,
                    keyboardType: TextInputType.number),
                const SizedBox(height: 16),
                _buildTextField("Mileage (kmpl)", _mileageController,
                    keyboardType: TextInputType.number),
                const SizedBox(height: 16),
                _buildTextField("Price (₹)", _priceController,
                    keyboardType: TextInputType.number),
                const SizedBox(height: 16),
                _buildTextField("Vehicle Model", _vehicleModelController,
                    readOnly: true),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    // onPressed: _isSubmitting ? null : _submitForm,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: _isSubmitting
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text(
                            "Create Variant",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    TextInputType? keyboardType,
    bool readOnly = false,
  }) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      validator: (value) =>
          value == null || value.isEmpty ? '$label is required' : null,
    );
  }

  Widget _buildDropdownField<T>({
    required String label,
    required T? value,
    required List<T> items,
    required ValueChanged<T?> onChanged,
    required String Function(T) getLabel,
  }) {
    final T? safeValue =
        (value != null && items.contains(value)) ? value as T : null;
    return DropdownButtonFormField<T>(
      value: safeValue,
      isExpanded: true,
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
      validator: (val) => val == null ? '$label is required' : null,
    );
  }
}
