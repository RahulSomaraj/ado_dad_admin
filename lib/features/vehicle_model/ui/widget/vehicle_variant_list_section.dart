import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/features/vehicle_variant/bloc/bloc/vehicle_variant_bloc.dart';
import 'package:ado_dad_admin/models/vehicle_model/vehicle_model.dart'
    as vehicle_model;
import 'package:ado_dad_admin/models/vehicle_variant/vehicle_variant_response_model.dart';
import 'package:file_picker/file_picker.dart';
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
  final ScrollController _horizontalScrollController = ScrollController();
  bool _isCsvUploadInProgress = false;
  VehicleVariantPaginatedResponse? _lastLoadedResponse;

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
  void dispose() {
    _horizontalScrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _fetchPage(widget.modelId, currentPage, rowsPerPage);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Refresh the list when the page becomes visible again (e.g., after navigation back from edit)
    // This ensures the list is updated after edit/delete operations
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        // Check if we have a loaded state, if not, fetch the current page
        final state = context.read<VehicleVariantBloc>().state;
        state.maybeWhen(
          loaded: (_) {
            // Already have data, no need to refetch
          },
          orElse: () {
            // No data or in error state, fetch current page
            _fetchPage(widget.modelId, currentPage, rowsPerPage);
          },
        );
      }
    });
  }

  Future<void> _uploadCsvFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['csv'],
        withData: true,
      );

      if (result != null && result.files.single.bytes != null) {
        final fileBytes = result.files.single.bytes!;
        final fileName = result.files.single.name;

        if (mounted) {
          setState(() {
            _isCsvUploadInProgress = true;
          });
          // Upload CSV using the bloc
          context.read<VehicleVariantBloc>().add(
                VehicleVariantEvent.uploadVariantCsv(
                  modelId: widget.modelId,
                  fileBytes: fileBytes,
                  fileName: fileName,
                ),
              );
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isCsvUploadInProgress = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error picking file: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600 && screenWidth <= 900;
    return BlocListener<VehicleVariantBloc, VehicleVariantState>(
      listenWhen: (prev, curr) {
        // Only listen when CSV upload is in progress and state changes to loaded or error
        if (!_isCsvUploadInProgress) return false;
        return curr.maybeWhen(
          loaded: (_) => true,
          error: (_) => true,
          orElse: () => false,
        );
      },
      listener: (context, state) {
        state.maybeWhen(
          loaded: (response) {
            // Only show success message if CSV upload was in progress
            if (_isCsvUploadInProgress) {
              setState(() {
                _isCsvUploadInProgress = false;
              });

              // Show success popup
              showDialog(
                context: context,
                builder: (dialogContext) => AlertDialog(
                  title: const Text("Success"),
                  content: Text(
                      "CSV uploaded successfully. ${response.data.length} variant(s) loaded. Variant list has been updated."),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(dialogContext).pop(),
                      child: const Text("OK"),
                    ),
                  ],
                ),
              );
            }
          },
          error: (msg) {
            if (_isCsvUploadInProgress) {
              setState(() {
                _isCsvUploadInProgress = false;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('CSV upload failed: $msg'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          orElse: () {},
        );
      },
      child: BlocBuilder<VehicleVariantBloc, VehicleVariantState>(
        buildWhen: (prev, curr) {
          // Rebuild when state changes to loaded, error, or loading
          return curr.maybeWhen(
            loaded: (_) => true,
            error: (_) => true,
            loading: () => true,
            orElse: () => false,
          );
        },
        builder: (context, state) {
          // Store the last loaded response to show it even when success is emitted
          state.maybeWhen(
            loaded: (response) {
              _lastLoadedResponse = response;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) {
                  setState(() {
                    currentPage = response.page;
                    rowsPerPage = response.limit;
                  });
                }
              });
            },
            orElse: () {},
          );

          // Use the last loaded response if available, even if current state is success
          final responseToShow = state.maybeWhen(
            loaded: (response) => response,
            orElse: () => _lastLoadedResponse,
          );

          if (responseToShow == null) {
            return state.maybeWhen(
              loading: () => const CircularProgressIndicator(),
              error: (msg) => Text("Error: $msg"),
              orElse: () => const CircularProgressIndicator(),
            );
          }

          final variants = responseToShow.data;
          final isEmpty = variants.isEmpty;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: isTablet
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(" Vehicle Variants",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(child: _buildUploadCsvButton()),
                              const SizedBox(width: 12),
                              Expanded(child: _buildAddButton()),
                            ],
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(" Vehicle Variants",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Row(
                            children: [
                              _buildUploadCsvButton(),
                              const SizedBox(width: 12),
                              _buildAddButton(),
                            ],
                          ),
                        ],
                      ),
              ),
              const SizedBox(height: 12),
              if (isEmpty)
                _buildEmptyState()
              else ...[
              LayoutBuilder(builder: (context, constraints) {
                return Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Scrollbar(
                    thumbVisibility: true,
                    controller: _horizontalScrollController,
                    child: SingleChildScrollView(
                      controller: _horizontalScrollController,
                      scrollDirection: Axis.horizontal,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: constraints.maxWidth > 0
                              ? constraints.maxWidth
                              : 800,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: DataTable(
                            columnSpacing: isTablet ? 15 : 60,
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
                            DataColumn(label: Text("Engine")),
                            DataColumn(label: Text("Mileage")),
                            DataColumn(label: Text("Price")),
                            DataColumn(label: Text("Active")),
                            DataColumn(
                              label: Text(
                                'Actions',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                          rows: variants.map((v) {
                            final cc =
                                v.engineSpecs?.capacity ??
                                    v.engineSpecs?.displacement;
                            final mileage = v.performanceSpecs?.mileage;
                            return DataRow(cells: [
                              DataCell(Text(v.name)),
                              DataCell(Text(v.displayName)),
                              // DataCell(Text(v.vehicleModel.displayName)),
                              DataCell(Text(v.fuelType?.displayName ?? "-")),
                              DataCell(
                                  Text(v.transmissionType?.displayName ?? "-")),
                              DataCell(Text(cc != null ? "$cc cc" : "-")),
                              DataCell(Text(
                                  mileage != null ? "$mileage kmpl" : "-")),
                              DataCell(Text("₹${v.price}")),
                              DataCell(Text(v.isActive ? "Yes" : "No")),
                              DataCell(
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      tooltip: 'View',
                                      icon: const Icon(Icons.visibility_outlined,
                                          color:
                                              Color.fromARGB(255, 59, 59, 59)),
                                      onPressed: () {
                                        context.push(
                                          '/view-vehiclevariant',
                                          extra: {
                                            'variant': v,
                                            'vehicleModel': widget.vehicleModel,
                                          },
                                        );
                                      },
                                    ),
                                    IconButton(
                                      tooltip: 'Edit',
                                      icon: const Icon(Icons.edit,
                                          color:
                                              Color.fromARGB(255, 59, 59, 59)),
                                      onPressed: () {
                                        context.push(
                                          '/edit-vehiclevariant',
                                          extra: {
                                            'variant': v,
                                            'vehicleModel': widget.vehicleModel,
                                          },
                                        );
                                      },
                                    ),
                                    IconButton(
                                      tooltip: 'Delete',
                                      icon: const Icon(Icons.delete,
                                          color:
                                              Color.fromARGB(255, 20, 20, 20)),
                                      onPressed: () {
                                        _showDeleteDialog(context, v);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ]);
                          }).toList(),
                          ),
                        ),
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
                      if (!mounted) return;
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
                  Text("Page $currentPage of ${responseToShow.totalPages}"),
                  IconButton(
                    onPressed: currentPage < responseToShow.totalPages
                        ? () => _fetchPage(
                            widget.modelId, currentPage + 1, rowsPerPage)
                        : null,
                    icon: Icon(Icons.chevron_right),
                  ),
                ],
              )
              ],
            ],
          );
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.surfaceAlt,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.tune, color: AppColors.textMuted),
          ),
          const SizedBox(height: 14),
          const Text(
            "No variants yet",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          const Text(
            "Add a variant or upload a CSV to get started.",
            style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.accent,
              foregroundColor: Colors.white,
              padding:
                  const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () => context.push(
              '/add-vehiclevariant',
              extra: widget.vehicleModel,
            ),
            icon: const Icon(Icons.add, size: 18),
            label: const Text("Add Variant"),
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(
      BuildContext context, VehicleVariantResponseModel variant) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return BlocListener<VehicleVariantBloc, VehicleVariantState>(
          listenWhen: (prev, curr) {
            // Only listen to success state after deletion
            return curr.maybeWhen(
              success: (_) => true,
              orElse: () => false,
            );
          },
          listener: (context, state) {
            state.maybeWhen(
              success: (message) {
                // Close the delete confirmation dialog
                Navigator.of(dialogContext).pop();
                // Show success popup
                if (mounted) {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (successContext) {
                      return AlertDialog(
                        title: const Text("Success"),
                        content: Text(message),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(successContext).pop();
                            },
                            child: const Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              error: (message) {
                // Close the delete confirmation dialog
                Navigator.of(dialogContext).pop();
                // Show error message
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Error: $message'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              orElse: () {},
            );
          },
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            title: const Center(
              child: Text(
                "Confirm Delete",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            content: Text(
              "Are you sure you want to delete variant '${variant.displayName}'?",
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: const Text(
                  "Cancel",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              BlocBuilder<VehicleVariantBloc, VehicleVariantState>(
                builder: (context, state) {
                  final isLoading = state.maybeWhen(
                    loading: () => true,
                    orElse: () => false,
                  );
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: isLoading
                        ? null
                        : () {
                            context.read<VehicleVariantBloc>().add(
                                  VehicleVariantEvent.deleteVariant(
                                    variantId: variant.id,
                                    modelId: widget.modelId,
                                  ),
                                );
                          },
                    child: isLoading
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : const Text(
                            "Delete",
                            style: TextStyle(color: Colors.white),
                          ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildUploadCsvButton() {
    final isTablet = MediaQuery.of(context).size.width < 900 &&
        MediaQuery.of(context).size.width >= 550;
    return SizedBox(
      width: isTablet ? double.infinity : 200,
      height: 45,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        icon: _isCsvUploadInProgress
            ? const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : const Icon(Icons.upload_file, color: Colors.white),
        label: Text(
          'Upload Variant CSV',
          style: const TextStyle(color: Colors.white),
        ),
        onPressed: _isCsvUploadInProgress ? null : () => _uploadCsvFile(),
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
