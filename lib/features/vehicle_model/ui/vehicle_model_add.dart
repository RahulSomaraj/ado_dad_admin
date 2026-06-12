import 'dart:async';

import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/features/vehicle_manufacturer/bloc/bloc/vehicle_manufacturer_bloc.dart';
import 'package:ado_dad_admin/features/vehicle_model/bloc/vehicle_model_bloc.dart';
import 'package:ado_dad_admin/features/widgets/form_kit.dart';
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
  int _manufacturerCurrentPage = 1;
  bool _hasMoreManufacturers = true;
  bool _isLoadingMoreManufacturers = false;
  String _manufacturerSearchQuery = '';
  final TextEditingController _manufacturerSearchController =
      TextEditingController();
  StateSetter? _menuSetState;
  Timer? _searchDebounceTimer;
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
        fuelTypes:
            _selectedFuelTypeKeys.isNotEmpty ? _selectedFuelTypeKeys : null,
        transmissionTypes: _selectedTransmissionKeys.isNotEmpty
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
    final int currentYear = now.year;
    final int startYear = 1700;
    final int endYear = currentYear + 1;
    final int? initialYear = _launchyear?.isNotEmpty == true
        ? int.tryParse(_launchyear!)
        : currentYear;

    final int? selectedYear = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        int? selectedYear = initialYear;
        int displayStartYear = initialYear != null
            ? ((initialYear ~/ 12) * 12)
            : ((currentYear ~/ 12) * 12);
        if (displayStartYear < startYear) displayStartYear = startYear;
        if (displayStartYear + 11 > endYear) displayStartYear = endYear - 11;

        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Select Launch Year'),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.chevron_left),
                        onPressed: displayStartYear - 12 >= startYear
                            ? () {
                                setDialogState(() {
                                  displayStartYear -= 12;
                                });
                              }
                            : null,
                      ),
                      Text(
                        '$displayStartYear - ${displayStartYear + 11}',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: Icon(Icons.chevron_right),
                        onPressed: displayStartYear + 12 <= endYear - 11
                            ? () {
                                setDialogState(() {
                                  displayStartYear += 12;
                                });
                              }
                            : null,
                      ),
                    ],
                  ),
                ],
              ),
              content: SizedBox(
                width: 300,
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 2.5,
                  ),
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    final year = displayStartYear + index;
                    if (year > endYear) return SizedBox.shrink();
                    final isSelected = year == selectedYear;

                    return InkWell(
                      onTap: () {
                        setDialogState(() {
                          selectedYear = year;
                        });
                        Navigator.of(context).pop(year);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.blackColor
                              : Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: isSelected
                                ? AppColors.blackColor
                                : Colors.grey[300]!,
                            width: isSelected ? 2 : 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            year.toString(),
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
              ],
            );
          },
        );
      },
    );

    if (selectedYear != null && mounted) {
      setState(() {
        _launchyear = selectedYear.toString();
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
  void dispose() {
    _manufacturerSearchController.dispose();
    _searchDebounceTimer?.cancel();
    super.dispose();
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
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormHeaderBar(
                  breadcrumb: "Vehicle Models / Add",
                  title: "Add Model",
                  onBack: () {
                    if (mounted) {
                      context.pop();
                      context
                          .read<VehicleModelBloc>()
                          .add(FetchAllVehicleModels());
                    }
                  },
                ),
                const SizedBox(height: 16),
                _buildVehicleModelForm(state),
                const SizedBox(height: 50),
              ],
            ),
          );
        },
      ),
    );
  }

  // ignore: unused_element
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
        child: Container(
          decoration: formCardDecoration(),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FormHeaderStrip(
                icon: Icons.directions_car_outlined,
                title: "New model",
                subtitle: "Add a vehicle model to the catalog",
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _modelFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FormSectionTitle("Basics"),
                      _buildFormRow([
                        _buildFormField(
                            "Model Name", "", (v) => _modelname = v!),
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
                        dropdownLoaded: (manufacturers, currentPage, hasNext) {
                          // Update pagination state
                          _manufacturerCurrentPage = currentPage;
                          _hasMoreManufacturers = hasNext;
                          _isLoadingMoreManufacturers = false;

                          return _buildFormRow([
                            _buildManufacturerDropdown(
                              manufacturers: manufacturers,
                              currentPage: currentPage,
                              hasNext: hasNext,
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
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        backgroundColor: AppColors.accent,
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormRow(List<Widget> children) => TwoColGrid(children);

  Widget _buildFormField(
    String label,
    String initialValue,
    Function(String?) onSaved, {
    bool isRequired = true,
  }) {
    return LabeledField(
      label: label,
      child: TextFormField(
        decoration: formInputDecoration("Enter ${label.toLowerCase()}"),
        validator: (value) {
          if (isRequired && (value == null || value.isEmpty)) {
            return "$label is required";
          }
          return null;
        },
        onSaved: onSaved,
      ),
    );
  }

  Widget _buildManufacturerDropdown({
    required List<VehicleManufacturer> manufacturers,
    required int currentPage,
    required bool hasNext,
  }) {
    final GlobalKey dropdownKey = GlobalKey();

    return FormField<VehicleManufacturer>(
      initialValue: _selectedManufacturer,
      validator: (value) => value == null ? 'Manufacturer is required' : null,
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => _showManufacturerDropdown(
                context,
                dropdownKey,
                manufacturers,
                currentPage,
                hasNext,
                (value) {
                  setState(() {
                    _selectedManufacturer = value;
                  });
                  field.didChange(value);
                },
              ),
              child: Container(
                key: dropdownKey,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: field.hasError ? Colors.red : Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectedManufacturer?.name ?? 'Select Manufacturer',
                        style: TextStyle(
                          color: _selectedManufacturer == null
                              ? Colors.grey[600]
                              : Colors.black,
                        ),
                      ),
                    ),
                    const Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),
            if (field.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 12),
                child: Text(
                  field.errorText ?? '',
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
          ],
        );
      },
    );
  }

  void _showManufacturerDropdown(
    BuildContext context,
    GlobalKey dropdownKey,
    List<VehicleManufacturer> manufacturers,
    int currentPage,
    bool hasNext,
    void Function(VehicleManufacturer?) onChanged,
  ) {
    _manufacturerSearchController.clear();
    _manufacturerSearchQuery = '';
    // Reset pagination if needed
    if (manufacturers.length < 10) {
      _manufacturerCurrentPage = 1;
      _hasMoreManufacturers = true;
    }

    final RenderBox? renderBox =
        dropdownKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final Size size = renderBox.size;
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600 && screenWidth <= 900;
    final dropdownWidth = isTablet ? size.width : 300.0;

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        offset.dx + size.width - dropdownWidth, // Right align
        offset.dy + size.height + 5, // Below the dropdown
        offset.dx + size.width,
        offset.dy + size.height + 305, // Max height
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      items: [
        PopupMenuItem<String>(
          enabled: false,
          padding: EdgeInsets.zero,
          child: StatefulBuilder(
            builder: (context, setMenuState) {
              // Store reference to setMenuState so we can update the menu when manufacturers change
              _menuSetState = setMenuState;

              return BlocBuilder<VehicleManufacturerBloc,
                  VehicleManufacturerState>(
                builder: (context, state) {
                  List<VehicleManufacturer> currentManufacturers =
                      manufacturers;
                  bool isLoadingMore = _isLoadingMoreManufacturers;
                  bool hasMore = _hasMoreManufacturers;
                  int currentPageValue = _manufacturerCurrentPage;

                  state.maybeWhen(
                    dropdownLoaded: (data, page, next) {
                      currentManufacturers = data;
                      isLoadingMore = false;
                      hasMore = next;
                      currentPageValue = page;
                      _isLoadingMoreManufacturers = false;
                      _hasMoreManufacturers = next;
                      _manufacturerCurrentPage = page;
                      // Update the menu if it's open - defer to after build
                      if (_menuSetState != null) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (_menuSetState != null) {
                            _menuSetState!(() {
                              // Trigger rebuild of the menu
                            });
                          }
                        });
                      }
                    },
                    orElse: () {},
                  );

                  // When searching, use the API results directly (no local filtering needed)
                  // When not searching, show all loaded manufacturers
                  final filteredList = currentManufacturers;

                  return Container(
                    width: dropdownWidth - 2, // Account for border
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Search box
                        TextField(
                          controller: _manufacturerSearchController,
                          autofocus: true,
                          decoration: InputDecoration(
                            hintText: 'Search manufacturers...',
                            prefixIcon: const Icon(Icons.search, size: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            isDense: true,
                          ),
                          style: const TextStyle(fontSize: 14),
                          onChanged: (value) {
                            setMenuState(() {
                              _manufacturerSearchQuery = value;
                            });

                            // Cancel previous timer
                            _searchDebounceTimer?.cancel();

                            // If search query is not empty, make API call with debounce
                            if (value.isNotEmpty) {
                              _searchDebounceTimer =
                                  Timer(const Duration(milliseconds: 500), () {
                                // Reset pagination for search
                                setState(() {
                                  _manufacturerCurrentPage = 1;
                                  _hasMoreManufacturers = true;
                                  _isLoadingMoreManufacturers = false;
                                });

                                context.read<VehicleManufacturerBloc>().add(
                                      FetchAllManufacturersForDropdown(
                                        page: 1,
                                        limit: 10,
                                        loadMore: false,
                                        searchQuery: value,
                                      ),
                                    );
                              });
                            } else {
                              // If search is cleared, reload without search
                              setState(() {
                                _manufacturerCurrentPage = 1;
                                _hasMoreManufacturers = true;
                                _isLoadingMoreManufacturers = false;
                              });

                              context.read<VehicleManufacturerBloc>().add(
                                    FetchAllManufacturersForDropdown(
                                      page: 1,
                                      limit: 10,
                                      loadMore: false,
                                      searchQuery: null,
                                    ),
                                  );
                            }
                          },
                        ),
                        const SizedBox(height: 8),
                        // Filtered list
                        Container(
                          constraints: const BoxConstraints(maxHeight: 250),
                          child: filteredList.isEmpty &&
                                  _manufacturerSearchQuery.isNotEmpty
                              ? const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text(
                                    'No manufacturers found',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                  ),
                                )
                              : NotificationListener<ScrollNotification>(
                                  onNotification: (notification) {
                                    // Only load more if there's no active search query
                                    if (_manufacturerSearchQuery.isEmpty &&
                                        (notification
                                                is ScrollUpdateNotification ||
                                            notification
                                                is ScrollEndNotification)) {
                                      final metrics = notification.metrics;
                                      // Check if list is scrollable and near the bottom
                                      if (metrics.maxScrollExtent > 0 &&
                                          metrics.pixels >=
                                              metrics.maxScrollExtent - 100) {
                                        // Get the latest state values to avoid stale data
                                        final currentState = context
                                            .read<VehicleManufacturerBloc>()
                                            .state;
                                        bool shouldLoadMore = false;
                                        bool isCurrentlyLoading =
                                            _isLoadingMoreManufacturers;

                                        currentState.maybeWhen(
                                          dropdownLoaded: (data, page, next) {
                                            // Only load if hasNext is true and we're not already loading
                                            shouldLoadMore =
                                                next && !isCurrentlyLoading;
                                          },
                                          orElse: () {
                                            shouldLoadMore = false;
                                          },
                                        );

                                        // Only trigger if we have more to load and not already loading
                                        if (shouldLoadMore) {
                                          setState(() {
                                            _isLoadingMoreManufacturers = true;
                                            _manufacturerCurrentPage =
                                                currentPageValue + 1;
                                          });
                                          context
                                              .read<VehicleManufacturerBloc>()
                                              .add(
                                                FetchAllManufacturersForDropdown(
                                                  page: currentPageValue + 1,
                                                  limit: 10,
                                                  loadMore: true,
                                                ),
                                              );
                                        }
                                      }
                                    }
                                    return false;
                                  },
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const AlwaysScrollableScrollPhysics(),
                                    itemCount: filteredList.length +
                                        (_manufacturerSearchQuery.isEmpty &&
                                                hasMore &&
                                                isLoadingMore
                                            ? 1
                                            : 0), // +1 for loading indicator
                                    itemBuilder: (context, index) {
                                      // Show loading indicator at the end if loading more and no search query
                                      if (_manufacturerSearchQuery.isEmpty &&
                                          hasMore &&
                                          isLoadingMore &&
                                          index == filteredList.length) {
                                        return const Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: Center(
                                            child: SizedBox(
                                              width: 20,
                                              height: 20,
                                              child: CircularProgressIndicator(
                                                  strokeWidth: 2),
                                            ),
                                          ),
                                        );
                                      }

                                      final manufacturer = filteredList[index];
                                      final isSelected =
                                          _selectedManufacturer?.id ==
                                              manufacturer.id;

                                      return InkWell(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                          onChanged(manufacturer);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 12),
                                          color: isSelected
                                              ? Colors.grey[200]
                                              : null,
                                          child: Text(
                                            manufacturer.name,
                                            style:
                                                const TextStyle(fontSize: 14),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    ).then((_) {
      // Clear the menu state reference when menu is closed
      _menuSetState = null;
    });
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
      isExpanded: true,
      items: items
          .map((item) => DropdownMenuItem<T>(
                value: item,
                child: Text(
                  getLabel(item),
                  overflow: TextOverflow.ellipsis,
                ),
              ))
          .toList(),
      selectedItemBuilder: (context) {
        return items.map((item) {
          return Text(
            getLabel(item),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          );
        }).toList();
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
