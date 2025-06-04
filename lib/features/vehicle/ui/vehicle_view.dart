import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/features/vehicle/bloc/vehicle_bloc.dart';
import 'package:ado_dad_admin/models/vehicle_post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VehicleDetailView extends StatefulWidget {
  final VehicleRequest vehicle;
  const VehicleDetailView({super.key, required this.vehicle});

  @override
  State<VehicleDetailView> createState() => _VehicleDetailViewState();
}

class _VehicleDetailViewState extends State<VehicleDetailView> {
  void _showDeleteDialog(BuildContext context, String vehicleId) {
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
            "Are you sure you want to delete this vehicle?",
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
                _deleteVehicle(vehicleId);
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

  void _deleteVehicle(String vehicleId) {
    print('Deleting vehicle with ID: $vehicleId');
    Navigator.of(context).pop();
    context.read<VehicleBloc>().add(DeleteVehicle(vehicleId: vehicleId));

    context
        .read<VehicleBloc>()
        .stream
        .firstWhere((state) => state is VehicleDeleted)
        .then((_) {
      print("✅ Vehicle Deleted Successfully!");

      // Delay popup to prevent UI conflict
      // Future.delayed(const Duration(milliseconds: 300), () {
      //   _showSuccessPopup(context, "Vehicle Company deleted successfully!");
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.vehicle.id);
    return Padding(
      padding: EdgeInsets.all(0),
      child: Column(
        children: [
          buildVehicleDetailSection(),
        ],
      ),
    );
  }

  Widget buildVehicleDetailSection() {
    return Padding(
      padding: EdgeInsets.all(15),
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
                  },
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    const Text('Vehicle Name/Model Name',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackColor)),
                    // Text('Vehicle ID: ${widget.vehicle.id}'),
                    Text(
                      '${widget.vehicle.vehicleModels.first.name}/${widget.vehicle.vehicleModels.first.modelName}',
                      style: TextStyle(color: AppColors.blackColor),
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    const Text('Model Type',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackColor)),
                    Text(
                      widget.vehicle.modelType,
                      style: TextStyle(color: AppColors.blackColor),
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    const Text('Company Name',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackColor)),
                    Text(
                      widget.vehicle.vendor,
                      style: TextStyle(color: AppColors.blackColor),
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    const Text('Transmission/Fuel Type',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackColor)),
                    Text(
                      '${widget.vehicle.vehicleModels.first.transmissionType}/${widget.vehicle.vehicleModels.first.fuelType}',
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
                      _showDeleteDialog(context, widget.vehicle.id);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete,
                          color: AppColors.primaryColor,
                          size: 20,
                        ),
                        SizedBox(width: 8),
                        const Text('Delete Vehicle'),
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
