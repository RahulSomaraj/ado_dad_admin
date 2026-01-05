import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/features/vehicle_model/bloc/vehicle_model_bloc.dart';
import 'package:ado_dad_admin/models/vehicle_model/vehicle_model.dart';
import 'package:ado_dad_admin/models/vehicle_manufacturer/vehicle_manufacturer_model.dart';
import 'package:ado_dad_admin/repositories/vehicle_manufacturer_rep.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VehicleModelsList extends StatefulWidget {
  const VehicleModelsList({super.key});

  @override
  State<VehicleModelsList> createState() => _VehicleModelsListState();
}

class _VehicleModelsListState extends State<VehicleModelsList> {
  final TextEditingController _searchController = TextEditingController();
  VehicleModelResponse? _lastListResponse;
  final ScrollController _horizontalScrollController = ScrollController();
  final VehicleManufacturerRepository _manufacturerRepository =
      VehicleManufacturerRepository();
  List<VehicleManufacturer> _manufacturers = [];
  String? _selectedManufacturerId;
  bool _isLoadingManufacturers = false;
  String _manufacturerSearchQuery = '';
  final TextEditingController _manufacturerSearchController = TextEditingController();
  final GlobalKey _dropdownKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    // Fetch manufacturers and vehicle models when the page is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchManufacturers();
      context
          .read<VehicleModelBloc>()
          .add(const VehicleModelEvent.fetchAllModels());
    });
  }

  Future<void> _fetchManufacturers() async {
    setState(() {
      _isLoadingManufacturers = true;
    });
    try {
      final response =
          await _manufacturerRepository.fetchDropDownManufacturers();
      setState(() {
        _manufacturers = response.data;
        _isLoadingManufacturers = false;
      });
    } catch (e) {
      setState(() {
        _isLoadingManufacturers = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load manufacturers: $e')),
        );
      }
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _horizontalScrollController.dispose();
    _manufacturerSearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          _buildHeaderSection(),
          const SizedBox(height: 20),
          _buildManufacturerFilter(),
          const SizedBox(height: 20),
          _buildVehicleModelsList(),
        ],
      ),
    );
  }

  Widget _buildHeaderSection() {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600 && screenWidth <= 900;

    return Padding(
      padding: const EdgeInsets.all(15),
      child: isTablet
          ? Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth < 600 ? 20 : 100, vertical: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Vehicle Model Management",
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildSearchBar(),
                  const SizedBox(height: 12),
                  _buildAddButton(),
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Vehicle Model Management",
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  _buildSearchBar(),
                  const SizedBox(width: 15),
                  _buildAddButton(),
                ],
              ),
            ),
    );
  }

  Widget _buildSearchBar() {
    final isTablet = MediaQuery.of(context).size.width < 900 &&
        MediaQuery.of(context).size.width >= 550;
    return Container(
      width: isTablet ? double.infinity : 200,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.blackColor)),
      child: Row(
        children: [
          const SizedBox(width: 8),
          const Icon(
            Icons.search,
            color: Colors.black,
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: "Search...",
                hintStyle: TextStyle(fontSize: 14),
                border: InputBorder.none,
              ),
              style: const TextStyle(fontSize: 14),
              onChanged: (query) {
                if (_selectedManufacturerId == null) {
                  if (query.isNotEmpty) {
                    context.read<VehicleModelBloc>().add(FetchAllVehicleModels(
                        page: 1, limit: rowsPerPage, searchQuery: query));
                  } else {
                    context.read<VehicleModelBloc>().add(FetchAllVehicleModels(
                        page: 1, limit: rowsPerPage, searchQuery: ''));
                  }
                } else {
                  // When manufacturer is selected, search is handled by the API
                  // We still need to fetch by manufacturer
                  context.read<VehicleModelBloc>().add(
                      VehicleModelEvent.fetchByManufacturer(
                          _selectedManufacturerId!,
                          page: 1,
                          limit: rowsPerPage));
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddButton() {
    final isTablet = MediaQuery.of(context).size.width < 900 &&
        MediaQuery.of(context).size.width >= 550;
    return SizedBox(
      width: isTablet ? double.infinity : 260,
      height: 50,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final buttonWidth = constraints.maxWidth;

          // Dynamically adjust content based on width
          double iconSize = buttonWidth < 180 ? 18 : 20;
          double fontSize = buttonWidth < 180 ? 14 : 16;
          double spacing = buttonWidth < 180 ? 6 : 8;
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.blackColor,
              foregroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) {
                  context.push('/add-vehiclemodel');
                }
              });
            },
            child: Row(
              mainAxisAlignment:
                  isTablet ? MainAxisAlignment.center : MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.add,
                  color: AppColors.primaryColor,
                  size: iconSize,
                ),
                SizedBox(width: spacing),
                Text(
                  isTablet ? 'Add Model' : 'Add Vehicle Model',
                  style: TextStyle(fontSize: fontSize),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildManufacturerFilter() {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600 && screenWidth <= 900;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          width: isTablet ? double.infinity : 300,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.blackColor),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              const Icon(
                Icons.filter_alt,
                color: Colors.black,
                size: 20,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _isLoadingManufacturers
                    ? const Center(
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      )
                    : _buildSearchableDropdown(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchableDropdown() {
    VehicleManufacturer? selectedManufacturer;
    if (_selectedManufacturerId != null && _manufacturers.isNotEmpty) {
      try {
        selectedManufacturer = _manufacturers.firstWhere(
          (m) => m.id == _selectedManufacturerId,
        );
      } catch (e) {
        // Manufacturer not found, keep as null
        selectedManufacturer = null;
      }
    }

    return GestureDetector(
      onTap: () => _showManufacturerDropdown(),
      child: Container(
        key: _dropdownKey,
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Expanded(
              child: Text(
                selectedManufacturer?.displayName ?? 'Filter by Manufacturer',
                style: TextStyle(
                  fontSize: 14,
                  color: selectedManufacturer != null
                      ? Colors.black
                      : Colors.grey[600],
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Icon(Icons.arrow_drop_down, color: Colors.black),
          ],
        ),
      ),
    );
  }

  void _showManufacturerDropdown() {
    _manufacturerSearchController.clear();
    _manufacturerSearchQuery = '';

    final RenderBox? renderBox = _dropdownKey.currentContext?.findRenderObject() as RenderBox?;
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
              // Filter manufacturers based on current search query
              final filteredList = _manufacturerSearchQuery.isEmpty
                  ? _manufacturers
                  : _manufacturers.where((manufacturer) {
                      return manufacturer.displayName
                              .toLowerCase()
                              .contains(_manufacturerSearchQuery.toLowerCase()) ||
                          manufacturer.name
                              .toLowerCase()
                              .contains(_manufacturerSearchQuery.toLowerCase());
                    }).toList();

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
                      },
                    ),
                    const SizedBox(height: 8),
                    // Filtered list
                    Container(
                      constraints: const BoxConstraints(maxHeight: 250),
                      child: filteredList.isEmpty && _manufacturerSearchQuery.isNotEmpty
                          ? const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'No manufacturers found',
                                style: TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: filteredList.length + 1, // +1 for "All Manufacturers"
                              itemBuilder: (context, index) {
                                if (index == 0) {
                                  // "All Manufacturers" option
                                  final isSelected = _selectedManufacturerId == null;
                                  return InkWell(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                      setState(() {
                                        _selectedManufacturerId = null;
                                      });
                                      context.read<VehicleModelBloc>().add(
                                          FetchAllVehicleModels(
                                              page: 1, limit: rowsPerPage));
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 12),
                                      color: isSelected ? Colors.grey[200] : null,
                                      child: const Text(
                                        'All Manufacturers',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  );
                                }

                                final manufacturer = filteredList[index - 1];
                                final isSelected = _selectedManufacturerId == manufacturer.id;

                                return InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                    setState(() {
                                      _selectedManufacturerId = manufacturer.id;
                                    });
                                    context.read<VehicleModelBloc>().add(
                                        VehicleModelEvent.fetchByManufacturer(
                                            manufacturer.id,
                                            page: 1,
                                            limit: rowsPerPage));
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 12),
                                    color: isSelected ? Colors.grey[200] : null,
                                    child: Text(
                                      manufacturer.displayName,
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _renderFromCacheOrEmpty() {
    if (_lastListResponse == null) return const SizedBox.shrink();
    final r = _lastListResponse!;
    return Column(
      children: [
        _buildVehicleModelsTable(r.data, r.page),
        const SizedBox(height: 30),
        _buildPaginationBar(r.page, r.totalPages),
      ],
    );
  }

  Widget _buildVehicleModelsList() {
    return BlocBuilder<VehicleModelBloc, VehicleModelState>(
      builder: (context, state) {
        // return state.when(
        //   initial: () => const Center(child: Text("No Vehicle Models Found")),
        //   loading: () => const Center(child: CircularProgressIndicator()),
        //   loaded: (response) {
        //     return Column(
        //       children: [
        //         _buildVehicleModelsTable(response.data, response.page),
        //         const SizedBox(height: 30),
        //         _buildPaginationBar(response.page, response.totalPages),
        //       ],
        //     );
        //   },
        //   error: (message) => Center(
        //     child: Text(message, style: const TextStyle(color: Colors.red)),
        //   ),
        //   optionsLoaded: (fuelTypes, transmissionTypes) => _lastListResponse !=
        //           null
        //       ? Column(
        //           children: [
        //             _buildVehicleModelsTable(
        //                 _lastListResponse!.data, _lastListResponse!.page),
        //             const SizedBox(height: 30),
        //             _buildPaginationBar(
        //                 _lastListResponse!.page, _lastListResponse!.totalPages),
        //           ],
        //         )
        //       : const SizedBox.shrink(),
        // );
        return state.when(
          initial: () => const Center(child: Text("No Vehicle Models Found")),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (response) {
            _lastListResponse = response;
            return Column(
              children: [
                _buildVehicleModelsTable(response.data, response.page),
                const SizedBox(height: 30),
                _buildPaginationBar(response.page, response.totalPages),
              ],
            );
          },
          error: (message) => Center(
            child: Text(message, style: const TextStyle(color: Colors.red)),
          ),
          optionsLoaded: (_, __) => _renderFromCacheOrEmpty(),
          oneLoaded: (_) => _renderFromCacheOrEmpty(),
          created: () => Center(),
          updated: () => Center(), // 👈 handled, but no list fetch
        );
      },
    );
  }

  Widget _buildVehicleModelsTable(List<VehicleModel> models, int currentPage) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600 && screenWidth <= 900;

    // Add null safety check for models list
    if (models.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            "No vehicle models found",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(20),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Scrollbar(
            thumbVisibility: true,
            controller: _horizontalScrollController,
            child: SingleChildScrollView(
              controller: _horizontalScrollController,
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: constraints.maxWidth),
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: DataTable(
                      columnSpacing: isTablet ? 20 : 25,
                      headingRowColor: WidgetStateColor.resolveWith(
                        (states) => const Color.fromARGB(66, 144, 140, 140),
                      ),
                      dataRowColor:
                          WidgetStatePropertyAll(AppColors.primaryColor),
                      dataRowMinHeight: isTablet ? 45 : 55,
                      dataRowMaxHeight: isTablet ? 45 : 55,
                      columns: _buildResponsiveColumns(isTablet),
                      rows: models
                          .asMap()
                          .entries
                          .map((entry) => _buildVehicleModelRow(
                              entry.key, entry.value, currentPage))
                          .toList(),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  List<DataColumn> _buildResponsiveColumns(bool isTablet) {
    return [
      const DataColumn(
        label: Padding(
          padding: EdgeInsets.only(left: 30),
          child: Text(
            'ID',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      DataColumn(
        label: Text(
          isTablet ? 'Name' : 'Name',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      DataColumn(
        label: Text(
          isTablet ? 'Display Name' : 'Display Name',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      DataColumn(
        label: Text(
          isTablet ? 'Manufacturer' : 'Manufacturer',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      DataColumn(
        label: Text(
          isTablet ? 'Vehicle Type' : 'Vehicle Type',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      DataColumn(
        label: Text(
          isTablet ? 'Description' : 'Description',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      DataColumn(
        label: Text(
          isTablet ? 'Segment' : 'Segment',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      DataColumn(
        label: Text(
          isTablet ? 'Is Active' : 'Is Active',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      // DataColumn(
      //   label: Text(
      //     isTablet ? 'Commercial?' : 'Commercial?',
      //     style: const TextStyle(fontWeight: FontWeight.bold),
      //   ),
      // ),
      // DataColumn(
      //   label: Text(
      //     isTablet ? 'Comm. Type' : 'Comm. Type',
      //     style: const TextStyle(fontWeight: FontWeight.bold),
      //   ),
      // ),
      // DataColumn(
      //   label: Text(
      //     isTablet ? 'Comm. Body' : 'Comm. Body',
      //     style: const TextStyle(fontWeight: FontWeight.bold),
      //   ),
      // ),
      // DataColumn(
      //   label: Text(
      //     isTablet ? 'Payload' : 'Payload',
      //     style: const TextStyle(fontWeight: FontWeight.bold),
      //   ),
      // ),
      // DataColumn(
      //   label: Text(
      //     isTablet ? 'Axles' : 'Axles',
      //     style: const TextStyle(fontWeight: FontWeight.bold),
      //   ),
      // ),
      // DataColumn(
      //   label: Text(
      //     isTablet ? 'Seats' : 'Seats',
      //     style: const TextStyle(fontWeight: FontWeight.bold),
      //   ),
      // ),
      DataColumn(
        label: Text(
          isTablet ? 'Variants' : 'Variant Count',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      const DataColumn(
        label: Text(
          'Actions',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    ];
  }

  DataRow _buildVehicleModelRow(
      int index, VehicleModel models, int currentPage) {
    int rowNumber = ((currentPage - 1) * rowsPerPage) + index + 1;
    return DataRow(cells: [
      DataCell(Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Text('$rowNumber'),
      )),
      DataCell(Text(models.name)),
      DataCell(Text(models.displayName)),
      DataCell(Text(models.manufacturer?.displayName ??
          models.manufacturer?.name ??
          'N/A')),
      DataCell(Text(models.vehicleType)),
      DataCell(SizedBox(
          width: 150,
          child: Text(
            models.description ?? 'N/A',
            softWrap: true,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ))),
      DataCell(SizedBox(
          width: 150,
          child: Text(
            models.segment ?? 'N/A',
            softWrap: true,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ))),
      DataCell(Text(models.isActive?.toString() ?? 'N/A')),
      // DataCell(Text(models.isCommercialVehicle?.toString() ?? '-')),
      // DataCell(Text(models.commercialVehicleType ?? '-')),
      // DataCell(Text(models.commercialBodyType ?? '-')),
      // DataCell(Text(models.defaultPayloadCapacity != null &&
      //         models.defaultPayloadUnit != null
      //     ? "${models.defaultPayloadCapacity} ${models.defaultPayloadUnit}"
      //     : '-')),
      // DataCell(Text(models.defaultAxleCount?.toString() ?? '-')),
      // DataCell(Text(models.defaultSeatingCapacity?.toString() ?? '-')),
      DataCell(Text(models.variantCount?.toString() ?? '-')),
      DataCell(
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit,
                  color: Color.fromARGB(255, 59, 59, 59)),
              onPressed: () {
                context.push('/edit-vehicle_model', extra: models);
              },
            ),
            IconButton(
              icon: const Icon(Icons.remove_red_eye_outlined,
                  color: Color.fromARGB(255, 20, 20, 20)),
              onPressed: () {
                if (models.id != null) {
                  context.push('/view-vehicle_model', extra: models);
                }
              },
            ),
          ],
        ),
      ),
    ]);
  }

  int rowsPerPage = 10;

  Widget _buildPaginationBar(int currentPage, int totalPages) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text("Rows per page: "),
            const SizedBox(width: 8),
            DropdownButton<int>(
              value: rowsPerPage,
              dropdownColor: Colors.white,
              items: [10, 20].map((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    rowsPerPage = value;
                  });
                  if (_selectedManufacturerId == null) {
                    context.read<VehicleModelBloc>().add(
                        FetchAllVehicleModels(page: 1, limit: rowsPerPage));
                  } else {
                    context.read<VehicleModelBloc>().add(
                        VehicleModelEvent.fetchByManufacturer(
                            _selectedManufacturerId!,
                            page: 1,
                            limit: rowsPerPage));
                  }
                }
              },
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: currentPage > 1
                  ? () {
                      if (_selectedManufacturerId == null) {
                        context.read<VehicleModelBloc>().add(
                            FetchAllVehicleModels(
                                page: currentPage - 1, limit: rowsPerPage));
                      } else {
                        context.read<VehicleModelBloc>().add(
                            VehicleModelEvent.fetchByManufacturer(
                                _selectedManufacturerId!,
                                page: currentPage - 1,
                                limit: rowsPerPage));
                      }
                    }
                  : null,
              child: Icon(
                Icons.chevron_left,
                size: 28,
                color: currentPage > 1 ? Colors.black : Colors.grey[400],
              ),
            ),
            const SizedBox(width: 15),
            Text(
              "Page $currentPage of $totalPages",
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 15),
            GestureDetector(
              onTap: currentPage < totalPages
                  ? () {
                      if (_selectedManufacturerId == null) {
                        context.read<VehicleModelBloc>().add(
                            FetchAllVehicleModels(
                                page: currentPage + 1, limit: rowsPerPage));
                      } else {
                        context.read<VehicleModelBloc>().add(
                            VehicleModelEvent.fetchByManufacturer(
                                _selectedManufacturerId!,
                                page: currentPage + 1,
                                limit: rowsPerPage));
                      }
                    }
                  : null,
              child: Icon(
                Icons.chevron_right,
                size: 28,
                color:
                    currentPage < totalPages ? Colors.black : Colors.grey[400],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
