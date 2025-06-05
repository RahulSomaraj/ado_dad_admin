import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/features/vehicle_company/bloc/vehicle_company_bloc.dart';
import 'package:ado_dad_admin/models/vehicle_company_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VehicleCompanyList extends StatefulWidget {
  const VehicleCompanyList({super.key});

  @override
  State<VehicleCompanyList> createState() => _VehicleCompanyListState();
}

class _VehicleCompanyListState extends State<VehicleCompanyList> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        _buildHeaderSection(),
        const SizedBox(height: 20),
        _buildCompanyList(),
      ],
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Vehicle Company Management",
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
                  context.read<VehicleCompanyBloc>().add(FetchAllVehicleCompany(
                      page: 1, limit: 10, searchQuery: query));
                } else {
                  context.read<VehicleCompanyBloc>().add(FetchAllVehicleCompany(
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
    return SizedBox(
      width: 250,
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
        onPressed: () {
          context.push('/add-vehiclecompany');
        },
        child: Row(
          children: [
            Icon(
              Icons.add,
              color: Colors.black,
              size: 20,
            ),
            SizedBox(width: 8),
            const Text('Add Vehicle Companies'),
          ],
        ),
      ),
    );
  }

  Widget _buildCompanyList() {
    return BlocBuilder<VehicleCompanyBloc, VehicleCompanyState>(
      builder: (context, state) {
        if (state is VehicleCompanyLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is VehicleCompanyLoaded) {
          return Column(
            children: [
              _buildCompanyTable(state.companies, state.currentPage),
              const SizedBox(height: 30),
              _buildPaginationBar(state.currentPage, state.totalPages),
            ],
          );
        } else if (state is VehicleCompanyError) {
          return Center(
              child: Text(state.message,
                  style: const TextStyle(color: Colors.red)));
        }
        return const Center(child: Text("No Vehicle Companies Found"));
      },
    );
  }

  Widget _buildCompanyTable(
      List<VehicleCompanyModel> companies, int currentPage) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: IntrinsicWidth(
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: DataTable(
                    columnSpacing: 120,
                    headingRowColor: WidgetStateColor.resolveWith(
                        (states) => AppColors.greyColor2),
                    dataRowMinHeight: 55,
                    dataRowMaxHeight: 55,
                    columns: const [
                      DataColumn(
                        label: Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Text('ID',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                      DataColumn(
                          label: Text('Vehicle Company Name',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(
                          label: Text('Origin Country of Vehicle Company',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(
                          label: Text('Vehicle Type',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(
                          label: Text('Actions',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                    ],
                    rows: companies.asMap().entries.map((entry) {
                      return _buildCompanyRow(
                          entry.key, entry.value, currentPage);
                    }).toList(),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
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
                      .read<VehicleCompanyBloc>()
                      .add(FetchAllVehicleCompany(page: 1, limit: rowsPerPage));
                }
              },
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: currentPage > 1
                  ? () {
                      context.read<VehicleCompanyBloc>().add(
                          FetchAllVehicleCompany(
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
                      context.read<VehicleCompanyBloc>().add(
                          FetchAllVehicleCompany(
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

  DataRow _buildCompanyRow(
      int index, VehicleCompanyModel company, int currentPage) {
    int rowNumber = ((currentPage - 1) * rowsPerPage) + index + 1;
    return DataRow(cells: [
      DataCell(Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Text('$rowNumber'),
      )),
      DataCell(Text(company.name)),
      DataCell(Text(company.originCountry)),
      DataCell(Text(company.vehicleType)),
      DataCell(
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit,
                  color: Color.fromARGB(255, 59, 59, 59)),
              onPressed: () {
                context.push('/edit-vehicle_company', extra: company);
              },
            ),
            IconButton(
              icon: const Icon(Icons.remove_red_eye_outlined,
                  color: Color.fromARGB(255, 20, 20, 20)),
              onPressed: () {
                context.push('/view-vehicle_company', extra: company);
              },
            ),
          ],
        ),
      ),
    ]);
  }
}
