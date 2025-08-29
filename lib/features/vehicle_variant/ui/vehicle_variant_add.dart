import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/features/vehicle_variant/bloc/bloc/vehicle_variant_bloc.dart';
import 'package:ado_dad_admin/models/vehicle_model/vehicle_model.dart';
// import 'package:ado_dad_admin/models/vehicle_model.dart' as shared_model;
import 'package:ado_dad_admin/models/vehicle_variant/variant_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VehicleVariantAdd extends StatefulWidget {
  final VehicleModel vehicleModel;
  const VehicleVariantAdd({super.key, required this.vehicleModel});

  @override
  State<VehicleVariantAdd> createState() => _VehicleVariantAddState();
}

class _VehicleVariantAddState extends State<VehicleVariantAdd> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _displayName = '';
  String _featurePackage = '';
  int? _price;
  int? _seatingCapacity;
  int? _engineCapacity;
  int? _maxPower;
  int? _maxTorque;
  double? _mileage;

  // final List<String> fuelTypes = ['Petrol', 'Diesel', 'Electric'];
  // final List<String> transmissionTypes = ['Manual', 'Automatic'];

  final List<FuelType> fuelTypeOptions = [
    FuelType(
      id: "507f1f77bcf86cd799439012",
      name: "Petrol",
      displayName: "Petrol",
    ),
  ];

  final List<TransmissionType> transmissionTypeOptions = [
    TransmissionType(
      id: "507f1f77bcf86cd799439013",
      name: "Manual",
      displayName: "Manual",
    ),
  ];

  FuelType? _selectedFuelType;
  TransmissionType? _selectedTransmissionType;

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      final addedvariant = VariantModel(
        name: _name,
        displayName: _displayName,
        vehicleModel: widget.vehicleModel, // ✅ Good now
        fuelType: _selectedFuelType,
        transmissionType: _selectedTransmissionType,
        featurePackage: _featurePackage,
        engineSpecs: EngineSpecs(
          capacity: _engineCapacity ?? 0,
          maxPower: _maxPower ?? 0,
          maxTorque: _maxTorque ?? 0,
        ),
        performanceSpecs: PerformanceSpecs(
          mileage: _mileage ?? 0,
        ),
        seatingCapacity: _seatingCapacity,
        price: _price,
        isActive: true,
        // isDeleted: false,
        // createdAt: DateTime.now(),
        // updatedAt: DateTime.now(),
      );

      // Dispatch event via BLoC
      // context
      //     .read<VehicleVariantBloc>()
      //     .add(VehicleVariantEvent.createVariant(variant: addedvariant));

      print("🚀 Variant to Submit: ${addedvariant.toPostJson()}");

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        context.read<VehicleVariantBloc>().add(
              VehicleVariantEvent.createVariant(variant: addedvariant),
            );
      });

      // _showSuccessPopup(
      //     context, "Vehicle Variant has been added successfully.");
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
                // context.pop();
                Navigator.of(context).pop(); // Close dialog
                // Navigator.of(context).pop(); // Pop AddVariant page

                WidgetsBinding.instance.addPostFrameCallback((_) {
                  context.go('/vehicle-models', extra: widget.vehicleModel);
                  // context.push('/view-vehicle_model',
                  //     extra: widget.vehicleModel);
                });
                // WidgetsBinding.instance.addPostFrameCallback((_) {
                //   if (!mounted) return;

                //   if (widget.vehicleModel.id != null) {
                //     context.go('/view-vehicle_model',
                //         extra: widget.vehicleModel);
                //   } else {
                //     print(
                //         "⚠️ Skipping navigation: widget.vehicleModel is null or invalid");
                //   }
                // });
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
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) {
                  _showSuccessPopup(context, message);
                }
              });
            }
            ;
          },
          error: (message) {
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: $message')),
              );
            }
          },
          orElse: () {},
        );
      },
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
    );
  }

  Widget _buildHeaderSection() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                "Add Vehicle Variant",
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // const Spacer(),
            // Text(
            //   "Model: ${widget.vehicleModel.displayName}",
            //   style: const TextStyle(
            //     color: AppColors.blackColor,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 800),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: AppColors.primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildRow([
                    _buildTextField("Name", (v) => _name = v!),
                    _buildTextField("Display Name", (v) => _displayName = v!),
                  ]),
                  const SizedBox(height: 16),
                  _buildRow([
                    _buildTextField(
                        "Feature Package", (v) => _featurePackage = v!),
                    _buildDropdownField<FuelType>(
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
                  ]),
                  const SizedBox(height: 16),
                  _buildRow([
                    _buildDropdownField<TransmissionType>(
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
                    _buildTextField("Seating Capacity",
                        (v) => _seatingCapacity = int.tryParse(v!),
                        keyboardType: TextInputType.number),
                  ]),
                  const SizedBox(height: 16),
                  _buildRow([
                    _buildTextField("Engine Capacity (cc)",
                        (v) => _engineCapacity = int.tryParse(v!),
                        keyboardType: TextInputType.number),
                    _buildTextField(
                        "Max Power (hp)", (v) => _maxPower = int.tryParse(v!),
                        keyboardType: TextInputType.number),
                  ]),
                  const SizedBox(height: 16),
                  _buildRow([
                    _buildTextField(
                        "Max Torque (Nm)", (v) => _maxTorque = int.tryParse(v!),
                        keyboardType: TextInputType.number),
                    _buildTextField(
                        "Mileage (kmpl)", (v) => _mileage = double.tryParse(v!),
                        keyboardType: TextInputType.number),
                  ]),
                  const SizedBox(height: 16),
                  // _buildRow([
                  //   _buildTextField(
                  //       "Price (₹)", (v) => _price = int.tryParse(v!),
                  //       keyboardType: TextInputType.number),
                  //   TextFormField(
                  //     initialValue: widget.vehicleModel.displayName,
                  //     readOnly: true,
                  //     decoration: InputDecoration(
                  //       labelText: 'Vehicle Model',
                  //       border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(10)),
                  //     ),
                  //   )
                  // ]),
                  _buildTextField(
                      "Price (₹)", (v) => _price = int.tryParse(v!)),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text("Create Variant",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget _buildForm() {
  //   return Center(
  //     child: ConstrainedBox(
  //       constraints: const BoxConstraints(maxWidth: 800),
  //       child: Card(
  //         elevation: 5,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(12),
  //         ),
  //         color: AppColors.primaryColor,
  //         child: Padding(
  //           padding: const EdgeInsets.all(20),
  //           child: Form(
  //             key: _formKey,
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 // Name and Display Name
  //                 _buildTextField("Name", (v) => _name = v!),
  //                 const SizedBox(height: 16),
  //                 _buildTextField("Display Name", (v) => _displayName = v!),
  //                 const SizedBox(height: 16),

  //                 // Feature Package and Fuel Type
  //                 _buildTextField(
  //                     "Feature Package", (v) => _featurePackage = v!),
  //                 const SizedBox(height: 16),
  //                 _buildDropdownField<variant.FuelType>(
  //                   label: 'Fuel Type',
  //                   value: _selectedFuelType,
  //                   items: fuelTypeOptions,
  //                   onChanged: (val) {
  //                     if (mounted) {
  //                       setState(() => _selectedFuelType = val);
  //                     }
  //                   },
  //                   getLabel: (f) => f.displayName,
  //                 ),
  //                 const SizedBox(height: 16),

  //                 // Transmission Type and Seating Capacity
  //                 _buildDropdownField<variant.TransmissionType>(
  //                   label: 'Transmission Type',
  //                   value: _selectedTransmissionType,
  //                   items: transmissionTypeOptions,
  //                   onChanged: (val) {
  //                     if (mounted) {
  //                       setState(() => _selectedTransmissionType = val);
  //                     }
  //                   },
  //                   getLabel: (t) => t.displayName,
  //                 ),
  //                 const SizedBox(height: 16),
  //                 _buildTextField("Seating Capacity",
  //                     (v) => _seatingCapacity = int.tryParse(v!),
  //                     keyboardType: TextInputType.number),
  //                 const SizedBox(height: 16),

  //                 // Engine Capacity and Max Power
  //                 _buildTextField("Engine Capacity (cc)",
  //                     (v) => _engineCapacity = int.tryParse(v!),
  //                     keyboardType: TextInputType.number),
  //                 const SizedBox(height: 16),
  //                 _buildTextField(
  //                     "Max Power (hp)", (v) => _maxPower = int.tryParse(v!),
  //                     keyboardType: TextInputType.number),
  //                 const SizedBox(height: 16),

  //                 // Max Torque and Mileage
  //                 _buildTextField(
  //                     "Max Torque (Nm)", (v) => _maxTorque = int.tryParse(v!),
  //                     keyboardType: TextInputType.number),
  //                 const SizedBox(height: 16),
  //                 _buildTextField(
  //                     "Mileage (kmpl)", (v) => _mileage = double.tryParse(v!),
  //                     keyboardType: TextInputType.number),
  //                 const SizedBox(height: 16),

  //                 // Price and Vehicle Model (read-only)
  //                 _buildTextField("Price (₹)", (v) => _price = int.tryParse(v!),
  //                     keyboardType: TextInputType.number),
  //                 const SizedBox(height: 16),
  //                 TextFormField(
  //                   initialValue: widget.vehicleModel.displayName,
  //                   readOnly: true,
  //                   decoration: const InputDecoration(
  //                     labelText: 'Vehicle Model',
  //                     border: OutlineInputBorder(),
  //                   ),
  //                 ),
  //                 const SizedBox(height: 24),

  //                 // Submit Button
  //                 SizedBox(
  //                   width: double.infinity,
  //                   child: ElevatedButton(
  //                     onPressed: _submitForm,
  //                     style: ElevatedButton.styleFrom(
  //                       padding: const EdgeInsets.symmetric(vertical: 12),
  //                       backgroundColor: Colors.black,
  //                       foregroundColor: Colors.white,
  //                       shape: RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.circular(8),
  //                       ),
  //                     ),
  //                     child: const Text("Create Variant",
  //                         style: TextStyle(
  //                           fontSize: 16,
  //                           fontWeight: FontWeight.bold,
  //                         )),
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildRow(List<Widget> children) {
    return Row(
      children: [
        Expanded(child: children[0]),
        const SizedBox(width: 16),
        Expanded(child: children[1]),
      ],
    );
  }

  Widget _buildTextField(
    String label,
    FormFieldSetter<String> onSaved, {
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      keyboardType: keyboardType,
      validator: (value) =>
          value == null || value.isEmpty ? '$label is required' : null,
      onSaved: onSaved,
    );
  }

  Widget _buildDropdownField<T>({
    required String label,
    required T? value,
    required List<T> items,
    required ValueChanged<T?> onChanged,
    required String Function(T) getLabel,
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
      validator: (val) => val == null ? '$label is required' : null,
    );
  }
}
