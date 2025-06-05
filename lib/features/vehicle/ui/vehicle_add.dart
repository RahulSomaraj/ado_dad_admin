import 'package:ado_dad_admin/features/vehicle/bloc/vehicle_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ado_dad_admin/models/vehicle_post_model.dart';

class AddVehicle extends StatefulWidget {
  const AddVehicle({Key? key}) : super(key: key);

  @override
  _AddVehicleState createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  final _formKey = GlobalKey<FormState>();

  // Form Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _modelNameController = TextEditingController();
  final TextEditingController _modelTypeController = TextEditingController();
  final TextEditingController _vendorController = TextEditingController();
  final TextEditingController _modelYearController = TextEditingController();
  final TextEditingController _monthController = TextEditingController();
  final TextEditingController _fuelTypeController = TextEditingController();
  final TextEditingController _transmissionTypeController =
      TextEditingController();
  final TextEditingController _mileageController = TextEditingController();

  // Four-Wheeler Specific
  final TextEditingController _engineCapacityController =
      TextEditingController();
  final TextEditingController _fuelCapacityController = TextEditingController();
  final TextEditingController _maxPowerController = TextEditingController();

  // Dropdown Selections
  String _selectedWheelerType = 'TWO_WHEELER';
  List<String> selectedColors = [];
  List<String> availableColors = ["Red", "Blue", "Black", "White"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Vehicle Name
              _buildTextField("Vehicle Name", _nameController),

              // Model Name
              _buildTextField("Model Name", _modelNameController),

              // Model Type
              _buildTextField("Model Type", _modelTypeController),

              // Vendor
              _buildTextField("Vendor ID", _vendorController),

              // Model Year
              _buildTextField("Model Year", _modelYearController,
                  isNumber: true),

              // Model Month
              _buildTextField("Model Month", _monthController),

              // Wheeler Type Dropdown
              _buildDropdown(
                "Wheeler Type",
                ["TWO_WHEELER", "FOUR_WHEELER"],
                _selectedWheelerType,
                (newValue) {
                  setState(() {
                    _selectedWheelerType = newValue!;
                  });
                },
              ),

              // Fuel Type
              _buildTextField("Fuel Type", _fuelTypeController),

              // Transmission Type
              _buildTextField("Transmission Type", _transmissionTypeController),

              // Mileage
              _buildTextField("Mileage", _mileageController, isNumber: true),

              // Color Selection
              _buildMultiSelectColors(),

              // Additional fields for Four-Wheelers only
              if (_selectedWheelerType == "FOUR_WHEELER") ...[
                _buildTextField("Engine Capacity", _engineCapacityController,
                    isNumber: true),
                _buildTextField("Fuel Capacity", _fuelCapacityController,
                    isNumber: true),
                _buildTextField("Max Power", _maxPowerController,
                    isNumber: true),
              ],

              const SizedBox(height: 20),

              // Submit Button
              BlocConsumer<VehicleBloc, VehicleState>(
                listener: (context, state) {
                  if (state is VehicleAddedSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                    Navigator.pop(context); // Close the form after success
                  } else if (state is VehicleError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  }
                },
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: state is VehicleLoading ? null : _submitForm,
                    child: state is VehicleLoading
                        ? const CircularProgressIndicator()
                        : const Text("Add Vehicle"),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {bool isNumber = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextFormField(
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        validator: (value) =>
            value == null || value.isEmpty ? "$label is required" : null,
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> options,
      String selectedValue, Function(String?) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        value: selectedValue,
        items: options
            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildMultiSelectColors() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Select Colors",
            style: TextStyle(fontWeight: FontWeight.bold)),
        Wrap(
          spacing: 8.0,
          children: availableColors.map((color) {
            return FilterChip(
              label: Text(color),
              selected: selectedColors.contains(color),
              onSelected: (selected) {
                setState(() {
                  selected
                      ? selectedColors.add(color)
                      : selectedColors.remove(color);
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  void _submitForm() {
    if (!_formKey.currentState!.validate()) return;

    final vehicleData = VehicleRequest(
      name: _nameController.text,
      modelName: _modelNameController.text,
      modelType: _modelTypeController.text,
      wheelerType: _selectedWheelerType,
      details: Details(
        modelYear: int.parse(_modelYearController.text),
        month: _monthController.text,
      ),
      vendor: _vendorController.text,
      vehicleModels: [
        VehicleModel1(
          name: _nameController.text,
          modelName: _modelNameController.text,
          modelDetails: "Latest model details",
          images: [],
          fuelType: _fuelTypeController.text,
          transmissionType: _transmissionTypeController.text,
          mileage: int.parse(_mileageController.text),
          color: selectedColors,
          engineCapacity: _selectedWheelerType == "FOUR_WHEELER"
              ? int.parse(_engineCapacityController.text)
              : null,
          fuelCapacity: _selectedWheelerType == "FOUR_WHEELER"
              ? int.parse(_fuelCapacityController.text)
              : null,
          maxPower: _selectedWheelerType == "FOUR_WHEELER"
              ? int.parse(_maxPowerController.text)
              : null,
        ),
      ],
      color: selectedColors,
    );

    context
        .read<VehicleBloc>()
        .add(VehicleEvent.addVehicle(vehicleData: vehicleData));
  }
}
