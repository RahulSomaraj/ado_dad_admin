import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/common/text_style.dart';
import 'package:ado_dad_admin/features/vehicle/bloc/vehicle_bloc.dart';
import 'package:ado_dad_admin/features/vehicle_company/bloc/vehicle_company_bloc.dart';
import 'package:ado_dad_admin/models/vehicle_company_model.dart';
import 'package:ado_dad_admin/models/vehicle_post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class EditVehicle extends StatefulWidget {
  final VehicleRequest vehicle;
  const EditVehicle({super.key, required this.vehicle});

  @override
  State<EditVehicle> createState() => _EditVehicleState();
}

class _EditVehicleState extends State<EditVehicle> {
  final GlobalKey<FormState> _vehicleEditFormKey = GlobalKey<FormState>();

  bool _isBasicInfoExpanded = true;
  bool _isVehicleModelExpanded = false;
  bool _isAdditionalInfoExpanded = false;

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
  final List<String> modelYears = List.generate(
    DateTime.now().year - 1979,
    (index) => (1980 + index).toString(),
  ).reversed.toList();

  final List<String> months = List.generate(
    12,
    (index) => DateFormat('MMMM').format(DateTime(2000, index + 1, 1)),
  );

  List<String> selectedColors = [];
  List<String> availableColors = ["Red", "Blue", "Black", "White"];

  final List<String> fuelTypes = ["Petrol", "Diesel", "Electric", "Hybrid"];
  final List<String> transmissionTypes = [
    "Automatic",
    "Manual",
    "Semi-Automatic",
    "CVT",
    "Dual-Clutch"
  ];

  late String? _name, _modelName, _wheelerType, _modelType;
  late int? _modelYear;
  late String? _month;
  late VehicleCompanyModel? _selectedVendor;
  late String? _vehicleName, _vehicleModelName;
  late String? _fuelType, _transmissionType;
  late int? _mileage, _engineCapacity, _fuelCapacity, _maxPower;
  late List<String>? _selectedColors;
  late bool _abs;
  late bool _accidental;
  late bool _adjustableExternalMirror;
  late bool _adjustableSteering;
  late bool _adjustableSeats;
  late bool _airConditioning;
  late bool _alloyWheels;
  late bool _auxCompatibility;
  late bool _bluetooth;
  late bool _vehicleCertified;
  late bool _cruiseControl;
  late bool _lockSystem;
  late bool _navigationSystem;
  late bool _parkingSensors;
  late bool _powerSteering;
  late bool _powerWindows;
  late bool _amFmRadio;
  late bool _rearParkingCamera;
  late bool _exchange;
  late bool _finance;
  late bool _serviceHistory;
  late bool _sunroof;
  late bool _usbCompatibility;
  late bool _seatWarmer;
  late int _numberOfAirbags;
  late String? _batteryCondition,
      _insuranceType,
      _makeMonth,
      _registrationPlace,
      _tyreCondition;
  late List<String>? _selectedAdditionalColors;

  @override
  void initState() {
    super.initState();
    context.read<VehicleCompanyBloc>().add(FetchAllVehicleCompany());

    final vehicle = widget.vehicle;
    _name = vehicle.name;
    _modelName = vehicle.modelName;
    _wheelerType = vehicle.wheelerType;
    _modelType = vehicle.modelType;
    _modelYear = vehicle.details.modelYear;
    _month = vehicle.details.month;
    _selectedVendor = VehicleCompanyModel(id: vehicle.vendor);
    _vehicleName = vehicle.vehicleModels.first.name;
    _vehicleModelName = vehicle.vehicleModels.first.modelName;
    _fuelType = vehicle.vehicleModels.first.fuelType;
    _transmissionType = vehicle.vehicleModels.first.transmissionType;
    _mileage = vehicle.vehicleModels.first.mileage;
    _engineCapacity = vehicle.vehicleModels.first.engineCapacity;
    _fuelCapacity = vehicle.vehicleModels.first.fuelCapacity;
    _maxPower = vehicle.vehicleModels.first.maxPower;
    _selectedColors = vehicle.color;

    final additionalInfo = vehicle.vehicleModels.first.additionalInfo;

    if (_wheelerType == "FOUR_WHEELER" && additionalInfo != null) {
      _abs = additionalInfo.abs;
      _accidental = additionalInfo.accidental;
      _adjustableExternalMirror = additionalInfo.adjustableExternalMirror;
      _adjustableSteering = additionalInfo.adjustableSteering;
      _adjustableSeats = additionalInfo.adjustableSeats;
      _airConditioning = additionalInfo.airConditioning;
      _alloyWheels = additionalInfo.alloyWheels;
      _auxCompatibility = additionalInfo.auxCompatibility;
      _bluetooth = additionalInfo.bluetooth;
      _vehicleCertified = additionalInfo.vehicleCertified;
      _cruiseControl = additionalInfo.cruiseControl;
      _lockSystem = additionalInfo.lockSystem;
      _navigationSystem = additionalInfo.navigationSystem;
      _parkingSensors = additionalInfo.parkingSensors;
      _powerSteering = additionalInfo.powerSteering;
      _powerWindows = additionalInfo.powerWindows;
      _amFmRadio = additionalInfo.amFmRadio;
      _rearParkingCamera = additionalInfo.rearParkingCamera;
      _exchange = additionalInfo.exchange;
      _finance = additionalInfo.finance;
      _serviceHistory = additionalInfo.serviceHistory;
      _sunroof = additionalInfo.sunroof;
      _usbCompatibility = additionalInfo.usbCompatibility;
      _seatWarmer = additionalInfo.seatWarmer;
      _numberOfAirbags = additionalInfo.numberOfAirbags;
      _batteryCondition = additionalInfo.batteryCondition;
      _insuranceType = additionalInfo.insuranceType;
      _makeMonth = additionalInfo.makeMonth;
      _registrationPlace = additionalInfo.registrationPlace;
      _tyreCondition = additionalInfo.tyreCondition;
      _selectedAdditionalColors = additionalInfo.color;
    } else {
      // Set safe default values to avoid null crash
      _abs = false;
      _accidental = false;
      _adjustableExternalMirror = false;
      _adjustableSteering = false;
      _adjustableSeats = false;
      _airConditioning = false;
      _alloyWheels = false;
      _auxCompatibility = false;
      _bluetooth = false;
      _vehicleCertified = false;
      _cruiseControl = false;
      _lockSystem = false;
      _navigationSystem = false;
      _parkingSensors = false;
      _powerSteering = false;
      _powerWindows = false;
      _amFmRadio = false;
      _rearParkingCamera = false;
      _exchange = false;
      _finance = false;
      _serviceHistory = false;
      _sunroof = false;
      _usbCompatibility = false;
      _seatWarmer = false;
      _numberOfAirbags = 0;
      _batteryCondition = '';
      _insuranceType = '';
      _makeMonth = '';
      _registrationPlace = '';
      _tyreCondition = '';
      _selectedAdditionalColors = [];
    }

    // _abs = vehicle.vehicleModels.first.additionalInfo!.abs;
    // _accidental = vehicle.vehicleModels.first.additionalInfo!.accidental;
    // _adjustableExternalMirror =
    //     vehicle.vehicleModels.first.additionalInfo!.adjustableExternalMirror;
    // _adjustableSteering =
    //     vehicle.vehicleModels.first.additionalInfo!.adjustableSteering;
    // _adjustableSeats =
    //     vehicle.vehicleModels.first.additionalInfo!.adjustableSeats;
    // _airConditioning =
    //     vehicle.vehicleModels.first.additionalInfo!.airConditioning;
    // _alloyWheels = vehicle.vehicleModels.first.additionalInfo!.alloyWheels;
    // _auxCompatibility =
    //     vehicle.vehicleModels.first.additionalInfo!.auxCompatibility;
    // _bluetooth = vehicle.vehicleModels.first.additionalInfo!.bluetooth;
    // _vehicleCertified =
    //     vehicle.vehicleModels.first.additionalInfo!.vehicleCertified;
    // _cruiseControl = vehicle.vehicleModels.first.additionalInfo!.cruiseControl;
    // _lockSystem = vehicle.vehicleModels.first.additionalInfo!.lockSystem;
    // _navigationSystem =
    //     vehicle.vehicleModels.first.additionalInfo!.navigationSystem;
    // _parkingSensors =
    //     vehicle.vehicleModels.first.additionalInfo!.parkingSensors;
    // _powerSteering = vehicle.vehicleModels.first.additionalInfo!.powerSteering;
    // _powerWindows = vehicle.vehicleModels.first.additionalInfo!.powerWindows;
    // _amFmRadio = vehicle.vehicleModels.first.additionalInfo!.amFmRadio;
    // _rearParkingCamera =
    //     vehicle.vehicleModels.first.additionalInfo!.rearParkingCamera;
    // _exchange = vehicle.vehicleModels.first.additionalInfo!.exchange;
    // _finance = vehicle.vehicleModels.first.additionalInfo!.finance;
    // _serviceHistory =
    //     vehicle.vehicleModels.first.additionalInfo!.serviceHistory;
    // _sunroof = vehicle.vehicleModels.first.additionalInfo!.sunroof;
    // _usbCompatibility =
    //     vehicle.vehicleModels.first.additionalInfo!.usbCompatibility;
    // _seatWarmer = vehicle.vehicleModels.first.additionalInfo!.seatWarmer;
    // _numberOfAirbags =
    //     vehicle.vehicleModels.first.additionalInfo!.numberOfAirbags;
    // _batteryCondition =
    //     vehicle.vehicleModels.first.additionalInfo!.batteryCondition;
    // _insuranceType = vehicle.vehicleModels.first.additionalInfo!.insuranceType;
    // _makeMonth = vehicle.vehicleModels.first.additionalInfo!.makeMonth;
    // _registrationPlace =
    //     vehicle.vehicleModels.first.additionalInfo!.registrationPlace;
    // _tyreCondition = vehicle.vehicleModels.first.additionalInfo!.tyreCondition;
    // _selectedAdditionalColors =
    //     vehicle.vehicleModels.first.additionalInfo!.color;
  }

  void _updateVehicle() {
    if (_vehicleEditFormKey.currentState!.validate()) {
      _vehicleEditFormKey.currentState!.save();

      AdditionalInfo? additionalInfo;
      if (_wheelerType == "FOUR_WHEELER") {
        additionalInfo = AdditionalInfo(
          abs: _abs,
          accidental: _accidental,
          adjustableExternalMirror: _adjustableExternalMirror,
          adjustableSteering: _adjustableSteering,
          adjustableSeats: _adjustableSeats,
          airConditioning: _airConditioning,
          numberOfAirbags: _numberOfAirbags,
          alloyWheels: _alloyWheels,
          auxCompatibility: _auxCompatibility,
          batteryCondition: _batteryCondition!,
          bluetooth: _bluetooth,
          vehicleCertified: _vehicleCertified,
          color: _selectedAdditionalColors!,
          cruiseControl: _cruiseControl,
          insuranceType: _insuranceType!,
          lockSystem: _lockSystem,
          makeMonth: _makeMonth!,
          navigationSystem: _navigationSystem,
          parkingSensors: _parkingSensors,
          powerSteering: _powerSteering,
          powerWindows: _powerWindows,
          amFmRadio: _amFmRadio,
          rearParkingCamera: _rearParkingCamera,
          registrationPlace: _registrationPlace!,
          exchange: _exchange,
          finance: _finance,
          serviceHistory: _serviceHistory,
          tyreCondition: _tyreCondition!,
          sunroof: _sunroof,
          usbCompatibility: _usbCompatibility,
          seatWarmer: _seatWarmer,
        );
      }

      final updatedVehicle = VehicleRequest(
        id: widget.vehicle.id,
        name: _name!,
        modelName: _modelName!,
        modelType: _modelType!,
        wheelerType: _wheelerType!,
        details: Details(modelYear: _modelYear!, month: _month!),
        vendor: _selectedVendor!.id,
        color: _selectedColors!,
        vehicleModels: [
          VehicleModel1(
              name: _vehicleName!,
              modelName: _vehicleModelName!,
              fuelType: _fuelType!,
              transmissionType: _transmissionType!,
              mileage: _mileage!,
              engineCapacity: _engineCapacity!,
              fuelCapacity: _fuelCapacity!,
              maxPower: _maxPower!,
              additionalInfo: additionalInfo)
        ],
      );

      context
          .read<VehicleBloc>()
          .add(UpdateVehicle(updatedVehicle: updatedVehicle));

      Future.delayed(const Duration(milliseconds: 500), () {
        _showSuccessPopup(context, "Vehicle updated successfully.");
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
              _buildUpdateForm(state),
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
                context.pop();
                context.read<VehicleBloc>().add(FetchAllVehicles());
              },
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Edit Vehicle",
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

  Widget _buildUpdateForm(VehicleState state) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        // width: 1000,
        child: Card(
          elevation: 5,
          color: AppColors.primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Form(
            key: _vehicleEditFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: _buildExpansionTile(
                    title: 'Basic Information',
                    isExpanded: _isBasicInfoExpanded,
                    onExpand: (expanded) =>
                        setState(() => _isBasicInfoExpanded = expanded),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: _buildFormField(
                                    "Name", _name!, (value) => _name = value!)),
                            const SizedBox(width: 15),
                            Expanded(
                              child: _buildFormField("Model Name", _modelName!,
                                  (value) => _modelName = value!),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(
                              child: _buildDropdownField(
                                "Wheeler Type",
                                _wheelerType!,
                                wheelerType,
                                (value) {
                                  setState(() {
                                    _wheelerType = value!;
                                    _modelType = _wheelerType == "TWO_WHEELER"
                                        ? "two-wheeler"
                                        : modelTypes.first;
                                  });
                                },
                                false, // Always enabled
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: _buildDropdownField(
                                  "Model Type",
                                  _modelType!,
                                  _wheelerType == "TWO_WHEELER"
                                      ? ["two-wheeler"]
                                      : modelTypes
                                          .where(
                                              (type) => type != "two-wheeler")
                                          .toList(), (value) {
                                if (_wheelerType != "TWO_WHEELER") {
                                  setState(() => _modelType = value!);
                                }
                              }, _wheelerType == "TWO_WHEELER"),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(
                              child: _buildDropdownField('Model Year',
                                  _modelYear.toString(), modelYears, (value) {
                                setState(() => _modelYear = int.parse(value!));
                              }, false),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: _buildDropdownField(
                                  'Month', _month!, months, (value) {
                                setState(() => _month = value!);
                              }, false),
                            )
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(child: _buildVendorDropdown()),
                            const SizedBox(width: 15),
                            Expanded(
                              child: _buildMultiSelectColors(
                                label: "Color",
                                selectedColors: _selectedColors!,
                                onSelectionChanged: (newColors) {
                                  setState(() {
                                    _selectedColors = newColors;
                                  });
                                },
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: _buildExpansionTile(
                    title: 'Vehicle Model Information',
                    isExpanded: _isVehicleModelExpanded,
                    onExpand: (expanded) =>
                        setState(() => _isVehicleModelExpanded = expanded),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: _buildFormField(
                                    "Vehicle Name",
                                    _vehicleName!,
                                    (value) => _vehicleName = value!)),
                            const SizedBox(width: 15),
                            Expanded(
                              child: _buildFormField(
                                  "Vehicle Model Name",
                                  _vehicleModelName!,
                                  (value) => _vehicleModelName = value!),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(
                              child: _buildDropdownField(
                                  'Transmission Type',
                                  _transmissionType!,
                                  transmissionTypes, (value) {
                                setState(() => _transmissionType = value!);
                              }, false),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: _buildDropdownField(
                                  'Fuel Type', _fuelType!, fuelTypes, (value) {
                                setState(() => _fuelType = value!);
                              }, false),
                            )
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(
                                child: _buildFormField(
                                    "Mileage",
                                    _mileage.toString(),
                                    (value) => _mileage = int.parse(value!))),
                            const SizedBox(width: 15),
                            Expanded(
                              child: _buildFormField(
                                  "Engine Capacity",
                                  _engineCapacity.toString(),
                                  (value) =>
                                      _engineCapacity = int.parse(value!)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(
                                child: _buildFormField(
                                    "Fuel Capacity",
                                    _fuelCapacity.toString(),
                                    (value) =>
                                        _fuelCapacity = int.parse(value!))),
                            const SizedBox(width: 15),
                            Expanded(
                              child: _buildFormField(
                                  "Maximum Power",
                                  _maxPower.toString(),
                                  (value) => _maxPower = int.parse(value!)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                if (_wheelerType == "FOUR_WHEELER") ...[
                  Divider(),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: _buildExpansionTile(
                      title: 'Additional Information',
                      isExpanded: _isAdditionalInfoExpanded,
                      onExpand: (expanded) =>
                          setState(() => _isAdditionalInfoExpanded = expanded),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: _buildFormField(
                                      "Number of Airbags",
                                      _numberOfAirbags.toString(),
                                      (value) => _numberOfAirbags =
                                          int.parse(value!))),
                              const SizedBox(width: 15),
                              Expanded(
                                  child: _buildFormField(
                                      "Battery Condition",
                                      _batteryCondition!,
                                      (value) => _batteryCondition = value!)),
                              const SizedBox(width: 15),
                              Expanded(
                                  child: _buildFormField(
                                      "Insurance Type",
                                      _insuranceType!,
                                      (value) => _insuranceType = value!)),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Expanded(
                                child: _buildDropdownField(
                                    'Make Month', _makeMonth!, months, (value) {
                                  setState(() => _makeMonth = value!);
                                }, false),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                  child: _buildFormField(
                                      "Registration Place",
                                      _registrationPlace!,
                                      (value) => _registrationPlace = value!)),
                              const SizedBox(width: 15),
                              Expanded(
                                  child: _buildFormField(
                                      "Tyre Condition",
                                      _tyreCondition!,
                                      (value) => _tyreCondition = value!)),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Expanded(
                                child: _buildMultiSelectColors(
                                  label: "Color",
                                  selectedColors: _selectedAdditionalColors!,
                                  onSelectionChanged: (newColors) {
                                    setState(() {
                                      _selectedAdditionalColors = newColors;
                                    });
                                  },
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: _buildCheckboxField(
                                  label: "ABS",
                                  value: _abs,
                                  onChanged: (newValue) =>
                                      setState(() => _abs = newValue),
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: _buildCheckboxField(
                                    label: "Accidental",
                                    value: _accidental,
                                    onChanged: (newValue) =>
                                        setState(() => _accidental = newValue)),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                  child: _buildCheckboxField(
                                label: "Adjustable External Mirror",
                                value: _adjustableExternalMirror,
                                onChanged: (newValue) => setState(
                                    () => _adjustableExternalMirror = newValue),
                              )),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Expanded(
                                  child: _buildCheckboxField(
                                label: "Adjustable Steering",
                                value: _adjustableSteering,
                                onChanged: (newValue) => setState(
                                    () => _adjustableSteering = newValue),
                              )),
                              const SizedBox(width: 15),
                              Expanded(
                                  child: _buildCheckboxField(
                                label: "Adjustable Seats",
                                value: _adjustableSeats,
                                onChanged: (newValue) =>
                                    setState(() => _adjustableSeats = newValue),
                              )),
                              const SizedBox(width: 15),
                              Expanded(
                                  child: _buildCheckboxField(
                                label: "Air Conditioning",
                                value: _airConditioning,
                                onChanged: (newValue) =>
                                    setState(() => _airConditioning = newValue),
                              )),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Expanded(
                                  child: _buildCheckboxField(
                                label: "Alloy Wheels",
                                value: _alloyWheels,
                                onChanged: (newValue) =>
                                    setState(() => _alloyWheels = newValue),
                              )),
                              const SizedBox(width: 15),
                              Expanded(
                                  child: _buildCheckboxField(
                                      label: "Aux Compatibility",
                                      value: _auxCompatibility,
                                      onChanged: (newValue) => setState(
                                          () => _auxCompatibility = newValue))),
                              const SizedBox(width: 15),
                              Expanded(
                                  child: _buildCheckboxField(
                                      label: "Bluetooth",
                                      value: _bluetooth,
                                      onChanged: (value) =>
                                          _bluetooth = value)),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Expanded(
                                  child: _buildCheckboxField(
                                      label: "Vehicle Certified",
                                      value: _vehicleCertified,
                                      onChanged: (value) =>
                                          _vehicleCertified = value)),
                              const SizedBox(width: 15),
                              Expanded(
                                  child: _buildCheckboxField(
                                      label: "Cruise Control",
                                      value: _cruiseControl,
                                      onChanged: (value) =>
                                          _cruiseControl = value)),
                              const SizedBox(width: 15),
                              Expanded(
                                  child: _buildCheckboxField(
                                      label: "Lock System",
                                      value: _lockSystem,
                                      onChanged: (value) =>
                                          _lockSystem = value)),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Expanded(
                                  child: _buildCheckboxField(
                                      label: "Navigation System",
                                      value: _navigationSystem,
                                      onChanged: (value) =>
                                          _navigationSystem = value)),
                              const SizedBox(width: 15),
                              Expanded(
                                  child: _buildCheckboxField(
                                      label: "Parking Sensors",
                                      value: _parkingSensors,
                                      onChanged: (value) =>
                                          _parkingSensors = value)),
                              const SizedBox(width: 15),
                              Expanded(
                                  child: _buildCheckboxField(
                                      label: "Power Steering",
                                      value: _powerSteering,
                                      onChanged: (value) =>
                                          _powerSteering = value)),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Expanded(
                                  child: _buildCheckboxField(
                                      label: "Power Windows",
                                      value: _powerWindows,
                                      onChanged: (value) =>
                                          _powerWindows = value)),
                              const SizedBox(width: 15),
                              Expanded(
                                  child: _buildCheckboxField(
                                      label: "AmFm Radio",
                                      value: _amFmRadio,
                                      onChanged: (value) =>
                                          _amFmRadio = value)),
                              const SizedBox(width: 15),
                              Expanded(
                                  child: _buildCheckboxField(
                                      label: "Rear Parking Camera",
                                      value: _rearParkingCamera,
                                      onChanged: (value) =>
                                          _rearParkingCamera = value)),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Expanded(
                                  child: _buildCheckboxField(
                                      label: "Exchange",
                                      value: _exchange,
                                      onChanged: (value) => _exchange = value)),
                              const SizedBox(width: 15),
                              Expanded(
                                  child: _buildCheckboxField(
                                      label: "Finance",
                                      value: _finance,
                                      onChanged: (value) => _finance = value)),
                              const SizedBox(width: 15),
                              Expanded(
                                  child: _buildCheckboxField(
                                      label: "Service History",
                                      value: _serviceHistory,
                                      onChanged: (value) =>
                                          _serviceHistory = value)),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Expanded(
                                  child: _buildCheckboxField(
                                      label: "Sunroof",
                                      value: _sunroof,
                                      onChanged: (value) => _sunroof = value)),
                              const SizedBox(width: 15),
                              Expanded(
                                  child: _buildCheckboxField(
                                      label: "USB Compatibility",
                                      value: _usbCompatibility,
                                      onChanged: (value) =>
                                          _usbCompatibility = value)),
                              const SizedBox(width: 15),
                              Expanded(
                                  child: _buildCheckboxField(
                                      label: "Seat Warmer",
                                      value: _seatWarmer,
                                      onChanged: (value) =>
                                          _seatWarmer = value)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed:
                          state is VehicleLoading ? null : _updateVehicle,
                      child: state is VehicleLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                  strokeWidth: 2, color: Colors.white),
                            )
                          : const Text("Update Vehicle",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormField(
    String label,
    String? initialValue,
    Function(String?) onSaved,
  ) {
    return TextFormField(
      initialValue: initialValue ?? '',
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      inputFormatters: label.contains("Year") ||
              label.contains("Mileage") ||
              label.contains("Capacity") ||
              label.contains("Maximum Power") ||
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
      List<String> items, Function(String?) onChanged, bool isDisabled) {
    return DropdownButtonFormField<String>(
      value: items.contains(selectedValue) ? selectedValue : null,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      items: isDisabled
          ? [
              DropdownMenuItem(
                value: selectedValue,
                child: Text(selectedValue),
              )
            ]
          : items
              .map((type) => DropdownMenuItem(value: type, child: Text(type)))
              .toList(),
      onChanged:
          isDisabled ? null : (value) => setState(() => onChanged(value!)),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "$label is required";
        }
        return null;
      },
    );
  }

  Widget _buildVendorDropdown() {
    return BlocBuilder<VehicleCompanyBloc, VehicleCompanyState>(
      builder: (context, state) {
        if (state is VehicleCompanyLoaded) {
          // Ensure selected vendor exists in the dropdown list
          final existingVendor = state.companies.firstWhere(
            (vendor) => vendor.id == _selectedVendor?.id,
            orElse: () => state.companies.isNotEmpty
                ? state.companies.first
                : VehicleCompanyModel(id: "", name: "No Vendor"),
          );

          return DropdownButtonFormField<VehicleCompanyModel>(
            value: existingVendor.id.isNotEmpty ? existingVendor : null,
            decoration: InputDecoration(
              labelText: "Vendor",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
            items: state.companies.map((vendor) {
              return DropdownMenuItem(
                value: vendor,
                child: Text(vendor.name!), // ✅ Ensure name is valid
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedVendor = value!; // ✅ Update selected vendor
              });
            },
            validator: (value) {
              if (value == null || value.id.isEmpty) {
                return "Please select a vendor";
              }
              return null;
            },
          );
        } else if (state is VehicleCompanyLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Text("No vendors available");
        }
      },
    );
  }

  Widget _buildMultiSelectColors({
    required String label,
    required List<String> selectedColors,
    required Function(List<String>) onSelectionChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8.0,
          children: availableColors.map((color) {
            return FilterChip(
              label: Text(color),
              selected: selectedColors.contains(color),
              onSelected: (selected) {
                setState(() {
                  List<String> updatedColors = List.from(selectedColors);
                  selected
                      ? updatedColors.add(color)
                      : updatedColors.remove(color);

                  onSelectionChanged(updatedColors);
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildCheckboxField({
    required String label,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return CheckboxListTile(
      title: Text(label),
      value: value,
      onChanged: (newValue) {
        if (newValue != null) {
          setState(() {
            onChanged(newValue);
          });
        }
      },
      controlAffinity: ListTileControlAffinity.leading,
    );
  }

  Widget _buildExpansionTile({
    required String title,
    required bool isExpanded,
    required Function(bool) onExpand,
    required Widget content,
  }) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        title: Text(title, style: AppTextStyle.texttstyle),
        initiallyExpanded: isExpanded,
        onExpansionChanged: onExpand,
        children: [
          Padding(padding: const EdgeInsets.all(16.0), child: content)
        ],
      ),
    );
  }
}
