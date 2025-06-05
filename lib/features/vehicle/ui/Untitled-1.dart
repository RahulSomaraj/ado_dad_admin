import 'package:ado_dad_admin/features/vehicle_company/bloc/vehicle_company_bloc.dart';
import 'package:ado_dad_admin/models/vehicle_company_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ado_dad_admin/features/vehicle/bloc/vehicle_bloc.dart';
import 'package:ado_dad_admin/models/vehicle_model.dart';
import 'package:ado_dad_admin/models/vehicle_variant_model.dart';
import 'package:ado_dad_admin/models/vehicle_additional_info_model.dart';
import 'package:ado_dad_admin/models/vehicle_detail_model.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class AddVehicle extends StatefulWidget {
  const AddVehicle({super.key});

  @override
  State<AddVehicle> createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  final GlobalKey<FormState> _vehicleFormKey = GlobalKey<FormState>();

  final List<String> wheelerType = ["TWO_WHEELER", "FOUR_WHEELER"];
  final List<String> modelTypes = [
    "SUV",
    "Sedan",
    "Truck",
    "Coupe",
    "Hatchback",
    "Convertible",
    "two-wheeler"
  ];
  final List<String> fuelTypes = ["Petrol", "Diesel", "Electric", "Hybrid"];
  final List<String> transmissionTypes = [
    "Automatic",
    "Manual",
    "Semi-Automatic",
    "CVT",
    "Dual-Clutch"
  ];

  final List<String> modelYears = List.generate(
    DateTime.now().year - 1979, // Generates years from 1980 to Current Year
    (index) => (1980 + index).toString(),
  ).reversed.toList();

  final List<String> months = List.generate(
    12,
    (index) => DateFormat('MMMM').format(DateTime(2000, index + 1, 1)),
  );

  @override
  void initState() {
    super.initState();
    context.read<VehicleCompanyBloc>().add(FetchAllVehicleCompany());
    _month = months[DateTime.now().month - 1];
    _makeMonth = months[DateTime.now().month - 1];
  }

  String _name = '';
  String _modelName = '';
  String _modelType = 'two-wheeler';
  String _wheelerType = "TWO_WHEELER";
  int _modelYear = DateTime.now().year;
  String? _month;
  // String _vendorId = '';
  String _fuelType = 'Petrol';
  String _transmissionType = 'Automatic';
  int? _mileage, _engineCapacity, _fuelCapacity, _maxPower;
  bool _abs = false;
  bool _adjustableExternalMirror = false;
  bool _adjustableSteering = false;
  bool _adjustableSeats = false;
  bool _airConditioning = false;
  bool _accidental = false;
  bool _alloyWheels = false;
  bool _auxCompatibility = false;
  int _numberOfAirbags = 0;
  bool _sunroof = false;
  String _batteryCondition = "Good";
  bool _bluetooth = false;
  bool _vehicleCertified = false;
  bool _cruiseControl = false;
  String _insuranceType = '';
  bool _lockSystem = false;
  String? _makeMonth;
  bool _navigationSystem = false;
  bool _parkingSensors = false;
  bool _powerSteering = false;
  bool _powerWindows = false;
  bool _amFmRadio = false;
  bool _rearParkingCamera = false;
  String _registrationPlace = '';
  bool _exchange = false;
  bool _finance = false;
  bool _serviceHistory = false;
  String _tyreCondition = "Good";
  bool _usbCompatibility = false;
  bool _seatWarmer = false;

  VehicleCompanyModel? _selectedVendor;

  // void _addVehicle() {
  //   if (_vehicleFormKey.currentState!.validate()) {
  //     _vehicleFormKey.currentState!.save();

  //     print("Vendor: ${_selectedVendor!.id}");

  //     final vehicleVariant = VehicleVariant(
  //       name: _modelName,
  //       modelName: _modelName,
  //       modelDetails: "Details about $_modelName",
  //       images: [],
  //       fuelType: _fuelType,
  //       transmissionType: _transmissionType,
  //       mileage: _mileage,
  //       engineCapacity: _engineCapacity,
  //       fuelCapacity: _fuelCapacity,
  //       maxPower: _maxPower,
  //     );

  //     AdditionalInfo? additionalInfo;
  //     if (_wheelerType == "FOUR_WHEELER") {
  //       additionalInfo = AdditionalInfo(
  //         abs: _abs,
  //         accidental: _accidental,
  //         adjustableExternalMirror: _adjustableExternalMirror,
  //         adjustableSteering: _adjustableSteering,
  //         adjustableSeats: _adjustableSeats,
  //         airConditioning: _airConditioning,
  //         numberOfAirbags: _numberOfAirbags,
  //         alloyWheels: _alloyWheels,
  //         auxCompatibility: _auxCompatibility,
  //         batteryCondition: _batteryCondition,
  //         bluetooth: _bluetooth,
  //         vehicleCertified: _vehicleCertified,
  //         color: [],
  //         cruiseControl: _cruiseControl,
  //         insuranceType: _insuranceType,
  //         lockSystem: _lockSystem,
  //         makeMonth: _makeMonth,
  //         navigationSystem: _navigationSystem,
  //         parkingSensors: _parkingSensors,
  //         powerSteering: _powerSteering,
  //         powerWindows: _powerWindows,
  //         amFmRadio: _amFmRadio,
  //         rearParkingCamera: _rearParkingCamera,
  //         registrationPlace: _registrationPlace,
  //         exchange: _exchange,
  //         finance: _finance,
  //         serviceHistory: _serviceHistory,
  //         tyreCondition: _tyreCondition,
  //         sunroof: _sunroof,
  //         usbCompatibility: _usbCompatibility,
  //         seatWarmer: _seatWarmer,
  //       );
  //     }

  //     final newVehicle = VehicleModel(
  //       id: '',
  //       name: _name,
  //       modelName: _modelName,
  //       modelType: _modelType,
  //       wheelerType: _wheelerType,
  //       // vendor: _selectedVendor!,
  //       vendorId: _selectedVendor!.id,
  //       colors: [],
  //       details: VehicleDetails(modelYear: _modelYear, month: _month),
  //       vehicleVariants: [vehicleVariant],
  //       additionalInfo: additionalInfo!,
  //     );
  //     print(newVehicle);
  //     context
  //         .read<VehicleBloc>()
  //         .add(VehicleEvent.addVehicle(vehicleData: newVehicle));

  //     Future.delayed(const Duration(milliseconds: 500), () {
  //       _showSuccessPopup(context, "Vehicle added successfully.");
  //     });
  //   }
  // }

  void _addVehicle() {
    if (_vehicleFormKey.currentState!.validate()) {
      _vehicleFormKey.currentState!.save();

      print("Vendor: ${_selectedVendor!.id}");

      // Creating the vehicle variant with common attributes
      final vehicleVariant = VehicleVariant(
        name: _modelName!,
        modelName: _modelName!,
        modelDetails: "Details about $_modelName",
        images: [],
        fuelType: _fuelType,
        transmissionType: _transmissionType,
        mileage: _mileage!,
        engineCapacity: _wheelerType == "FOUR_WHEELER" ? _engineCapacity : 0,
        fuelCapacity: _wheelerType == "FOUR_WHEELER" ? _fuelCapacity : 0,
        maxPower: _wheelerType == "FOUR_WHEELER" ? _maxPower : 0,
      );

      // Assign AdditionalInfo only for FOUR_WHEELER
      final additionalInfo = _wheelerType == "FOUR_WHEELER"
          ? AdditionalInfo(
              abs: _abs,
              accidental: _accidental,
              adjustableExternalMirror: _adjustableExternalMirror,
              adjustableSteering: _adjustableSteering,
              adjustableSeats: _adjustableSeats,
              airConditioning: _airConditioning,
              numberOfAirbags: _numberOfAirbags,
              alloyWheels: _alloyWheels,
              auxCompatibility: _auxCompatibility,
              batteryCondition: _batteryCondition,
              bluetooth: _bluetooth,
              vehicleCertified: _vehicleCertified,
              color: [],
              cruiseControl: _cruiseControl,
              insuranceType: _insuranceType,
              lockSystem: _lockSystem,
              makeMonth: _makeMonth,
              navigationSystem: _navigationSystem,
              parkingSensors: _parkingSensors,
              powerSteering: _powerSteering,
              powerWindows: _powerWindows,
              amFmRadio: _amFmRadio,
              rearParkingCamera: _rearParkingCamera,
              registrationPlace: _registrationPlace,
              exchange: _exchange,
              finance: _finance,
              serviceHistory: _serviceHistory,
              tyreCondition: _tyreCondition,
              sunroof: _sunroof,
              usbCompatibility: _usbCompatibility,
              seatWarmer: _seatWarmer,
            )
          : AdditionalInfo(); // ✅ Provide an emp

      // Creating the vehicle model
      // final newVehicle = VehicleModel(
      //   id: '',
      //   name: _name,
      //   modelName: _modelName,
      //   modelType: _modelType,
      //   wheelerType: _wheelerType,
      //   vendorId: _selectedVendor!.id,
      //   colors: [],
      //   details: VehicleDetails(modelYear: _modelYear, month: _month!),
      //   vehicleVariants: [vehicleVariant],
      //   additionalInfo: additionalInfo, // Pass null if it's a two-wheeler
      // );

      // print(newVehicle);

      // Dispatch the event to the BLoC
      // context
      //     .read<VehicleBloc>()
      //     .add(VehicleEvent.addVehicle(vehicleData: newVehicle));

      Future.delayed(const Duration(milliseconds: 500), () {
        _showSuccessPopup(context, "Vehicle added successfully.");
      });
    }
  }

  void _showSuccessPopup(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Success"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
                context.go('/vehicles');
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
    return BlocBuilder<VehicleBloc, VehicleState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildHeaderSection(),
              const SizedBox(height: 30),
              _buildVehicleForm(state),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeaderSection() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
              onPressed: () {
                context.pop();
                context.read<VehicleBloc>().add(FetchAllVehicles());
              },
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Add Vehicle",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVehicleForm(VehicleState state) {
    return Center(
      child: SizedBox(
        width: 700, // Adjust width for better layout
        child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _vehicleFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row 1 - Name, Model Name
                  Row(
                    children: [
                      Expanded(
                          child: _buildFormField(
                              "Name", (value) => _name = value!)),
                      const SizedBox(width: 15),
                      Expanded(
                          child: _buildFormField(
                              "Model Name", (value) => _modelName = value!)),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      // Expanded(
                      //   child: _buildFormField("Model Year",
                      //       (value) => _modelYear = int.tryParse(value!) ?? 0),
                      // ),
                      Expanded(
                        child: _buildDropdownField(
                          "Model Year",
                          _modelYear.toString(), // ✅ Ensure it's a string
                          modelYears,
                          (value) {
                            setState(() => _modelYear =
                                int.parse(value!)); // ✅ Convert back to int
                          },
                        ),
                      ),
                      const SizedBox(width: 15),
                      // Expanded(
                      //     child: _buildFormField(
                      //         "Month", (value) => _month = value!)),
                      Expanded(
                        child: _buildDropdownField(
                          "Month",
                          _month ?? months.first,
                          months,
                          (value) {
                            setState(() => _month = value!);
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                  // Row 2 - Model Type, Vendor
                  Row(
                    children: [
                      // Expanded(
                      //   child: _buildDropdownField(
                      //       "Model Type", _modelType, modelTypes, (value) {
                      //     setState(() => _modelType = value!);
                      //   }),
                      // ),
                      Expanded(
                        child: _wheelerType == "TWO_WHEELER"
                            ? _buildDisabledDropdownField("Model Type",
                                "two-wheeler") // Disabled dropdown
                            : _buildDropdownField(
                                "Model Type", _modelType, modelTypes, (value) {
                                setState(() => _modelType = value!);
                              }),
                      ),
                      const SizedBox(width: 15),
                      Expanded(child: _buildVendorDropdown()),
                    ],
                  ),
                  const SizedBox(height: 15),

                  // Row 3 - Wheeler Type, Fuel Type
                  Row(
                    children: [
                      // Expanded(
                      //   child: _buildDropdownField(
                      //       "Wheeler Type", _wheelerType, wheelerType, (value) {
                      //     setState(() => _wheelerType = value!);
                      //   }),
                      // ),
                      Expanded(
                        child: _buildDropdownField(
                            "Wheeler Type", _wheelerType, wheelerType, (value) {
                          setState(() {
                            _wheelerType = value!;
                            if (_wheelerType == "TWO_WHEELER") {
                              _modelType = "two-wheeler"; // Auto-set Model Type
                            } else {
                              _modelType =
                                  "two-wheeler"; // Allow selection for Four-Wheeler
                            }
                          });
                        }),
                      ),
                      const SizedBox(width: 15),
                      // Expanded(
                      //     child: _buildFormField(
                      //         "Fuel Type", (value) => _fuelType = value!)),
                      Expanded(
                        child: _buildDropdownField(
                          "Fuel Type",
                          _fuelType,
                          fuelTypes,
                          (value) {
                            setState(() => _fuelType = value!);
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                  // Row 4 - Transmission Type, Mileage
                  Row(
                    children: [
                      // Expanded(
                      //     child: _buildFormField("Transmission Type",
                      //         (value) => _transmissionType = value!)),
                      Expanded(
                        child: _buildDropdownField(
                          "Transmission Type",
                          _transmissionType,
                          transmissionTypes,
                          (value) {
                            setState(() => _transmissionType = value!);
                          },
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                          child: _buildFormField("Mileage",
                              (value) => _mileage = int.parse(value!))),
                    ],
                  ),

                  // Four-Wheeler Specific Fields
                  if (_wheelerType == "FOUR_WHEELER") ...[
                    const SizedBox(height: 20),

                    Row(
                      children: [
                        Expanded(
                            child: _buildFormField(
                                "Number of Airbags",
                                (value) =>
                                    _numberOfAirbags = int.parse(value!))),
                        const SizedBox(width: 15),
                        Expanded(
                            child: _buildFormField("Battery Condition",
                                (value) => _batteryCondition = value!)),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                            child: _buildFormField("Insurance Type",
                                (value) => _insuranceType = value!)),
                        const SizedBox(width: 15),
                        // Expanded(
                        //     child: _buildFormField(
                        //         "Make Month", (value) => _makeMonth = value!)),
                        Expanded(
                          child: _buildDropdownField(
                            "Make Month",
                            _makeMonth ?? months.first,
                            months,
                            (value) {
                              setState(() => _makeMonth = value!);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                            child: _buildFormField("Registration Place",
                                (value) => _registrationPlace = value!)),
                        const SizedBox(width: 15),
                        Expanded(
                            child: _buildFormField("Tyre Condition",
                                (value) => _tyreCondition = value!)),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                            child: _buildFormField(
                                "Engine Capacity",
                                (value) =>
                                    _engineCapacity = int.parse(value!))),
                        const SizedBox(width: 15),
                        Expanded(
                            child: _buildFormField("Fuel Capacity",
                                (value) => _fuelCapacity = int.parse(value!))),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                            child: _buildFormField("Max Power",
                                (value) => _maxPower = int.parse(value!))),
                      ],
                    ),

                    // Row 5 - ABS, Accidental
                    Row(
                      children: [
                        Expanded(
                            child: _buildCheckboxField(
                                "ABS", _abs, (value) => _abs = value!)),
                        const SizedBox(width: 15),
                        Expanded(
                            child: _buildCheckboxField("Accidental",
                                _accidental, (value) => _accidental = value!)),
                        const SizedBox(width: 15),
                        Expanded(
                            child: _buildCheckboxField("Sunroof", _sunroof,
                                (value) => _sunroof = value!)),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                            child: _buildCheckboxField(
                                "Adjustable Steering",
                                _adjustableSteering,
                                (value) => _adjustableSteering = value!)),
                        const SizedBox(width: 15),
                        Expanded(
                            child: _buildCheckboxField(
                                "Adjustable Seats",
                                _adjustableSeats,
                                (value) => _adjustableSeats = value!)),
                        Expanded(
                            child: _buildCheckboxField(
                                "Air Conditioning",
                                _airConditioning,
                                (value) => _airConditioning = value!)),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                            child: _buildCheckboxField(
                                "Alloy Wheels",
                                _alloyWheels,
                                (value) => _alloyWheels = value!)),
                        const SizedBox(width: 15),
                        Expanded(
                            child: _buildCheckboxField(
                                "Aux Compatibility",
                                _auxCompatibility,
                                (value) => _auxCompatibility = value!)),
                        const SizedBox(width: 15),
                        Expanded(
                            child: _buildCheckboxField("Bluetooth", _bluetooth,
                                (value) => _bluetooth = value!)),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                            child: _buildCheckboxField(
                                "Vehicle Certified",
                                _vehicleCertified,
                                (value) => _vehicleCertified = value!)),
                        const SizedBox(width: 15),
                        Expanded(
                            child: _buildCheckboxField(
                                "Cruise Control",
                                _cruiseControl,
                                (value) => _cruiseControl = value!)),
                        const SizedBox(width: 15),
                        Expanded(
                            child: _buildCheckboxField("Lock System",
                                _lockSystem, (value) => _lockSystem = value!)),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                            child: _buildCheckboxField(
                                "Navigation System",
                                _navigationSystem,
                                (value) => _navigationSystem = value!)),
                        const SizedBox(width: 15),
                        Expanded(
                            child: _buildCheckboxField(
                                "Parking Sensors",
                                _parkingSensors,
                                (value) => _parkingSensors = value!)),
                        const SizedBox(width: 15),
                        Expanded(
                            child: _buildCheckboxField(
                                "Power Steering",
                                _powerSteering,
                                (value) => _powerSteering = value!)),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                            child: _buildCheckboxField(
                                "Power Windows",
                                _powerWindows,
                                (value) => _powerWindows = value!)),
                        const SizedBox(width: 15),
                        Expanded(
                            child: _buildCheckboxField("AmFm Radio", _amFmRadio,
                                (value) => _amFmRadio = value!)),
                        const SizedBox(width: 15),
                        Expanded(
                            child: _buildCheckboxField(
                                "Rear Parking Camera",
                                _rearParkingCamera,
                                (value) => _rearParkingCamera = value!)),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                            child: _buildCheckboxField("Exchange", _exchange,
                                (value) => _exchange = value!)),
                        const SizedBox(width: 15),
                        Expanded(
                            child: _buildCheckboxField("Finance", _finance,
                                (value) => _finance = value!)),
                        const SizedBox(width: 15),
                        Expanded(
                            child: _buildCheckboxField(
                                "Service History",
                                _serviceHistory,
                                (value) => _serviceHistory = value!)),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                            child: _buildCheckboxField(
                                "Adjustable External Mirror",
                                _adjustableExternalMirror,
                                (value) => _adjustableExternalMirror = value!)),
                        Expanded(
                            child: _buildCheckboxField(
                                "USB Compatibility",
                                _usbCompatibility,
                                (value) => _usbCompatibility = value!)),
                        const SizedBox(width: 15),
                        Expanded(
                            child: _buildCheckboxField("Seat Warmer",
                                _seatWarmer, (value) => _seatWarmer = value!)),
                      ],
                    ),
                  ],
                  const SizedBox(height: 20),

                  // Submit Button
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
                      onPressed: state is VehicleLoading ? null : _addVehicle,
                      child: state is VehicleLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                  strokeWidth: 2, color: Colors.white),
                            )
                          : const Text("Add Vehicle",
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
    Function(String?) onSaved,
  ) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      inputFormatters: label.contains("Year") ||
              label.contains("Mileage") ||
              label.contains("Capacity") ||
              label.contains("Max Power") ||
              label.contains("Number of Airbags")
          ? [FilteringTextInputFormatter.digitsOnly] // Allow only numbers
          : [],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "$label is required";
        }
        return null;
      },
      onSaved: onSaved,
    );
  }

  Widget _buildDropdownField(String label, String selectedValue,
      List<String> items, Function(String?) onChanged) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      items: items
          .map((type) => DropdownMenuItem(value: type, child: Text(type)))
          .toList(),
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "$label is required";
        }
        return null;
      },
    );
  }

  // Widget _buildCheckboxField(String label, Function(bool?) onChanged) {
  //   return CheckboxListTile(
  //     title: Text(label),
  //     value: false,
  //     onChanged: onChanged,
  //   );
  // }

  Widget _buildCheckboxField(
      String label, bool value, Function(bool?) onChanged) {
    return CheckboxListTile(
      title: Text(label),
      value: value, // ✅ Use the actual state variable
      onChanged: (newValue) {
        setState(() {
          onChanged(newValue);
        });
      },
    );
  }

  Widget _buildVendorDropdown() {
    return BlocBuilder<VehicleCompanyBloc, VehicleCompanyState>(
      builder: (context, state) {
        if (state is VehicleCompanyLoaded) {
          return DropdownButtonFormField<VehicleCompanyModel>(
            value: _selectedVendor,
            decoration: InputDecoration(
              labelText: "Select Vendor",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
            items: state.companies.map((vendor) {
              return DropdownMenuItem(
                value: vendor,
                child: Text(vendor.name), // ✅ Display Name
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedVendor = value; // ✅ Store Vendor Object
              });
            },
            validator: (value) {
              if (value == null) {
                return "Please select a vendor";
              }
              return null;
            },
          );
        } else {
          return Text("No vendors available");
        }
      },
    );
  }

  Widget _buildDisabledDropdownField(String label, String selectedValue) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      items: [
        DropdownMenuItem(value: selectedValue, child: Text(selectedValue))
      ],
      onChanged: null, // ❌ Disables selection
    );
  }
}
