import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/features/vehicle/bloc/vehicle_bloc.dart';
import 'package:ado_dad_admin/features/vehicle_company/bloc/vehicle_company_bloc.dart';
import 'package:ado_dad_admin/models/vehicle_model.dart';
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

  /// Builds the top header section
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Vehicles Management",
              style: TextStyle(
                color: Colors.white,
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

  /// Builds the search bar
  Widget _buildSearchBar() {
    return Container(
      width: 200,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
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

  /// Builds the "Add Vehicle" button
  Widget _buildAddButton() {
    return SizedBox(
      width: 160,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        onPressed: () => context.push('/add-vehicle'),
        child: const Row(
          children: [
            Icon(Icons.add, color: Colors.black, size: 20),
            SizedBox(width: 8),
            Text('Add Vehicle'),
          ],
        ),
      ),
    );
  }

  /// Builds the list of vehicles using BlocBuilder
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

  /// Builds the vehicle table
  Widget _buildVehicleTable(List<VehicleModel> vehicles, int currentPage) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Card(
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: DataTable(
              columnSpacing: 80,
              headingRowColor: WidgetStateColor.resolveWith(
                  (states) => AppColors.greyColor2),
              dataRowMinHeight: 55,
              dataRowMaxHeight: 55,
              columns: _buildTableColumns(),
              rows: vehicles
                  .asMap()
                  .entries
                  .map(
                    (entry) =>
                        _buildVehicleRow(entry.key, entry.value, currentPage),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  /// Defines table column headers
  List<DataColumn> _buildTableColumns() {
    return const [
      DataColumn(
          label:
              Padding(padding: EdgeInsets.only(left: 30), child: Text('ID'))),
      DataColumn(label: Text('Name')),
      DataColumn(label: Text('Model Name')),
      DataColumn(label: Text('Model Type')),
      DataColumn(label: Text('Wheeler Type')),
      DataColumn(label: Text('Company Name')),
      DataColumn(label: Text('Fuel Type')),
      DataColumn(label: Text('Transmission Type')),
      DataColumn(label: Text('Model Year')),
      DataColumn(label: Text('Month')),
      DataColumn(label: Text('Mileage')),
      DataColumn(label: Text('Engine Capacity')),
      DataColumn(label: Text('Fuel Capacity')),
      DataColumn(label: Text('Maximum Power')),
      DataColumn(label: Text('Actions')),
    ];
  }

  /// Builds individual vehicle rows in the table
  DataRow _buildVehicleRow(int index, VehicleModel vehicle, int currentPage) {
    int rowNumber = ((currentPage - 1) * rowsPerPage) + index + 1;
    return DataRow(
      cells: [
        DataCell(Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text('$rowNumber'))),
        DataCell(Text(vehicle.vehicleVariants.first.name)),
        DataCell(Text(vehicle.vehicleVariants.first.modelName)),
        DataCell(Text(vehicle.modelType)),
        DataCell(Text(vehicle.wheelerType)),
        DataCell(Text(vehicle.vendor.name)),
        DataCell(Text(vehicle.vehicleVariants.first.fuelType)),
        DataCell(Text(vehicle.vehicleVariants.first.transmissionType)),
        DataCell(Text(vehicle.details.modelYear.toString())),
        DataCell(Text(vehicle.details.month ?? 'N/A')),
        DataCell(Text(vehicle.vehicleVariants.first.mileage.toString())),
        DataCell(Text(vehicle.vehicleVariants.first.engineCapacity.toString())),
        DataCell(Text(vehicle.vehicleVariants.first.fuelCapacity.toString())),
        DataCell(Text(vehicle.vehicleVariants.first.maxPower.toString())),
        DataCell(
          Row(
            children: [
              IconButton(
                  icon: const Icon(Icons.edit, color: Colors.black),
                  onPressed: () {}),
              IconButton(
                  icon: const Icon(Icons.delete, color: Colors.black),
                  onPressed: () {}),
            ],
          ),
        ),
      ],
    );
  }

  /// Builds the pagination bar
  Widget _buildPaginationBar(int currentPage, int totalPages) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text("Rows per page: "),
        DropdownButton<int>(
          value: rowsPerPage,
          items: [10, 20]
              .map((e) => DropdownMenuItem(value: e, child: Text(e.toString())))
              .toList(),
          onChanged: (value) => setState(() => rowsPerPage = value!),
        ),
        IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: currentPage > 1 ? () {} : null),
        Text("Page $currentPage of $totalPages"),
        IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: currentPage < totalPages ? () {} : null),
      ],
    );
  }
}
