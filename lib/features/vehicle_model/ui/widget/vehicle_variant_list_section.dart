import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/features/vehicle_variant/bloc/bloc/vehicle_variant_bloc.dart';
import 'package:ado_dad_admin/models/vehicle_model/vehicle_model.dart'
    as vehicle_model;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VehicleVariantListSection extends StatefulWidget {
  final String modelId;
  // final VehicleModel vehicleModel;
  final vehicle_model.VehicleModel vehicleModel;

  const VehicleVariantListSection(
      {super.key, required this.modelId, required this.vehicleModel});

  @override
  State<VehicleVariantListSection> createState() =>
      _VehicleVariantListSectionState();
}

class _VehicleVariantListSectionState extends State<VehicleVariantListSection> {
  int currentPage = 1;
  int rowsPerPage = 10;

  void _fetchPage(String modelId, int page, int limit) {
    context.read<VehicleVariantBloc>().add(
          VehicleVariantEvent.fetchByModel(
            modelId: modelId,
            page: page,
            limit: limit,
          ),
        );
    setState(() {
      currentPage = page;
      rowsPerPage = limit;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchPage(widget.modelId, currentPage, rowsPerPage);
  }

  @override
  Widget build(BuildContext context) {
    print(widget.modelId);
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600 && screenWidth <= 900;
    return BlocBuilder<VehicleVariantBloc, VehicleVariantState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const CircularProgressIndicator(),
          error: (msg) => Text("Error: $msg"),
          loaded: (response) {
            final variants = response.data;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(" Vehicle Variants",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      _buildAddButton()
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                LayoutBuilder(builder: (context, constraints) {
                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: DataTable(
                          columnSpacing: isTablet ? 20 : 115,
                          headingRowColor: WidgetStateColor.resolveWith(
                            (states) => const Color.fromARGB(66, 144, 140, 140),
                          ),
                          dataRowColor:
                              WidgetStatePropertyAll(AppColors.primaryColor),
                          dataRowMinHeight: isTablet ? 45 : 55,
                          dataRowMaxHeight: isTablet ? 45 : 55,
                          columns: const [
                            DataColumn(label: Text("Name")),
                            DataColumn(label: Text("Display Name")),
                            // DataColumn(label: Text("Vehicle Model")),
                            DataColumn(label: Text("Fuel")),
                            DataColumn(label: Text("Transmission")),
                            DataColumn(label: Text("Price")),
                            DataColumn(label: Text("Active")),
                          ],
                          rows: variants.map((v) {
                            return DataRow(cells: [
                              DataCell(Text(v.name)),
                              DataCell(Text(v.displayName)),
                              // DataCell(Text(v.vehicleModel.displayName)),
                              DataCell(Text(v.fuelType?.displayName ?? "-")),
                              DataCell(
                                  Text(v.transmissionType?.displayName ?? "-")),
                              DataCell(Text("₹${v.price}")),
                              DataCell(Text(v.isActive ? "Yes" : "No")),
                            ]);
                          }).toList(),
                        ),
                      ),
                    ),
                  );
                }),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text("Rows per page: "),
                    const SizedBox(width: 8),
                    DropdownButton<int>(
                      value: rowsPerPage,
                      items: [10, 20]
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e.toString()),
                              ))
                          .toList(),
                      onChanged: (val) {
                        if (mounted) return;
                        if (val != null) {
                          _fetchPage(widget.modelId, 1, val);
                        }
                      },
                    ),
                    IconButton(
                      onPressed: currentPage > 1
                          ? () => _fetchPage(
                              widget.modelId, currentPage - 1, rowsPerPage)
                          : null,
                      icon: Icon(Icons.chevron_left),
                    ),
                    Text("Page $currentPage of ${response.totalPages}"),
                    IconButton(
                      onPressed: currentPage < response.totalPages
                          ? () => _fetchPage(
                              widget.modelId, currentPage + 1, rowsPerPage)
                          : null,
                      icon: Icon(Icons.chevron_right),
                    ),
                  ],
                )
              ],
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
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
                    extra: widget.vehicleModel,
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
