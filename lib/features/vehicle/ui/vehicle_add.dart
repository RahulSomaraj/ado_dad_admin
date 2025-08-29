// import 'package:ado_dad_admin/common/app_colors.dart';
// import 'package:ado_dad_admin/common/text_style.dart';
// import 'package:ado_dad_admin/features/vehicle/bloc/vehicle_bloc.dart';
// import 'package:ado_dad_admin/features/vehicle_company/bloc/vehicle_company_bloc.dart';
// import 'package:ado_dad_admin/models/vehicle_company_model.dart';
// import 'package:ado_dad_admin/models/vehicle_post_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// // import 'package:intl/intl.dart';

// class AddVehicle extends StatefulWidget {
//   const AddVehicle({super.key});

//   @override
//   State<AddVehicle> createState() => _AddVehicleState();
// }

// class _AddVehicleState extends State<AddVehicle> {
//   final GlobalKey<FormState> _vehicleFormKey = GlobalKey<FormState>();

//   bool _isBasicInfoExpanded = true;
//   bool _isVehicleModelExpanded = false;
//   bool _isAdditionalInfoExpanded = false;

//   final List<String> wheelerType = ["TWO_WHEELER", "FOUR_WHEELER"];
//   final List<String> modelTypes = [
//     "SUV",
//     "Sedan",
//     "Truck",
//     "Coupe",
//     "Hatchback",
//     "Convertible",
//     "two-wheeler"
//   ];
//   final List<String> modelYears = List.generate(
//     DateTime.now().year - 1979,
//     (index) => (1980 + index).toString(),
//   ).reversed.toList();

//   // final List<String> months = List.generate(
//   //   12,
//   //   (index) => DateFormat('MMMM').format(DateTime(2000, index + 1, 1)),
//   // );

//   List<String> selectedColors = [];
//   List<String> availableColors = ["Red", "Blue", "Black", "White"];

//   final List<String> fuelTypes = ["Petrol", "Diesel", "Electric", "Hybrid"];
//   final List<String> transmissionTypes = [
//     "Automatic",
//     "Manual",
//     "Semi-Automatic",
//     "CVT",
//     "Dual-Clutch"
//   ];

//   @override
//   void initState() {
//     super.initState();
//     context.read<VehicleCompanyBloc>().add(FetchAllVehicleCompany());
//   }

//   String _name = '', _modelName = '', _wheelerType = '', _modelType = '';
//   int? _modelYear;
//   String _month = '';
//   VehicleCompanyModel? _selectedVendor;
//   String _vehicleName = '', _vehicleModelName = '';
//   String _fuelType = '', _transmissionType = '';
//   int _mileage = 0, _engineCapacity = 0, _fuelCapacity = 0, _maxPower = 0;
//   List<String> _selectedColors = [];
//   bool _abs = false;
//   bool _accidental = false;
//   bool _adjustableExternalMirror = false;
//   bool _adjustableSteering = false;
//   bool _adjustableSeats = false;
//   bool _airConditioning = false;
//   bool _alloyWheels = false;
//   bool _auxCompatibility = false;
//   bool _bluetooth = false;
//   bool _vehicleCertified = false;
//   bool _cruiseControl = false;
//   bool _lockSystem = false;
//   bool _navigationSystem = false;
//   bool _parkingSensors = false;
//   bool _powerSteering = false;
//   bool _powerWindows = false;
//   bool _amFmRadio = false;
//   bool _rearParkingCamera = false;
//   bool _exchange = false;
//   bool _finance = false;
//   bool _serviceHistory = false;
//   bool _sunroof = false;
//   bool _usbCompatibility = false;
//   bool _seatWarmer = false;
//   int _numberOfAirbags = 0;
//   String _batteryCondition = '',
//       _insuranceType = '',
//       _makeMonth = '',
//       _registrationPlace = '',
//       _tyreCondition = '';
//   List<String> _selectedAdditionalColors = [];

//   void _addVehicle() {
//     if (_vehicleFormKey.currentState!.validate()) {
//       _vehicleFormKey.currentState!.save();
//       print('Wheeler Type:.... $_wheelerType');

//       AdditionalInfo? additionalInfo;
//       if (_wheelerType == "FOUR_WHEELER") {
//         additionalInfo = AdditionalInfo(
//           abs: _abs,
//           accidental: _accidental,
//           adjustableExternalMirror: _adjustableExternalMirror,
//           adjustableSteering: _adjustableSteering,
//           adjustableSeats: _adjustableSeats,
//           airConditioning: _airConditioning,
//           numberOfAirbags: _numberOfAirbags,
//           alloyWheels: _alloyWheels,
//           auxCompatibility: _auxCompatibility,
//           batteryCondition: _batteryCondition,
//           bluetooth: _bluetooth,
//           vehicleCertified: _vehicleCertified,
//           color: _selectedAdditionalColors,
//           cruiseControl: _cruiseControl,
//           insuranceType: _insuranceType,
//           lockSystem: _lockSystem,
//           makeMonth: _makeMonth,
//           navigationSystem: _navigationSystem,
//           parkingSensors: _parkingSensors,
//           powerSteering: _powerSteering,
//           powerWindows: _powerWindows,
//           amFmRadio: _amFmRadio,
//           rearParkingCamera: _rearParkingCamera,
//           registrationPlace: _registrationPlace,
//           exchange: _exchange,
//           finance: _finance,
//           serviceHistory: _serviceHistory,
//           tyreCondition: _tyreCondition,
//           sunroof: _sunroof,
//           usbCompatibility: _usbCompatibility,
//           seatWarmer: _seatWarmer,
//         );
//       }

//       final newVehicle = VehicleRequest(
//         id: '',
//         name: _name,
//         modelName: _modelName,
//         modelType: _modelType,
//         wheelerType: _wheelerType,
//         details: Details(modelYear: _modelYear!, month: _month),
//         vendor: _selectedVendor!.id,
//         color: _selectedColors,
//         vehicleModels: [
//           VehicleModel1(
//             name: _vehicleName,
//             modelName: _vehicleModelName,
//             fuelType: _fuelType,
//             transmissionType: _transmissionType,
//             mileage: _mileage,
//             engineCapacity: _engineCapacity,
//             fuelCapacity: _fuelCapacity,
//             maxPower: _maxPower,
//             additionalInfo: additionalInfo,
//           )
//         ],
//       );

//       context
//           .read<VehicleBloc>()
//           .add(VehicleEvent.addVehicle(vehicleData: newVehicle));
//       Future.delayed(const Duration(milliseconds: 500), () {
//         _showSuccessPopup(context, "Vehicle added successfully.");
//       });
//     }
//   }

//   void _showSuccessPopup(BuildContext context, String message) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Success"),
//           content: Text(message),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 context.pop();
//                 context.go('/vehicles');
//               },
//               child: const Text("OK"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<VehicleBloc, VehicleState>(
//       builder: (context, state) {
//         return Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               _buildHeaderSection(),
//               const SizedBox(height: 30),
//               _buildVehicleForm(state),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildHeaderSection() {
//     return Padding(
//       padding: const EdgeInsets.all(15),
//       child: Container(
//         decoration: BoxDecoration(
//           color: AppColors.primaryColor,
//           borderRadius: BorderRadius.circular(12),
//         ),
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//         child: Row(
//           children: [
//             IconButton(
//               icon: const Icon(Icons.arrow_back_ios_new,
//                   color: AppColors.blackColor),
//               onPressed: () {
//                 context.pop();
//                 context.read<VehicleBloc>().add(FetchAllVehicles());
//               },
//             ),
//             const Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Text(
//                 "Add Vehicle",
//                 style: TextStyle(
//                     color: AppColors.blackColor,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildVehicleForm(VehicleState state) {
//     return Padding(
//       padding: const EdgeInsets.all(15.0),
//       child: SizedBox(
//         // width: 1000,
//         child: Card(
//           elevation: 5,
//           color: AppColors.primaryColor,
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//           child: Form(
//             key: _vehicleFormKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: _buildExpansionTile(
//                     title: 'Basic Information',
//                     isExpanded: _isBasicInfoExpanded,
//                     onExpand: (expanded) =>
//                         setState(() => _isBasicInfoExpanded = expanded),
//                     content: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             Expanded(
//                                 child: _buildFormField(
//                                     "Name", "", (value) => _name = value!)),
//                             const SizedBox(width: 15),
//                             Expanded(
//                               child: _buildFormField("Model Name", "",
//                                   (value) => _modelName = value!),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 15),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: _buildDropdownField(
//                                 "Wheeler Type",
//                                 _wheelerType,
//                                 wheelerType,
//                                 (value) {
//                                   setState(() {
//                                     _wheelerType = value!;
//                                     _modelType = _wheelerType == "TWO_WHEELER"
//                                         ? "two-wheeler"
//                                         : modelTypes.first;
//                                   });
//                                 },
//                                 false, // Always enabled
//                               ),
//                             ),
//                             const SizedBox(width: 15),
//                             Expanded(
//                               child: _buildDropdownField(
//                                   "Model Type",
//                                   _modelType,
//                                   _wheelerType == "TWO_WHEELER"
//                                       ? ["two-wheeler"]
//                                       : modelTypes
//                                           .where(
//                                               (type) => type != "two-wheeler")
//                                           .toList(), (value) {
//                                 if (_wheelerType != "TWO_WHEELER") {
//                                   setState(() => _modelType = value!);
//                                 }
//                               }, _wheelerType == "TWO_WHEELER"),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 15),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: _buildDropdownField('Model Year',
//                                   _modelYear.toString(), modelYears, (value) {
//                                 setState(() => _modelYear = int.parse(value!));
//                               }, false),
//                             ),
//                             const SizedBox(width: 15),
//                             Expanded(
//                               child: _buildDropdownField(
//                                   'Month', _month, months, (value) {
//                                 setState(() => _month = value!);
//                               }, false),
//                             )
//                           ],
//                         ),
//                         const SizedBox(height: 15),
//                         Row(
//                           children: [
//                             Expanded(child: _buildVendorDropdown()),
//                             const SizedBox(width: 15),
//                             Expanded(
//                               child: _buildMultiSelectColors(
//                                 label: "Color",
//                                 selectedColors: _selectedColors,
//                                 onSelectionChanged: (newColors) {
//                                   setState(() {
//                                     _selectedColors = newColors;
//                                   });
//                                 },
//                               ),
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 Divider(),
//                 Padding(
//                   padding: EdgeInsets.all(20.0),
//                   child: _buildExpansionTile(
//                     title: 'Vehicle Model Information',
//                     isExpanded: _isVehicleModelExpanded,
//                     onExpand: (expanded) =>
//                         setState(() => _isVehicleModelExpanded = expanded),
//                     content: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             Expanded(
//                                 child: _buildFormField("Vehicle Name", "",
//                                     (value) => _vehicleName = value!)),
//                             const SizedBox(width: 15),
//                             Expanded(
//                               child: _buildFormField("Vehicle Model Name", "",
//                                   (value) => _vehicleModelName = value!),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 15),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: _buildDropdownField(
//                                   'Transmission Type',
//                                   _transmissionType,
//                                   transmissionTypes, (value) {
//                                 setState(() => _transmissionType = value!);
//                               }, false),
//                             ),
//                             const SizedBox(width: 15),
//                             Expanded(
//                               child: _buildDropdownField(
//                                   'Fuel Type', _fuelType, fuelTypes, (value) {
//                                 setState(() => _fuelType = value!);
//                               }, false),
//                             )
//                           ],
//                         ),
//                         const SizedBox(height: 15),
//                         Row(
//                           children: [
//                             Expanded(
//                                 child: _buildFormField("Mileage", "",
//                                     (value) => _mileage = int.parse(value!))),
//                             const SizedBox(width: 15),
//                             Expanded(
//                               child: _buildFormField(
//                                   "Engine Capacity",
//                                   "",
//                                   (value) =>
//                                       _engineCapacity = int.parse(value!)),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 15),
//                         Row(
//                           children: [
//                             Expanded(
//                                 child: _buildFormField(
//                                     "Fuel Capacity",
//                                     "",
//                                     (value) =>
//                                         _fuelCapacity = int.parse(value!))),
//                             const SizedBox(width: 15),
//                             Expanded(
//                               child: _buildFormField("Maximum Power", "",
//                                   (value) => _maxPower = int.parse(value!)),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 if (_wheelerType == "FOUR_WHEELER") ...[
//                   Divider(),
//                   Padding(
//                     padding: EdgeInsets.all(20.0),
//                     child: _buildExpansionTile(
//                       title: 'Additional Information',
//                       isExpanded: _isAdditionalInfoExpanded,
//                       onExpand: (expanded) =>
//                           setState(() => _isAdditionalInfoExpanded = expanded),
//                       content: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Expanded(
//                                   child: _buildFormField(
//                                       "Number of Airbags",
//                                       "",
//                                       (value) => _numberOfAirbags =
//                                           int.parse(value!))),
//                               const SizedBox(width: 15),
//                               Expanded(
//                                   child: _buildFormField(
//                                       "Battery Condition",
//                                       "",
//                                       (value) => _batteryCondition = value!)),
//                               const SizedBox(width: 15),
//                               Expanded(
//                                   child: _buildFormField("Insurance Type", "",
//                                       (value) => _insuranceType = value!)),
//                             ],
//                           ),
//                           const SizedBox(height: 15),
//                           Row(
//                             children: [
//                               Expanded(
//                                 child: _buildDropdownField(
//                                     'Make Month', _makeMonth, months, (value) {
//                                   setState(() => _makeMonth = value!);
//                                 }, false),
//                               ),
//                               const SizedBox(width: 15),
//                               Expanded(
//                                   child: _buildFormField(
//                                       "Registration Place",
//                                       "",
//                                       (value) => _registrationPlace = value!)),
//                               const SizedBox(width: 15),
//                               Expanded(
//                                   child: _buildFormField("Tyre Condition", "",
//                                       (value) => _tyreCondition = value!)),
//                             ],
//                           ),
//                           const SizedBox(height: 15),
//                           Row(
//                             children: [
//                               Expanded(
//                                 child: _buildMultiSelectColors(
//                                   label: "Color",
//                                   selectedColors: _selectedAdditionalColors,
//                                   onSelectionChanged: (newColors) {
//                                     setState(() {
//                                       _selectedAdditionalColors = newColors;
//                                     });
//                                   },
//                                 ),
//                               )
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Expanded(
//                                   child: _buildCheckboxField(
//                                       "ABS", _abs, (value) => _abs = value!)),
//                               const SizedBox(width: 15),
//                               Expanded(
//                                   child: _buildCheckboxField(
//                                       "Accidental",
//                                       _accidental,
//                                       (value) => _accidental = value!)),
//                               const SizedBox(width: 15),
//                               Expanded(
//                                   child: _buildCheckboxField(
//                                       "Adjustable External Mirror",
//                                       _adjustableExternalMirror,
//                                       (value) =>
//                                           _adjustableExternalMirror = value!)),
//                             ],
//                           ),
//                           const SizedBox(height: 15),
//                           Row(
//                             children: [
//                               Expanded(
//                                   child: _buildCheckboxField(
//                                       "Adjustable Steering",
//                                       _adjustableSteering,
//                                       (value) => _adjustableSteering = value!)),
//                               const SizedBox(width: 15),
//                               Expanded(
//                                   child: _buildCheckboxField(
//                                       "Adjustable Seats",
//                                       _adjustableSeats,
//                                       (value) => _adjustableSeats = value!)),
//                               const SizedBox(width: 15),
//                               Expanded(
//                                   child: _buildCheckboxField(
//                                       "Air Conditioning",
//                                       _airConditioning,
//                                       (value) => _airConditioning = value!)),
//                             ],
//                           ),
//                           const SizedBox(height: 15),
//                           Row(
//                             children: [
//                               Expanded(
//                                   child: _buildCheckboxField(
//                                       "Alloy Wheels",
//                                       _alloyWheels,
//                                       (value) => _alloyWheels = value!)),
//                               const SizedBox(width: 15),
//                               Expanded(
//                                   child: _buildCheckboxField(
//                                       "Aux Compatibility",
//                                       _auxCompatibility,
//                                       (value) => _auxCompatibility = value!)),
//                               const SizedBox(width: 15),
//                               Expanded(
//                                   child: _buildCheckboxField(
//                                       "Bluetooth",
//                                       _bluetooth,
//                                       (value) => _bluetooth = value!)),
//                             ],
//                           ),
//                           const SizedBox(height: 15),
//                           Row(
//                             children: [
//                               Expanded(
//                                   child: _buildCheckboxField(
//                                       "Vehicle Certified",
//                                       _vehicleCertified,
//                                       (value) => _vehicleCertified = value!)),
//                               const SizedBox(width: 15),
//                               Expanded(
//                                   child: _buildCheckboxField(
//                                       "Cruise Control",
//                                       _cruiseControl,
//                                       (value) => _cruiseControl = value!)),
//                               const SizedBox(width: 15),
//                               Expanded(
//                                   child: _buildCheckboxField(
//                                       "Lock System",
//                                       _lockSystem,
//                                       (value) => _lockSystem = value!)),
//                             ],
//                           ),
//                           const SizedBox(height: 15),
//                           Row(
//                             children: [
//                               Expanded(
//                                   child: _buildCheckboxField(
//                                       "Navigation System",
//                                       _navigationSystem,
//                                       (value) => _navigationSystem = value!)),
//                               const SizedBox(width: 15),
//                               Expanded(
//                                   child: _buildCheckboxField(
//                                       "Parking Sensors",
//                                       _parkingSensors,
//                                       (value) => _parkingSensors = value!)),
//                               const SizedBox(width: 15),
//                               Expanded(
//                                   child: _buildCheckboxField(
//                                       "Power Steering",
//                                       _powerSteering,
//                                       (value) => _powerSteering = value!)),
//                             ],
//                           ),
//                           const SizedBox(height: 15),
//                           Row(
//                             children: [
//                               Expanded(
//                                   child: _buildCheckboxField(
//                                       "Power Windows",
//                                       _powerWindows,
//                                       (value) => _powerWindows = value!)),
//                               const SizedBox(width: 15),
//                               Expanded(
//                                   child: _buildCheckboxField(
//                                       "AmFm Radio",
//                                       _amFmRadio,
//                                       (value) => _amFmRadio = value!)),
//                               const SizedBox(width: 15),
//                               Expanded(
//                                   child: _buildCheckboxField(
//                                       "Rear Parking Camera",
//                                       _rearParkingCamera,
//                                       (value) => _rearParkingCamera = value!)),
//                             ],
//                           ),
//                           const SizedBox(height: 15),
//                           Row(
//                             children: [
//                               Expanded(
//                                   child: _buildCheckboxField(
//                                       "Exchange",
//                                       _exchange,
//                                       (value) => _exchange = value!)),
//                               const SizedBox(width: 15),
//                               Expanded(
//                                   child: _buildCheckboxField("Finance",
//                                       _finance, (value) => _finance = value!)),
//                               const SizedBox(width: 15),
//                               Expanded(
//                                   child: _buildCheckboxField(
//                                       "Service History",
//                                       _serviceHistory,
//                                       (value) => _serviceHistory = value!)),
//                             ],
//                           ),
//                           const SizedBox(height: 15),
//                           Row(
//                             children: [
//                               Expanded(
//                                   child: _buildCheckboxField("Sunroof",
//                                       _sunroof, (value) => _sunroof = value!)),
//                               const SizedBox(width: 15),
//                               Expanded(
//                                   child: _buildCheckboxField(
//                                       "USB Compatibility",
//                                       _usbCompatibility,
//                                       (value) => _usbCompatibility = value!)),
//                               const SizedBox(width: 15),
//                               Expanded(
//                                   child: _buildCheckboxField(
//                                       "Seat Warmer",
//                                       _seatWarmer,
//                                       (value) => _seatWarmer = value!)),
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//                 const SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         padding: const EdgeInsets.symmetric(vertical: 12),
//                         backgroundColor: Colors.black,
//                         foregroundColor: Colors.white,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8)),
//                       ),
//                       onPressed: state is VehicleLoading ? null : _addVehicle,
//                       child: state is VehicleLoading
//                           ? const SizedBox(
//                               height: 20,
//                               width: 20,
//                               child: CircularProgressIndicator(
//                                   strokeWidth: 2, color: Colors.white),
//                             )
//                           : const Text("Add Vehicle",
//                               style: TextStyle(
//                                   fontSize: 16, fontWeight: FontWeight.bold)),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildFormField(
//     String label,
//     String initialValue,
//     Function(String?) onSaved,
//   ) {
//     return TextFormField(
//       decoration: InputDecoration(
//         labelText: label,
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//       ),
//       inputFormatters: label.contains("Year") ||
//               label.contains("Mileage") ||
//               label.contains("Capacity") ||
//               label.contains("Maximum Power") ||
//               label.contains("Number of Airbags")
//           ? [FilteringTextInputFormatter.digitsOnly] // Allow only numbers
//           : [],
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return "$label is required";
//         }
//         return null;
//       },
//       onSaved: onSaved,
//     );
//   }

//   Widget _buildDropdownField(String label, String selectedValue,
//       List<String> items, Function(String?) onChanged, bool isDisabled) {
//     return DropdownButtonFormField<String>(
//       value: items.contains(selectedValue) ? selectedValue : null,
//       decoration: InputDecoration(
//         labelText: label,
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//       ),
//       items: isDisabled
//           ? [
//               DropdownMenuItem(
//                 value: selectedValue,
//                 child: Text(selectedValue),
//               )
//             ]
//           : items
//               .map((type) => DropdownMenuItem(value: type, child: Text(type)))
//               .toList(),
//       onChanged: isDisabled ? null : onChanged,
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return "$label is required";
//         }
//         return null;
//       },
//     );
//   }

//   Widget _buildVendorDropdown() {
//     return BlocBuilder<VehicleCompanyBloc, VehicleCompanyState>(
//       builder: (context, state) {
//         if (state is VehicleCompanyLoaded) {
//           return DropdownButtonFormField<VehicleCompanyModel>(
//             value: _selectedVendor,
//             decoration: InputDecoration(
//               labelText: "Vendor",
//               border:
//                   OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//             ),
//             items: state.companies.map((vendor) {
//               return DropdownMenuItem(
//                 value: vendor,
//                 child: Text(vendor.name!), // ✅ Display Name
//               );
//             }).toList(),
//             onChanged: (value) {
//               setState(() {
//                 _selectedVendor = value; // ✅ Store Vendor Object
//               });
//             },
//             validator: (value) {
//               if (value == null) {
//                 return "Please select a vendor";
//               }
//               return null;
//             },
//           );
//         } else {
//           return Text("No vendors available");
//         }
//       },
//     );
//   }

//   Widget _buildMultiSelectColors({
//     required String label,
//     required List<String> selectedColors,
//     required Function(List<String>) onSelectionChanged,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(label),
//         Wrap(
//           spacing: 8.0,
//           children: availableColors.map((color) {
//             return FilterChip(
//               label: Text(color),
//               selected: selectedColors.contains(color),
//               onSelected: (selected) {
//                 List<String> updatedColors = List.from(selectedColors);
//                 selected
//                     ? updatedColors.add(color)
//                     : updatedColors.remove(color);

//                 onSelectionChanged(updatedColors);
//               },
//             );
//           }).toList(),
//         ),
//       ],
//     );
//   }

//   Widget _buildCheckboxField(
//       String label, bool value, Function(bool?) onChanged) {
//     return CheckboxListTile(
//       title: Text(label),
//       value: value,
//       onChanged: (newValue) {
//         setState(() {
//           onChanged(newValue);
//         });
//       },
//     );
//   }

//   Widget _buildExpansionTile({
//     required String title,
//     required bool isExpanded,
//     required Function(bool) onExpand,
//     required Widget content,
//   }) {
//     return Theme(
//       data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
//       child: ExpansionTile(
//         title: Text(title, style: AppTextStyle.texttstyle),
//         initiallyExpanded: isExpanded,
//         onExpansionChanged: onExpand,
//         children: [
//           Padding(padding: const EdgeInsets.all(16.0), child: content)
//         ],
//       ),
//     );
//   }
// }
