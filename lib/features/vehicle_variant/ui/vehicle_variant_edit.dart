import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/features/vehicle_variant/bloc/bloc/vehicle_variant_bloc.dart';
import 'package:ado_dad_admin/models/vehicle_model/vehicle_model.dart';
import 'package:ado_dad_admin/models/vehicle_variant/variant_model.dart'
    as variant_model;
import 'package:ado_dad_admin/models/vehicle_variant/vehicle_variant_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VehicleVariantEdit extends StatefulWidget {
  final VehicleVariantResponseModel variant;
  final VehicleModel vehicleModel;

  const VehicleVariantEdit({
    super.key,
    required this.variant,
    required this.vehicleModel,
  });

  @override
  State<VehicleVariantEdit> createState() => _VehicleVariantEditState();
}

class _VehicleVariantEditState extends State<VehicleVariantEdit> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _displayName;
  int? _price;
  bool _isActive = true;
  int? _seatingCapacity;
  int? _engineCapacity;
  int? _maxPower;
  int? _maxTorque;
  double? _mileage;

  List<variant_model.FuelType> fuelTypeOptions = [];
  List<variant_model.TransmissionType> transmissionTypeOptions = [];

  variant_model.FuelType? _selectedFuelType;
  variant_model.TransmissionType? _selectedTransmissionType;

  @override
  void initState() {
    super.initState();
    // Initialize form fields with existing variant data
    _name = widget.variant.name;
    _displayName = widget.variant.displayName;
    _price = widget.variant.price;
    _isActive = widget.variant.isActive;
    _seatingCapacity = widget.variant.seatingCapacity;

    // Initialize engine specs
    if (widget.variant.engineSpecs != null) {
      // Use capacity if available, otherwise fallback to displacement
      _engineCapacity = widget.variant.engineSpecs?.capacity ??
          widget.variant.engineSpecs?.displacement;
      _maxPower = widget.variant.engineSpecs?.maxPower;
      _maxTorque = widget.variant.engineSpecs?.maxTorque;
    }

    // Initialize performance specs
    if (widget.variant.performanceSpecs != null) {
      _mileage = widget.variant.performanceSpecs?.mileage;
    }

    // Convert response model types to variant model types for dropdowns
    if (widget.variant.fuelType != null) {
      _selectedFuelType = variant_model.FuelType(
        id: widget.variant.fuelType!.id,
        name: widget.variant.fuelType!.name,
        displayName: widget.variant.fuelType!.displayName,
      );
    }
    if (widget.variant.transmissionType != null) {
      _selectedTransmissionType = variant_model.TransmissionType(
        id: widget.variant.transmissionType!.id,
        name: widget.variant.transmissionType!.name,
        displayName: widget.variant.transmissionType!.displayName,
      );
    }

    // Fetch fuel types and transmission types from API
    context.read<VehicleVariantBloc>().add(
          const VehicleVariantEvent.fetchOptions(),
        );
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      // Prepare update payload according to API requirements
      final updatePayload = {
        'name': _name,
        'displayName': _displayName,
        'vehicleModel': widget.vehicleModel.id,
        'fuelType': _selectedFuelType?.id,
        'transmissionType': _selectedTransmissionType?.id,
        'price': _price,
        'isActive': _isActive,
        'seatingCapacity': _seatingCapacity,
        'engineSpecs': {
          'capacity': _engineCapacity ?? 0,
          'maxPower': _maxPower ?? 0,
          'maxTorque': _maxTorque ?? 0,
        },
        'performanceSpecs': {
          'mileage': _mileage ?? 0,
        },
      };

      print("🚀 Variant Update Payload: $updatePayload");

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        context.read<VehicleVariantBloc>().add(
              VehicleVariantEvent.updateVariant(
                variantId: widget.variant.id,
                payload: updatePayload,
                modelId: widget.vehicleModel.id!,
              ),
            );
      });
    }
  }

  void _showSuccessPopup(BuildContext context, String message) {
    if (!mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return BlocListener<VehicleVariantBloc, VehicleVariantState>(
          listener: (context, state) {
            // Listen for loaded state to ensure list is refreshed
            state.maybeWhen(
              loaded: (_) {
                // List has been refreshed, we can navigate back
              },
              orElse: () {},
            );
          },
          child: AlertDialog(
            title: const Text("Success"),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close dialog
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    // Navigate back to vehicle model view page to see the updated variant list
                    if (context.canPop()) {
                      context
                          .pop(); // Go back to the previous page (model view)
                    } else {
                      context.go('/view-vehicle_model',
                          extra: widget.vehicleModel);
                    }
                  });
                },
                child: const Text("OK"),
              ),
            ],
          ),
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
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Edit Vehicle Variant",
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
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
                    _buildTextField(
                      "Name",
                      (v) => _name = v!,
                      initialValue: _name,
                    ),
                    _buildTextField(
                      "Display Name",
                      (v) => _displayName = v!,
                      initialValue: _displayName,
                    ),
                  ]),
                  const SizedBox(height: 16),
                  _buildRow([
                    BlocBuilder<VehicleVariantBloc, VehicleVariantState>(
                      buildWhen: (prev, curr) {
                        // Only rebuild when options are being loaded or loaded, not during variant update
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
                            return _buildDropdownField<variant_model.FuelType>(
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
                                  // Match selected fuel type from options
                                  if (_selectedFuelType != null &&
                                      fuelOpts.isNotEmpty) {
                                    try {
                                      _selectedFuelType = fuelOpts.firstWhere(
                                        (f) => f.id == _selectedFuelType?.id,
                                        orElse: () => fuelOpts.first,
                                      );
                                    } catch (e) {
                                      _selectedFuelType = fuelOpts.isNotEmpty
                                          ? fuelOpts.first
                                          : null;
                                    }
                                  }
                                });
                              }
                            });
                            return _buildDropdownField<variant_model.FuelType>(
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
                              return _buildDropdownField<
                                  variant_model.FuelType>(
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
                          orElse: () =>
                              _buildDropdownField<variant_model.FuelType>(
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
                        // Only rebuild when options are being loaded or loaded, not during variant update
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
                            return _buildDropdownField<
                                variant_model.TransmissionType>(
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
                            // Match selected transmission type from options
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              if (mounted) {
                                setState(() {
                                  transmissionTypeOptions = transOpts;
                                  if (_selectedTransmissionType != null &&
                                      transOpts.isNotEmpty) {
                                    try {
                                      _selectedTransmissionType =
                                          transOpts.firstWhere(
                                        (t) =>
                                            t.id ==
                                            _selectedTransmissionType?.id,
                                        orElse: () => transOpts.first,
                                      );
                                    } catch (e) {
                                      _selectedTransmissionType =
                                          transOpts.isNotEmpty
                                              ? transOpts.first
                                              : null;
                                    }
                                  }
                                });
                              }
                            });
                            return _buildDropdownField<
                                variant_model.TransmissionType>(
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
                              return _buildDropdownField<
                                  variant_model.TransmissionType>(
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
                          orElse: () => _buildDropdownField<
                              variant_model.TransmissionType>(
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
                  const SizedBox(height: 16),
                  _buildRow([
                    _buildTextField(
                      "Seating Capacity",
                      (v) => _seatingCapacity = int.tryParse(v!),
                      keyboardType: TextInputType.number,
                      initialValue: _seatingCapacity?.toString() ?? '',
                    ),
                    _buildTextField(
                      "Engine Capacity (cc)",
                      (v) => _engineCapacity = int.tryParse(v!),
                      keyboardType: TextInputType.number,
                      initialValue: _engineCapacity?.toString() ?? '',
                    ),
                  ]),
                  const SizedBox(height: 16),
                  _buildRow([
                    _buildTextField(
                      "Max Power (hp)",
                      (v) => _maxPower = int.tryParse(v!),
                      keyboardType: TextInputType.number,
                      initialValue: _maxPower?.toString() ?? '',
                    ),
                    _buildTextField(
                      "Max Torque (Nm)",
                      (v) => _maxTorque = int.tryParse(v!),
                      keyboardType: TextInputType.number,
                      initialValue: _maxTorque?.toString() ?? '',
                    ),
                  ]),
                  const SizedBox(height: 16),
                  _buildRow([
                    _buildTextField(
                      "Mileage (kmpl)",
                      (v) => _mileage = double.tryParse(v!),
                      keyboardType: TextInputType.number,
                      initialValue: _mileage?.toString() ?? '',
                    ),
                    _buildTextField(
                      "Price (₹)",
                      (v) => _price = int.tryParse(v!),
                      keyboardType: TextInputType.number,
                      initialValue: _price?.toString() ?? '',
                    ),
                  ]),
                  const SizedBox(height: 16),
                  _buildActiveSwitch(),
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
                      child: const Text(
                        "Update Variant",
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
      ),
    );
  }

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
    String? initialValue,
  }) {
    return TextFormField(
      initialValue: initialValue,
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

  Widget _buildActiveSwitch() {
    return Row(
      children: [
        Checkbox(
          value: _isActive,
          onChanged: (value) {
            setState(() {
              _isActive = value ?? false;
            });
          },
        ),
        const Text(
          'Active',
          style: TextStyle(fontSize: 16),
        ),
      ],
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
                child: Text(
                  getLabel(item),
                  overflow: TextOverflow.ellipsis,
                ),
              ))
          .toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      ),
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
    );
  }
}
