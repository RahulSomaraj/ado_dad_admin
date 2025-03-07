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
      Future.delayed(const Duration(milliseconds: 300), () {
        _showSuccessPopup(context, "Vehicle Company deleted successfully!");
      });
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
          // print("✅ Vehicle deleted successfully, navigating...");

          context.pop(); // Closes the success popup
          context.pop(); // Closes the detail page
          context.go('/vehicle-companies');
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
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: 40.0,
                  border: TableBorder.all(
                    color: Colors.black, // Border color for rows
                    width: 1.0,
                  ),
                  headingRowColor: MaterialStateColor.resolveWith(
                      (states) => Colors.black12),
                  columns: const [
                    DataColumn(
                        label: Text('ID',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Vehicle Company Name',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Origin Country',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Vehicle Type',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                  rows: const [], // No data rows
                ),
              ),
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
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  icon:
                      const Icon(Icons.arrow_back_ios_new, color: Colors.white),
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
                            fontWeight: FontWeight.bold, color: Colors.white)),
                    Text(
                      widget.vehiclecompany.name,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  width: 50,
                ),
                Column(
                  children: [
                    const Text('Country of Origin',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white)),
                    Text(
                      widget.vehiclecompany.originCountry,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  width: 50,
                ),
                Column(
                  children: [
                    const Text('Vehicle Type',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white)),
                    Text(
                      widget.vehiclecompany.vehicleType,
                      style: TextStyle(color: Colors.white),
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
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
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
                          color: Colors.black,
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
}
