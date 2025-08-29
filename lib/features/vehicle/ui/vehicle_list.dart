import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/features/vehicle/bloc/vehicle_bloc.dart';
import 'package:ado_dad_admin/features/vehicle_company/bloc/vehicle_company_bloc.dart';
import 'package:ado_dad_admin/models/vehicle_post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VehicleList extends StatefulWidget {
  const VehicleList({super.key});

  @override
  State<VehicleList> createState() => _VehicleListState();
}

class _VehicleListState extends State<VehicleList> {
  final TextEditingController _searchController = TextEditingController();
  int rowsPerPage = 10;

  @override
  void initState() {
    super.initState();
    context.read<VehicleBloc>().add(const FetchAllVehicles());
    context.read<VehicleCompanyBloc>().add(FetchAllVehicleCompany());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        _buildHeaderSection(),
        const SizedBox(height: 20),
        _buildVehicleList(),
      ],
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
                    "Vehicles Management",
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
                    "Vehicles Management",
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
          const Icon(Icons.search, color: Colors.black, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: "Search...",
                border: InputBorder.none,
                hintStyle: TextStyle(fontSize: 14),
              ),
              style: const TextStyle(fontSize: 14),
              onChanged: (query) {
                context.read<VehicleBloc>().add(
                      FetchAllVehicles(
                        page: 1,
                        limit: 10,
                        searchQuery: query.isNotEmpty ? query : '',
                      ),
                    );
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
      width: isTablet ? double.infinity : 160,
      height: 50,
      child: LayoutBuilder(builder: (context, constraints) {
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
          onPressed: () => context.push('/add-vehicle'),
          child: Row(
            mainAxisAlignment:
                isTablet ? MainAxisAlignment.center : MainAxisAlignment.start,
            children: [
              Icon(Icons.add, color: AppColors.primaryColor, size: iconSize),
              SizedBox(width: spacing),
              Text('Add Vehicle', style: TextStyle(fontSize: fontSize)),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildVehicleList() {
    return BlocBuilder<VehicleBloc, VehicleState>(
      builder: (context, state) {
        if (state is VehicleLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is VehicleLoaded) {
          return Column(
            children: [
              _buildVehicleTable(state.vehicles, state.currentPage),
              const SizedBox(height: 30),
              _buildPaginationBar(state.currentPage, state.totalPages),
            ],
          );
        } else if (state is VehicleError) {
          return Center(
            child:
                Text(state.message, style: const TextStyle(color: Colors.red)),
          );
        }
        return const Center(child: Text("No Vehicles Found"));
      },
    );
  }

  // Widget _buildVehicleTable(List<VehicleRequest> vehicles, int currentPage) {
  //   return Padding(
  //     padding: const EdgeInsets.all(15),
  //     child: Container(
  //       width: double.infinity,
  //       // constraints: const BoxConstraints(maxWidth: 1200),
  //       child: SingleChildScrollView(
  //         scrollDirection: Axis.horizontal,
  //         child: Card(
  //           elevation: 3,
  //           shape:
  //               RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  //           child: ClipRRect(
  //             borderRadius: BorderRadius.circular(12),
  //             child: DataTable(
  //               columnSpacing: 63,
  //               headingRowColor: WidgetStateColor.resolveWith(
  //                   (states) => const Color.fromARGB(66, 144, 140, 140)),
  //               dataRowColor: WidgetStatePropertyAll(AppColors.primaryColor),
  //               dataRowMinHeight: 55,
  //               dataRowMaxHeight: 55,
  //               columns: _buildTableColumns(),
  //               rows: vehicles
  //                   .asMap()
  //                   .entries
  //                   .map(
  //                     (entry) =>
  //                         _buildVehicleRow(entry.key, entry.value, currentPage),
  //                   )
  //                   .toList(),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildVehicleTable(List<VehicleRequest> vehicles, int currentPage) {
  //   final screenWidth = MediaQuery.of(context).size.width;
  //   final isTablet = screenWidth > 600 && screenWidth <= 900;

  //   return Padding(
  //     padding: const EdgeInsets.all(20),
  //     child: LayoutBuilder(
  //       builder: (context, constraints) {
  //         return SingleChildScrollView(
  //           scrollDirection: Axis.horizontal,
  //           child: ConstrainedBox(
  //             constraints: BoxConstraints(
  //               minWidth: constraints.maxWidth,
  //             ),
  //             child: IntrinsicWidth(
  //               child: Card(
  //                 elevation: 3,
  //                 shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(12),
  //                 ),
  //                 child: ClipRRect(
  //                   borderRadius: BorderRadius.circular(12),
  //                   child: DataTable(
  //                     columnSpacing: isTablet ? 20 : 50,
  //                     headingRowColor: WidgetStateColor.resolveWith(
  //                       (states) => const Color.fromARGB(66, 144, 140, 140),
  //                     ),
  //                     dataRowColor:
  //                         WidgetStatePropertyAll(AppColors.primaryColor),
  //                     dataRowMinHeight: isTablet ? 45 : 55,
  //                     dataRowMaxHeight: isTablet ? 45 : 55,
  //                     columns: const [
  //                       DataColumn(
  //                           label: Padding(
  //                               padding: EdgeInsets.only(left: 16),
  //                               child: Text('ID',
  //                                   style: TextStyle(
  //                                       fontWeight: FontWeight.bold)))),
  //                       DataColumn(label: Text('Vehicle Name & Model')),
  //                       DataColumn(label: Text('Model Type')),
  //                       DataColumn(label: Text('Company Name')),
  //                       DataColumn(label: Text('Transmission & Fuel Type')),
  //                       DataColumn(label: Text('Actions')),
  //                     ],
  //                     rows: vehicles
  //                         .asMap()
  //                         .entries
  //                         .map((entry) => _buildVehicleRow(
  //                             entry.key, entry.value, currentPage))
  //                         .toList(),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  Widget _buildVehicleTable(List<VehicleRequest> vehicles, int currentPage) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600 && screenWidth <= 900;

    return Padding(
      padding: const EdgeInsets.all(15),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final tableWidth = constraints.maxWidth;

          return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: tableWidth,
                  ),
                  child: DataTable(
                    columnSpacing: isTablet ? 20 : 50,
                    headingRowColor: WidgetStateColor.resolveWith(
                      (states) => const Color.fromARGB(66, 144, 140, 140),
                    ),
                    dataRowColor:
                        WidgetStatePropertyAll(AppColors.primaryColor),
                    dataRowMinHeight: isTablet ? 45 : 55,
                    dataRowMaxHeight: isTablet ? 45 : 55,
                    columns: _buildTableColumns(isTablet),
                    rows: vehicles
                        .asMap()
                        .entries
                        .map((entry) => _buildVehicleRow(
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

  List<DataColumn> _buildTableColumns([bool isTablet = false]) {
    return [
      const DataColumn(
        label: Padding(
          padding: EdgeInsets.only(left: 30),
          child: Text('ID'),
        ),
      ),
      DataColumn(label: Text(isTablet ? 'Name/Model' : 'Vehicle Name & Model')),
      const DataColumn(label: Text('Model Type')),
      DataColumn(label: Text(isTablet ? 'Company' : 'Company Name')),
      DataColumn(
          label: Text(isTablet ? 'Trans/Fuel' : 'Transmission & Fuel Type')),
      const DataColumn(label: Text('Actions')),
    ];
  }

  // List<DataColumn> _buildTableColumns() {
  //   return const [
  //     DataColumn(
  //         label:
  //             Padding(padding: EdgeInsets.only(left: 30), child: Text('ID'))),
  //     DataColumn(label: Text('Vehicle Name & Model')),
  //     DataColumn(label: Text('Model Type')),
  //     DataColumn(label: Text('Company Name')),
  //     DataColumn(label: Text('Transmission & Fuel Type')),
  //     DataColumn(label: Text('Actions')),
  //   ];
  // }

  DataRow _buildVehicleRow(int index, VehicleRequest vehicle, int currentPage) {
    int rowNumber = ((currentPage - 1) * rowsPerPage) + index + 1;
    return DataRow(
      cells: [
        DataCell(Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text('$rowNumber'))),
        DataCell(Text(
          '${vehicle.vehicleModels.first.name}/${vehicle.vehicleModels.first.modelName}',
          overflow: TextOverflow.ellipsis,
        )),
        DataCell(Text(vehicle.modelType)),
        DataCell(Text(vehicle.vendor)),
        DataCell(Text(
          '${vehicle.vehicleModels.first.transmissionType}/${vehicle.vehicleModels.first.fuelType}',
          overflow: TextOverflow.ellipsis,
        )),
        DataCell(
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.black),
                onPressed: () {
                  context.push('/edit-vehicle', extra: vehicle);
                },
              ),
              IconButton(
                  icon: const Icon(Icons.remove_red_eye_outlined,
                      color: Colors.black),
                  onPressed: () {
                    context.push('/view-vehicle', extra: vehicle);
                  }),
            ],
          ),
        ),
      ],
    );
  }

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
                      .read<VehicleBloc>()
                      .add(FetchAllVehicles(page: 1, limit: rowsPerPage));
                }
              },
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: currentPage > 1
                  ? () {
                      context.read<VehicleBloc>().add(FetchAllVehicles(
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
                      context.read<VehicleBloc>().add(FetchAllVehicles(
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
