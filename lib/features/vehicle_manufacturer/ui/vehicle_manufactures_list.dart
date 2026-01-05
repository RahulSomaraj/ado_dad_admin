import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/features/vehicle_manufacturer/bloc/bloc/vehicle_manufacturer_bloc.dart';
import 'package:ado_dad_admin/models/vehicle_manufacturer/vehicle_manufacturer_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VehicleManufacturesList extends StatefulWidget {
  const VehicleManufacturesList({super.key});

  @override
  State<VehicleManufacturesList> createState() =>
      _VehicleManufacturesListState();
}

class _VehicleManufacturesListState extends State<VehicleManufacturesList> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _horizontalScrollController = ScrollController();
  String? _selectedCategory;

  @override
  void initState() {
    super.initState();
    // Fetch vehicle manufacturers when the page is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<VehicleManufacturerBloc>()
          .add(const FetchAllVehicleManufacturers(
            page: 1,
            limit: 10,
          ));
    });
  }

  /// Helper method to create FetchAllVehicleManufacturers event
  FetchAllVehicleManufacturers _createFetchEvent({
    required int page,
    required int limit,
    String? searchQuery,
    String? category,
  }) {
    // Only include non-empty values
    final finalSearchQuery =
        (searchQuery != null && searchQuery.trim().isNotEmpty)
            ? searchQuery.trim()
            : null;
    final finalCategory = (category != null && category.trim().isNotEmpty)
        ? category.trim()
        : null;

    // Create event - freezed will handle null values correctly
    if (finalCategory != null && finalSearchQuery != null) {
      return FetchAllVehicleManufacturers(
        page: page,
        limit: limit,
        searchQuery: finalSearchQuery,
        category: finalCategory,
      );
    } else if (finalCategory != null) {
      return FetchAllVehicleManufacturers(
        page: page,
        limit: limit,
        category: finalCategory,
      );
    } else if (finalSearchQuery != null) {
      return FetchAllVehicleManufacturers(
        page: page,
        limit: limit,
        searchQuery: finalSearchQuery,
      );
    } else {
      return FetchAllVehicleManufacturers(
        page: page,
        limit: limit,
      );
    }
  }

  void _onCategoryChanged(String? category) {
    setState(() {
      _selectedCategory = category;
    });
    // Reset to page 1 when category changes
    final searchQuery = _searchController.text.trim().isEmpty
        ? null
        : _searchController.text.trim();

    context.read<VehicleManufacturerBloc>().add(
          _createFetchEvent(
            page: 1,
            limit: rowsPerPage,
            searchQuery: searchQuery,
            category: category,
          ),
        );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _horizontalScrollController.dispose();
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
          _buildCategoryFilterSection(),
          const SizedBox(height: 20),
          _buildCompanyList(),
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
                    "Vehicle Manufacturer Management",
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
                    "Vehicle Manufacturer Management",
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
                final searchQuery = query.trim().isEmpty ? null : query.trim();
                context.read<VehicleManufacturerBloc>().add(
                      _createFetchEvent(
                        page: 1,
                        limit: rowsPerPage,
                        searchQuery: searchQuery,
                        category: _selectedCategory,
                      ),
                    );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryFilterSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Align(
        alignment: Alignment.centerRight,
        child: _buildCategoryDropdown(),
      ),
    );
  }

  Widget _buildCategoryDropdown() {
    return Container(
      width: 200,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.blackColor),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: DropdownButton<String>(
        value: _selectedCategory,
        hint: const Text(
          'Select Category',
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        isExpanded: true,
        underline: const SizedBox(),
        icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
        items: [
          const DropdownMenuItem<String>(
            value: null,
            child: Text('All Categories', style: TextStyle(fontSize: 14)),
          ),
          const DropdownMenuItem<String>(
            value: 'two_wheeler',
            child: Text('Two Wheeler', style: TextStyle(fontSize: 14)),
          ),
          const DropdownMenuItem<String>(
            value: 'passenger_car',
            child: Text('Passenger Car', style: TextStyle(fontSize: 14)),
          ),
          const DropdownMenuItem<String>(
            value: 'commercial_vehicle',
            child: Text('Commercial Vehicle', style: TextStyle(fontSize: 14)),
          ),
          const DropdownMenuItem<String>(
            value: 'luxury',
            child: Text('Luxury', style: TextStyle(fontSize: 14)),
          ),
          const DropdownMenuItem<String>(
            value: 'suv',
            child: Text('SUV', style: TextStyle(fontSize: 14)),
          ),
        ],
        onChanged: _onCategoryChanged,
      ),
    );
  }

  Widget _buildAddButton() {
    final isTablet = MediaQuery.of(context).size.width < 900 &&
        MediaQuery.of(context).size.width >= 550;
    return SizedBox(
      width: isTablet ? double.infinity : 280,
      height: 50,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final buttonWidth = constraints.maxWidth;

          // Dynamically adjust content based on width
          double iconSize = buttonWidth < 180 ? 18 : 20;
          double fontSize = buttonWidth < 180 ? 12 : 14;
          double spacing = buttonWidth < 180 ? 4 : 6;

          // Shorten text on very narrow screens
          String buttonText = buttonWidth < 180
              ? 'Add Manufacturer'
              : (isTablet ? 'Add Manufacturer' : 'Add Vehicle Manufacturer');

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
              // context.push('/add-vehiclemanufacturer');
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) {
                  context.push('/add-vehiclemanufacturer');
                }
              });
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment:
                  isTablet ? MainAxisAlignment.center : MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.add,
                  color: AppColors.primaryColor,
                  size: iconSize,
                ),
                SizedBox(width: spacing),
                Flexible(
                  child: Text(
                    buttonText,
                    style: TextStyle(fontSize: fontSize),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCompanyList() {
    return BlocBuilder<VehicleManufacturerBloc, VehicleManufacturerState>(
      builder: (context, state) {
        return state.when(
          initial: () =>
              const Center(child: Text("No Vehicle Manufactures Found")),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (response) {
            return Column(
              children: [
                _buildCompanyTable(response.data, response.page),
                const SizedBox(height: 30),
                _buildPaginationBar(response.page, response.totalPages),
              ],
            );
          },
          error: (message) => Center(
            child: Text(message, style: const TextStyle(color: Colors.red)),
          ),
          dropdownLoaded: (_) => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _buildCompanyTable(
      List<VehicleManufacturer> manufactures, int currentPage) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600 && screenWidth <= 900;

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
                      columnSpacing: isTablet ? 20 : 40,
                      headingRowColor: WidgetStateColor.resolveWith(
                        (states) => const Color.fromARGB(66, 144, 140, 140),
                      ),
                      dataRowColor:
                          WidgetStatePropertyAll(AppColors.primaryColor),
                      dataRowMinHeight: isTablet ? 45 : 55,
                      dataRowMaxHeight: isTablet ? 45 : 55,
                      columns: _buildResponsiveColumns(isTablet),
                      rows: manufactures
                          .asMap()
                          .entries
                          .map((entry) => _buildCompanyRow(
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
          isTablet ? 'Origin Country' : 'Origin Country ',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      DataColumn(
        label: Text(
          isTablet ? 'Is Premium' : 'Is Premium',
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

  DataRow _buildCompanyRow(
      int index, VehicleManufacturer manufacturer, int currentPage) {
    int rowNumber = ((currentPage - 1) * rowsPerPage) + index + 1;
    return DataRow(cells: [
      DataCell(Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Text('$rowNumber'),
      )),
      DataCell(Container(
        width: 120,
        child: Text(
          manufacturer.name,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      )),
      DataCell(Container(
        width: 120,
        child: Text(
          manufacturer.displayName,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      )),
      DataCell(Container(
        width: 100,
        child: Text(
          manufacturer.originCountry,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      )),
      DataCell(Container(
        width: 80,
        child: Text(
          manufacturer.isPremium ? 'Yes' : 'No',
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      )),
      DataCell(
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit,
                  color: Color.fromARGB(255, 59, 59, 59)),
              onPressed: () {
                context.push('/edit-vehicle_manufacturer', extra: manufacturer);
              },
            ),
            IconButton(
              icon: const Icon(Icons.remove_red_eye_outlined,
                  color: Color.fromARGB(255, 20, 20, 20)),
              onPressed: () {
                context.push('/view-vehicle_manufacturer', extra: manufacturer);
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
                  final searchQuery = _searchController.text.trim().isEmpty
                      ? null
                      : _searchController.text.trim();
                  context.read<VehicleManufacturerBloc>().add(_createFetchEvent(
                        page: 1,
                        limit: rowsPerPage,
                        searchQuery: searchQuery,
                        category: _selectedCategory,
                      ));
                }
              },
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: currentPage > 1
                  ? () {
                      final searchQuery = _searchController.text.trim().isEmpty
                          ? null
                          : _searchController.text.trim();
                      context
                          .read<VehicleManufacturerBloc>()
                          .add(_createFetchEvent(
                            page: currentPage - 1,
                            limit: rowsPerPage,
                            searchQuery: searchQuery,
                            category: _selectedCategory,
                          ));
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
                      final searchQuery = _searchController.text.trim().isEmpty
                          ? null
                          : _searchController.text.trim();
                      context
                          .read<VehicleManufacturerBloc>()
                          .add(_createFetchEvent(
                            page: currentPage + 1,
                            limit: rowsPerPage,
                            searchQuery: searchQuery,
                            category: _selectedCategory,
                          ));
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
