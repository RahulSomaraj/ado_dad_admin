import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/features/vehicle_manufacturer/bloc/bloc/vehicle_manufacturer_bloc.dart';
import 'package:ado_dad_admin/features/vehicle_model/bloc/vehicle_model_bloc.dart';
import 'package:ado_dad_admin/models/vehicle_manufacturer/vehicle_manufacturer_model.dart';
import 'package:ado_dad_admin/repositories/vehicle_model_rep.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VehicleManufacturerDetailView extends StatefulWidget {
  final VehicleManufacturer vehiclemanufacturer;
  const VehicleManufacturerDetailView(
      {super.key, required this.vehiclemanufacturer});

  @override
  State<VehicleManufacturerDetailView> createState() =>
      _VehicleManufacturerDetailViewState();
}

class _VehicleManufacturerDetailViewState
    extends State<VehicleManufacturerDetailView> {
  bool _isCsvUploadInProgress = false;
  void Function(List<int> fileBytes, String fileName)? _uploadCsvCallback;

  @override
  void initState() {
    super.initState();
    print('Manufacturer ID: ${widget.vehiclemanufacturer.id}');
  }

  void _confirmDelete(BuildContext context, VehicleManufacturer m) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text("Delete Manufacturer"),
        content: Text("Are you sure you want to delete '${m.displayName}'?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(dialogContext).pop(); // close dialog
              _deleteManufacturer(context, m.id);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text("Delete"),
          ),
        ],
      ),
    );
  }

  void _deleteManufacturer(BuildContext context, String id) {
    context.read<VehicleManufacturerBloc>().add(
          VehicleManufacturerEvent.deleteManufacturer(id),
        );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Manufacturer deletion triggered")),
    );

    // Optionally navigate back or refresh list
    // Navigator.of(context).pop(); // pop detail screen
  }

  @override
  Widget build(BuildContext context) {
    final m = widget.vehiclemanufacturer;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(m),
          const SizedBox(height: 15),
          _buildInfoCard(m),
          const SizedBox(height: 20),
          BlocProvider(
            create: (context) =>
                VehicleModelBloc(repository: VehicleModelRepository())
                  ..add(FetchVehicleModelsByManufacturer(
                      widget.vehiclemanufacturer.id)),
            child: Builder(
              builder: (blocContext) {
                // Store the upload callback to use the correct bloc instance
                _uploadCsvCallback = (fileBytes, fileName) {
                  blocContext.read<VehicleModelBloc>().add(
                        VehicleModelEvent.uploadCsv(
                          widget.vehiclemanufacturer.id,
                          fileBytes,
                          fileName,
                        ),
                      );
                };
                return _VehicleModelListSectionWithListener(
                  manufacturerId: widget.vehiclemanufacturer.id,
                  isCsvUploadInProgress: _isCsvUploadInProgress,
                  onCsvUploadComplete: () {
                    if (mounted) {
                      setState(() {
                        _isCsvUploadInProgress = false;
                      });
                    }
                  },
                );
              },
            ),
          ),

          // _buildModelTableSection(), // Placeholder
        ],
      ),
    );
  }

  Future<void> _uploadCsvFile(VehicleManufacturer manufacturer) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['csv'],
        withData: true,
      );

      if (result != null && result.files.single.bytes != null) {
        final fileBytes = result.files.single.bytes!;
        final fileName = result.files.single.name;

        // Print manufacturer ID when uploading CSV
        print('📤 Uploading CSV for Manufacturer ID: ${manufacturer.id}');
        print('📁 File name: $fileName');

        if (mounted) {
          setState(() {
            _isCsvUploadInProgress = true;
          });
          // Use the stored callback to upload CSV using the correct bloc
          if (_uploadCsvCallback != null) {
            _uploadCsvCallback!(fileBytes, fileName);
          } else {
            // Show error if callback is not available
            setState(() {
              _isCsvUploadInProgress = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Error: Unable to upload CSV. Please try again.'),
                backgroundColor: Colors.red,
              ),
            );
          }
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

  Widget _buildHeader(VehicleManufacturer m) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: Icon(Icons.arrow_back_ios)),
            Text(
              m.displayName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              icon: const Icon(Icons.upload_file, color: Colors.white),
              label: const Text(
                'Upload Models CSV',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => _uploadCsvFile(m),
            ),
            const SizedBox(width: 12),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blackColor,
                foregroundColor: Colors.white,
              ),
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
              label: const Text("Delete Manufacturer"),
              onPressed: () => _confirmDelete(context, m),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoCard(VehicleManufacturer m) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: AppColors.primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Wrap(
          runSpacing: 16,
          spacing: 40,
          children: [
            _infoTile("Name", m.name),
            _infoTile("Country", m.originCountry),
            _infoTile("Founded", m.foundedYear.toString()),
            _infoTile("Website", m.website),
            _infoTile("Headquarters", m.headquarters),
            _infoTile("Active", m.isActive ? "Yes" : "No"),
            _infoTile("Premium", m.isPremium ? "Yes" : "No"),
            _infoTile("Description", m.description),
            _infoTile("Logo", m.logo),
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
}

class _VehicleModelListSectionWithListener extends StatelessWidget {
  final String manufacturerId;
  final bool isCsvUploadInProgress;
  final VoidCallback onCsvUploadComplete;

  const _VehicleModelListSectionWithListener({
    required this.manufacturerId,
    required this.isCsvUploadInProgress,
    required this.onCsvUploadComplete,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<VehicleModelBloc, VehicleModelState>(
      listenWhen: (prev, curr) {
        // Only listen when CSV upload is in progress and state changes to loaded or error
        if (!isCsvUploadInProgress) return false;
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
            if (isCsvUploadInProgress) {
              onCsvUploadComplete();
              // Show success popup when CSV upload completes
              showDialog(
                context: context,
                builder: (dialogContext) => AlertDialog(
                  title: const Text("Success"),
                  content: Text(
                      "CSV uploaded successfully. ${response.data.length} model(s) loaded. Model list has been updated."),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(dialogContext).pop(),
                      child: const Text("OK"),
                    ),
                  ],
                ),
              );
              // Refresh the main model list (global bloc) after a short delay
              // This ensures the local bloc update is complete first
              WidgetsBinding.instance.addPostFrameCallback((_) {
                try {
                  // Try to access the global bloc from the root navigator context
                  final navigator = Navigator.of(context, rootNavigator: true);
                  final rootContext = navigator.context;
                  if (rootContext.mounted) {
                    try {
                      final globalBloc = rootContext.read<VehicleModelBloc>();
                      // Trigger refresh of the main model list
                      globalBloc.add(const VehicleModelEvent.fetchAllModels());
                    } catch (e) {
                      // If we can't access the global bloc from here, that's okay
                      // The main list will refresh when the user navigates to it
                    }
                  }
                } catch (e) {
                  // Global bloc might not be available, that's okay
                }
              });
            }
          },
          error: (msg) {
            if (isCsvUploadInProgress) {
              onCsvUploadComplete();
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
      child: _VehicleModelListSection(),
    );
  }
}

class _VehicleModelListSection extends StatefulWidget {
  const _VehicleModelListSection();

  @override
  State<_VehicleModelListSection> createState() =>
      _VehicleModelListSectionState();
}

class _VehicleModelListSectionState extends State<_VehicleModelListSection> {
  int currentPage = 1;
  int rowsPerPage = 10;
  final ScrollController _horizontalScrollController = ScrollController();

  void _fetchPage(
      BuildContext context, String manufacturerId, int page, int limit) {
    context.read<VehicleModelBloc>().add(
          FetchVehicleModelsByManufacturer(manufacturerId,
              page: page, limit: limit),
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

  Widget _buildPaginationBar(String manufacturerId, int totalPages) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 20, bottom: 20, top: 10),
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
                  _fetchPage(context, manufacturerId, 1, value);
                }
              },
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: currentPage > 1
                  ? () => _fetchPage(
                      context, manufacturerId, currentPage - 1, rowsPerPage)
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
                  ? () => _fetchPage(
                      context, manufacturerId, currentPage + 1, rowsPerPage)
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

  @override
  Widget build(BuildContext context) {
    final manufacturerId = context
        .findAncestorStateOfType<_VehicleManufacturerDetailViewState>()!
        .widget
        .vehiclemanufacturer
        .id;
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600 && screenWidth <= 900;
    return BlocBuilder<VehicleModelBloc, VehicleModelState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (message) =>
              const Text("No models found for this manufacturer."),
          loaded: (response) {
            final models = response.data;

            if (models.isEmpty) {
              return const Text("No models found for this manufacturer.");
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Vehicle Models",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                LayoutBuilder(
                  builder: (context, constraints) {
                    return ConstrainedBox(
                      constraints:
                          BoxConstraints(minWidth: constraints.maxWidth),
                      child: Card(
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
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: DataTable(
                                columnSpacing: isTablet ? 20 : 40,
                                headingRowColor: WidgetStateColor.resolveWith(
                                  (states) =>
                                      const Color.fromARGB(66, 144, 140, 140),
                                ),
                                dataRowColor: WidgetStatePropertyAll(
                                    AppColors.primaryColor),
                                dataRowMinHeight: isTablet ? 45 : 55,
                                dataRowMaxHeight: isTablet ? 45 : 55,
                                columns: const [
                                  // DataColumn(label: Text("ID")),
                                  DataColumn(label: Text("Display Name")),
                                  DataColumn(label: Text("Manufacturer")),
                                  DataColumn(label: Text("Vehicle Type")),
                                  DataColumn(label: Text("Description")),
                                  DataColumn(label: Text("Launch Year")),
                                  DataColumn(label: Text("Segment")),
                                  DataColumn(label: Text("Body Type")),
                                  // DataColumn(label: Text("Images")),
                                  DataColumn(label: Text("Brochur")),
                                  DataColumn(label: Text("Is Active")),
                                  DataColumn(label: Text("Fuel Types")),
                                  DataColumn(label: Text("Transmission")),
                                ],
                                rows: models.map((model) {
                                  return DataRow(
                                    cells: [
                                      DataCell(Text(
                                          (model.displayName).isNotEmpty
                                              ? model.displayName
                                              : '-')),
                                      DataCell(Text(
                                          model.manufacturer?.displayName ??
                                              'N/A')),
                                      DataCell(Text(
                                          (model.vehicleType).isNotEmpty
                                              ? model.vehicleType
                                              : '-')),
                                      DataCell(SizedBox(
                                        width: 150,
                                        child: Text(
                                          model.description ?? '-',
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )),
                                      DataCell(Text(
                                          model.launchYear?.toString() ?? '-')),
                                      DataCell(Text(model.segment ?? '-')),
                                      DataCell(Text(
                                        model.bodyType ?? '-',
                                      )),
                                      DataCell(SizedBox(
                                        width: 150,
                                        child: Text(
                                          model.brochureUrl ?? '-',
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )),
                                      DataCell(Text(
                                          model.isActive?.toString() ?? '-')),
                                      DataCell(Text((model.availableFuelTypes !=
                                                  null &&
                                              model.availableFuelTypes!
                                                  .isNotEmpty)
                                          ? model.availableFuelTypes!.join(', ')
                                          : '-')),
                                      DataCell(Text(
                                          (model.availableTransmissionTypes !=
                                                      null &&
                                                  model
                                                      .availableTransmissionTypes!
                                                      .isNotEmpty)
                                              ? model
                                                  .availableTransmissionTypes!
                                                  .join(', ')
                                              : '-')),
                                    ],
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                _buildPaginationBar(manufacturerId, response.totalPages),
              ],
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
