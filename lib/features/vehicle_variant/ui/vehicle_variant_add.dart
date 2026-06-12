import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/features/vehicle_variant/bloc/bloc/vehicle_variant_bloc.dart';
import 'package:ado_dad_admin/features/widgets/form_kit.dart';
import 'package:ado_dad_admin/models/vehicle_model/vehicle_model.dart';
// import 'package:ado_dad_admin/models/vehicle_model.dart' as shared_model;
import 'package:ado_dad_admin/models/vehicle_variant/variant_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// enum FeaturePackage {
//   base('Base'),
//   l('L'),
//   lx('LX'),
//   v('V'),
//   vx('VX'),
//   z('Z'),
//   zx('ZX'),
//   zxO('ZX(O)'),
//   zxPlus('ZX+'),
//   topEnd('Top End'),
//   premium('Premium'),
//   executive('Executive'),
//   royale('Royale');

//   const FeaturePackage(this.value);
//   final String value;
// }

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
  // FeaturePackage? _selectedFeaturePackage;
  int? _price;
  int? _seatingCapacity;
  int? _engineCapacity;
  int? _maxPower;
  int? _maxTorque;
  double? _mileage;

  List<FuelType> fuelTypeOptions = [];
  List<TransmissionType> transmissionTypeOptions = [];

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
        // featurePackage: _selectedFeaturePackage?.value,
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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<VehicleVariantBloc>().add(
              const VehicleVariantEvent.fetchOptions(),
            );
      }
    });
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
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormHeaderBar(
              breadcrumb:
                  "Variants / ${widget.vehicleModel.displayName.isNotEmpty ? widget.vehicleModel.displayName : widget.vehicleModel.name}",
              title: "Add Variant",
              onBack: () => context.pop(),
            ),
            const SizedBox(height: 16),
            _buildForm(),
          ],
        ),
      ),
    );
  }

  // ignore: unused_element
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Add Vehicle Variant",
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "Model: ${widget.vehicleModel.displayName.isNotEmpty ? widget.vehicleModel.displayName : widget.vehicleModel.name}",
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 12.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 820),
        child: Container(
          decoration: formCardDecoration(),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormHeaderStrip(
                icon: Icons.tune,
                title: "New variant",
                subtitle:
                    "For ${widget.vehicleModel.displayName.isNotEmpty ? widget.vehicleModel.displayName : widget.vehicleModel.name}",
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _sectionLabel("Basics"),
                  _buildRow([
                    _buildTextField("Name", (v) => _name = v!),
                    _buildTextField("Display Name", (v) => _displayName = v!),
                  ]),
                  const SizedBox(height: 16),
                  _buildRow([
                    // _buildDropdownField<FeaturePackage>(
                    //   label: 'Feature Package',
                    //   value: _selectedFeaturePackage,
                    //   items: FeaturePackage.values,
                    //   onChanged: (val) {
                    //     if (mounted) {
                    //       setState(() => _selectedFeaturePackage = val);
                    //     }
                    //   },
                    //   getLabel: (fp) => fp.value,
                    // ),
                    BlocBuilder<VehicleVariantBloc, VehicleVariantState>(
                      buildWhen: (prev, curr) {
                        // Only rebuild when options are being loaded or loaded, not during variant creation
                        return curr.maybeWhen(
                              optionsLoaded: (_, __) => true,
                              orElse: () => false,
                            ) ||
                            (prev.maybeWhen(
                                  optionsLoaded: (_, __) => false,
                                  orElse: () => true,
                                ) &&
                                curr.maybeWhen(
                                  loading: () => fuelTypeOptions.isEmpty,
                                  orElse: () => false,
                                ));
                      },
                      builder: (context, state) {
                        return state.maybeWhen(
                          loading: () {
                            // Only show loading if we don't have options yet
                            if (fuelTypeOptions.isEmpty) {
                              return const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            }
                            // If we have options, show them even during loading
                            return _buildDropdownField<FuelType>(
                              label: 'Fuel Type',
                              value: _selectedFuelType,
                              items: fuelTypeOptions,
                              onChanged: (val) {
                                if (mounted) {
                                  setState(() => _selectedFuelType = val);
                                }
                              },
                              getLabel: (f) => f.displayName,
                            );
                          },
                          optionsLoaded: (fuelOpts, transOpts) {
                            // Update options when loaded
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              if (mounted) {
                                setState(() {
                                  fuelTypeOptions = fuelOpts;
                                  transmissionTypeOptions = transOpts;
                                });
                              }
                            });
                            return _buildDropdownField<FuelType>(
                              label: 'Fuel Type',
                              value: _selectedFuelType,
                              items: fuelOpts,
                              onChanged: (val) {
                                if (mounted) {
                                  setState(() => _selectedFuelType = val);
                                }
                              },
                              getLabel: (f) => f.displayName,
                            );
                          },
                          error: (msg) {
                            // If we have options, show them even on error
                            if (fuelTypeOptions.isNotEmpty) {
                              return _buildDropdownField<FuelType>(
                                label: 'Fuel Type',
                                value: _selectedFuelType,
                                items: fuelTypeOptions,
                                onChanged: (val) {
                                  if (mounted) {
                                    setState(() => _selectedFuelType = val);
                                  }
                                },
                                getLabel: (f) => f.displayName,
                              );
                            }
                            return Text(
                              'Error loading options',
                              style: TextStyle(color: Colors.red, fontSize: 12),
                            );
                          },
                          orElse: () => _buildDropdownField<FuelType>(
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
                        );
                      },
                    ),
                    BlocBuilder<VehicleVariantBloc, VehicleVariantState>(
                      buildWhen: (prev, curr) {
                        // Only rebuild when options are being loaded or loaded, not during variant creation
                        return curr.maybeWhen(
                              optionsLoaded: (_, __) => true,
                              orElse: () => false,
                            ) ||
                            (prev.maybeWhen(
                                  optionsLoaded: (_, __) => false,
                                  orElse: () => true,
                                ) &&
                                curr.maybeWhen(
                                  loading: () =>
                                      transmissionTypeOptions.isEmpty,
                                  orElse: () => false,
                                ));
                      },
                      builder: (context, state) {
                        return state.maybeWhen(
                          loading: () {
                            // Only show loading if we don't have options yet
                            if (transmissionTypeOptions.isEmpty) {
                              return const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            }
                            // If we have options, show them even during loading
                            return _buildDropdownField<TransmissionType>(
                              label: 'Transmission Type',
                              value: _selectedTransmissionType,
                              items: transmissionTypeOptions,
                              onChanged: (val) {
                                if (mounted) {
                                  setState(
                                      () => _selectedTransmissionType = val);
                                }
                              },
                              getLabel: (t) => t.displayName,
                            );
                          },
                          optionsLoaded: (fuelOpts, transOpts) {
                            return _buildDropdownField<TransmissionType>(
                              label: 'Transmission Type',
                              value: _selectedTransmissionType,
                              items: transOpts,
                              onChanged: (val) {
                                if (mounted) {
                                  setState(
                                      () => _selectedTransmissionType = val);
                                }
                              },
                              getLabel: (t) => t.displayName,
                            );
                          },
                          error: (msg) {
                            // If we have options, show them even on error
                            if (transmissionTypeOptions.isNotEmpty) {
                              return _buildDropdownField<TransmissionType>(
                                label: 'Transmission Type',
                                value: _selectedTransmissionType,
                                items: transmissionTypeOptions,
                                onChanged: (val) {
                                  if (mounted) {
                                    setState(
                                        () => _selectedTransmissionType = val);
                                  }
                                },
                                getLabel: (t) => t.displayName,
                              );
                            }
                            return Text(
                              'Error loading options',
                              style: TextStyle(color: Colors.red, fontSize: 12),
                            );
                          },
                          orElse: () => _buildDropdownField<TransmissionType>(
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
                        );
                      },
                    ),
                  ]),
                  const SizedBox(height: 20),
                  _sectionLabel("Engine & performance"),
                  _buildRow([
                    _buildTextField("Seating Capacity",
                        (v) => _seatingCapacity = int.tryParse(v!),
                        keyboardType: TextInputType.number),
                    _buildTextField("Engine Capacity (cc)",
                        (v) => _engineCapacity = int.tryParse(v!),
                        keyboardType: TextInputType.number),
                  ]),
                  const SizedBox(height: 16),
                  _buildRow([
                    _buildTextField(
                        "Max Power (hp)", (v) => _maxPower = int.tryParse(v!),
                        keyboardType: TextInputType.number),
                    _buildTextField(
                        "Max Torque (Nm)", (v) => _maxTorque = int.tryParse(v!),
                        keyboardType: TextInputType.number),
                  ]),
                  const SizedBox(height: 16),
                  _buildRow([
                    _buildTextField(
                        "Mileage (kmpl)", (v) => _mileage = double.tryParse(v!),
                        keyboardType: TextInputType.number),
                    const SizedBox.shrink(),
                  ]),
                  const SizedBox(height: 20),
                  _sectionLabel("Pricing"),
                  _buildRow([
                    _buildTextField(
                        "Price (₹)", (v) => _price = int.tryParse(v!),
                        keyboardType: TextInputType.number),
                    const SizedBox.shrink(),
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
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        backgroundColor: AppColors.accent,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text("Create Variant",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                  )
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

  Widget _sectionLabel(String text) => FormSectionTitle(text);

  Widget _buildRow(List<Widget> children) => TwoColGrid(children);

  Widget _buildTextField(
    String label,
    FormFieldSetter<String> onSaved, {
    TextInputType? keyboardType,
  }) {
    return LabeledField(
      label: label,
      child: TextFormField(
        decoration: formInputDecoration("Enter ${label.toLowerCase()}"),
        keyboardType: keyboardType,
        validator: (value) =>
            value == null || value.isEmpty ? '$label is required' : null,
        onSaved: onSaved,
      ),
    );
  }

  Widget _buildDropdownField<T>({
    required String label,
    required T? value,
    required List<T> items,
    required ValueChanged<T?> onChanged,
    required String Function(T) getLabel,
  }) {
    return LabeledField(
      label: label,
      child: DropdownButtonFormField<T>(
        value: value,
        items: items
            .map((item) => DropdownMenuItem<T>(
                  value: item,
                  child: Text(
                    getLabel(item),
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList(),
        onChanged: onChanged,
        decoration: formInputDecoration("Select ${label.toLowerCase()}"),
        validator: (val) => val == null ? '$label is required' : null,
        isExpanded: true,
        selectedItemBuilder: (BuildContext context) {
          return items.map<Widget>((T item) {
            return Text(
              getLabel(item),
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.black),
            );
          }).toList();
        },
      ),
    );
  }
}
