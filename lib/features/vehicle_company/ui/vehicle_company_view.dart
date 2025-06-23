import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/features/vehicle_company/bloc/vehicle_company_bloc.dart';
import 'package:ado_dad_admin/models/vehicle_company_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VehicleCompanyDetailView extends StatefulWidget {
  final VehicleCompanyModel vehiclecompany;
  const VehicleCompanyDetailView({super.key, required this.vehiclecompany});

  @override
  State<VehicleCompanyDetailView> createState() =>
      _VehicleCompanyDetailViewState();
}

class _VehicleCompanyDetailViewState extends State<VehicleCompanyDetailView> {
  void _showDeleteDialog(BuildContext context, String companyId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          title: Center(
            child: const Text(
              "Confirm Delete",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          content: const Text(
            "Are you sure you want to delete this vehicle company?",
          ),
          actions: [
            TextButton(
              onPressed: () => context.pop(),
              child: const Text(
                "Cancel",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () {
                _deleteVehicleCompany(companyId);
                // page pop list
                context.pop();
              },
              child: const Text(
                "Delete",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  void _deleteVehicleCompany(String companyId) {
    Navigator.of(context).pop();
    context
        .read<VehicleCompanyBloc>()
        .add(DeleteVehicleCompany(companyId: companyId));

    context
        .read<VehicleCompanyBloc>()
        .stream
        .firstWhere((state) => state is VehicleCompanyDeleted)
        .then((_) {
      print("✅ Vehicle Company Deleted Successfully!");

      // Delay popup to prevent UI conflict
      // Future.delayed(const Duration(milliseconds: 300), () {
      //   _showSuccessPopup(context, "Vehicle Company deleted successfully!");
      // });
    });
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
                // context.pop();
                // Navigation handled in BlocListener
                // Navigator.of(context).pop();
                // context.go('/vehicle-companies');
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
    return BlocListener<VehicleCompanyBloc, VehicleCompanyState>(
      listenWhen: (previous, current) => current is VehicleCompanyDeleted,
      listener: (context, state) {
        if (state is VehicleCompanyDeleted) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Success"),
                content: const Text("Vehicle Company deleted successfully!"),
                actions: [
                  TextButton(
                    onPressed: () {
                      // Navigator.of(context).pop(); // close dialog
                      context.pop();
                      context.go('/vehicle-companies'); // then navigate
                    },
                    child: const Text("OK"),
                  ),
                ],
              );
            },
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            _buildShowroomDetailSection(),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _buildCompanyList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShowroomDetailSection() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new,
                      color: AppColors.blackColor),
                  onPressed: () {
                    context.pop();
                    context
                        .read<VehicleCompanyBloc>()
                        .add(FetchAllVehicleCompany());
                  },
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    const Text('Vehicle Company Name',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackColor)),
                    Text(
                      widget.vehiclecompany.name!,
                      style: TextStyle(color: AppColors.blackColor),
                    ),
                  ],
                ),
                SizedBox(width: 60),
                Column(
                  children: [
                    const Text('Country of Origin',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackColor)),
                    Text(
                      widget.vehiclecompany.originCountry!,
                      style: TextStyle(color: AppColors.blackColor),
                    ),
                  ],
                ),
                SizedBox(width: 60),
                Column(
                  children: [
                    const Text('Vehicle Type',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackColor)),
                    Text(
                      widget.vehiclecompany.vehicleType!,
                      style: TextStyle(color: AppColors.blackColor),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 250,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.blackColor,
                      foregroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      textStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      _showDeleteDialog(context, widget.vehiclecompany.id);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete,
                          color: AppColors.primaryColor,
                          size: 20,
                        ),
                        SizedBox(width: 8),
                        const Text('Delete Vehicle Company'),
                      ],
                    ),
                  ),
                )
              ],
            )
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
                    columnSpacing: 175,
                    headingRowColor: WidgetStateColor.resolveWith(
                        (states) => Color.fromARGB(66, 144, 140, 140)),
                    dataRowColor:
                        WidgetStatePropertyAll(AppColors.primaryColor),
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
      DataCell(Text(company.name!)),
      DataCell(Text(company.originCountry!)),
      DataCell(Text(company.vehicleType!)),
    ]);
  }
}
