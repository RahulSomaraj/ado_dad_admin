import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/features/vehicle_model/bloc/vehicle_model_bloc.dart';
import 'package:ado_dad_admin/models/vehicle_model/vehicle_model.dart';
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          _buildHeaderSection(),
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 250, vertical: 12),
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
                if (query.isNotEmpty) {
                  context.read<VehicleModelBloc>().add(FetchAllVehicleModels(
                      page: 1, limit: 10, searchQuery: query));
                } else {
                  context.read<VehicleModelBloc>().add(FetchAllVehicleModels(
                      page: 1, limit: 10, searchQuery: ''));
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

    return Padding(
      padding: const EdgeInsets.all(20),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
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
          isTablet ? 'Launch Year' : 'Launch Year',
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
          isTablet ? 'Body Type' : 'Body Type',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      DataColumn(
        label: Text(
          isTablet ? 'Images' : 'Images',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      DataColumn(
        label: Text(
          isTablet ? 'Brochur' : 'Brochur',
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
      DataColumn(
        label: Text(
          isTablet ? 'Price' : 'Price Range',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      DataColumn(
        label: Text(
          isTablet ? 'Fuel' : 'Fuel Types',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      DataColumn(
        label: Text(
          isTablet ? 'Transmission' : 'Transmission',
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
      DataCell(Text(models.manufacturer.name)),
      DataCell(Text(models.vehicleType)),
      DataCell(SizedBox(
          width: 150,
          child: Text(
            models.description!,
            softWrap: true,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ))),
      DataCell(SizedBox(
          width: 150,
          child: Text(
            models.launchYear.toString(),
            softWrap: true,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ))),
      DataCell(SizedBox(
          width: 150,
          child: Text(
            models.segment!,
            softWrap: true,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ))),
      DataCell(Text(models.bodyType!)),
      DataCell(SizedBox(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: models.images!.map((img) {
            return Text(
              img,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12),
            );
          }).toList(),
        ),
      )),
      DataCell(SizedBox(
          width: 150,
          child: Text(
            models.brochureUrl!,
            maxLines: 2,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ))),
      DataCell(Text(models.isActive.toString())),
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
      DataCell(Text(
        (models.priceRange?.min != null && models.priceRange?.max != null)
            ? '₹${models.priceRange!.min} - ₹${models.priceRange!.max}'
            : '-',
      )),
      DataCell(SizedBox(
        width: 120,
        child: Text(
          models.availableFuelTypes?.join(', ') ?? '-',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 12),
        ),
      )),
      DataCell(SizedBox(
        width: 120,
        child: Text(
          models.availableTransmissionTypes?.join(', ') ?? '-',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 12),
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
                context.push('/edit-vehicle_model', extra: models);
              },
            ),
            IconButton(
              icon: const Icon(Icons.remove_red_eye_outlined,
                  color: Color.fromARGB(255, 20, 20, 20)),
              onPressed: () {
                context.push('/view-vehicle_model', extra: models);
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
                  context
                      .read<VehicleModelBloc>()
                      .add(FetchAllVehicleModels(page: 1, limit: rowsPerPage));
                }
              },
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: currentPage > 1
                  ? () {
                      context.read<VehicleModelBloc>().add(
                          FetchAllVehicleModels(
                              page: currentPage - 1, limit: rowsPerPage));
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
                      context.read<VehicleModelBloc>().add(
                          FetchAllVehicleModels(
                              page: currentPage + 1, limit: rowsPerPage));
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
