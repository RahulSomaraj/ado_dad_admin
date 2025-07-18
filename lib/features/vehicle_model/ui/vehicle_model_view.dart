import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/features/vehicle_model/ui/widget/vehicle_variant_list_section.dart';
import 'package:ado_dad_admin/models/vehicle_model/vehicle_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VehicleModelView extends StatefulWidget {
  final VehicleModel vehiclemodel;
  const VehicleModelView({super.key, required this.vehiclemodel});

  @override
  State<VehicleModelView> createState() => _VehicleModelViewState();
}

class _VehicleModelViewState extends State<VehicleModelView> {
  @override
  Widget build(BuildContext context) {
    final m = widget.vehiclemodel;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildInfoCard(m),
            const SizedBox(height: 30),
            VehicleVariantListSection(
              modelId: m.id!,
              vehicleModel: m,
            ),
            // _buildAddButton()
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(VehicleModel m) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: AppColors.primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔙 Title & Back Button Row
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: Icon(Icons.arrow_back_ios)),
                Text(
                  m.displayName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // 🔧 Info Tiles
            Wrap(
              runSpacing: 16,
              spacing: 40,
              children: [
                _infoTile("Name", m.name),
                _infoTile("Display Name", m.displayName),
                _infoTile("Manufacturer", m.manufacturer.displayName),
                _infoTile("Vehicle Type", m.vehicleType),
                _infoTile("Description", m.description ?? "N/A"),
                _infoTile("Active", m.isActive! ? "Yes" : "No"),
                _infoTile("Launch Year", m.launchYear.toString()),
                _infoTile("Segment", m.segment ?? "N/A"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoTile(String label, String value) {
    return SizedBox(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildAddButton() {
    final isTablet = MediaQuery.of(context).size.width < 900 &&
        MediaQuery.of(context).size.width >= 550;
    return SizedBox(
      width: isTablet ? double.infinity : 260,
      height: 45,
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
                  context.push(
                    '/add-vehiclevariant',
                    extra: widget.vehiclemodel,
                  );
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
                  isTablet ? 'Add Variant' : 'Add Vehicle Variant',
                  style: TextStyle(fontSize: fontSize),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
