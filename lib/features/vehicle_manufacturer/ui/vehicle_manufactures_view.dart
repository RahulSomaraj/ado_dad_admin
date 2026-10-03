import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/common/vehicle_categories.dart';
import 'package:ado_dad_admin/features/vehicle_manufacturer/bloc/bloc/vehicle_manufacturer_bloc.dart';
import 'package:ado_dad_admin/features/vehicle_model/bloc/vehicle_model_bloc.dart';
import 'package:ado_dad_admin/features/widgets/form_kit.dart';
import 'package:ado_dad_admin/models/vehicle_manufacturer/vehicle_manufacturer_model.dart';
import 'package:ado_dad_admin/repositories/vehicle_model_rep.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

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
  bool _isDeletionInProgress = false;
  void Function(List<int> fileBytes, String fileName)? _uploadCsvCallback;

  @override
  void initState() {
    super.initState();
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
    setState(() {
      _isDeletionInProgress = true;
    });
    context.read<VehicleManufacturerBloc>().add(
          VehicleManufacturerEvent.deleteManufacturer(id),
        );
  }

  @override
  Widget build(BuildContext context) {
    final m = widget.vehiclemanufacturer;
    return BlocListener<VehicleManufacturerBloc, VehicleManufacturerState>(
      listenWhen: (prev, curr) {
        // Only listen when deletion is in progress and state changes to loaded or error
        if (!_isDeletionInProgress) return false;
        return curr.maybeWhen(
          loaded: (_) => true,
          error: (_) => true,
          orElse: () => false,
        );
      },
      listener: (context, state) {
        state.maybeWhen(
          loaded: (response) {
            // Only show success message if deletion was in progress
            if (_isDeletionInProgress && mounted) {
              setState(() {
                _isDeletionInProgress = false;
              });
              // Show success popup
              showDialog(
                context: context,
                builder: (dialogContext) => AlertDialog(
                  title: const Text("Success"),
                  content: const Text("Manufacturer deleted successfully."),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(dialogContext).pop();
                        // Navigate back to list page
                        context.pop();
                      },
                      child: const Text("OK"),
                    ),
                  ],
                ),
              );
            }
          },
          error: (message) {
            if (_isDeletionInProgress && mounted) {
              setState(() {
                _isDeletionInProgress = false;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Deletion failed: $message'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          orElse: () {},
        );
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderBar(m),
            const SizedBox(height: 16),
            _heroCard(m),
            const SizedBox(height: 12),
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

  Widget _buildHeaderBar(VehicleManufacturer m) {
    return FormHeaderBar(
      breadcrumb: "Manufacturers / Detail",
      title: m.displayName.isNotEmpty ? m.displayName : m.name,
      onBack: () => context.pop(),
      actions: [
        OutlinedButton.icon(
          onPressed: () => _uploadCsvFile(m),
          icon: const Icon(Icons.upload_file, size: 16),
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.textSecondary,
            side: const BorderSide(color: AppColors.border),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          ),
          label: const Text("Upload CSV"),
        ),
        const SizedBox(width: 8),
        OutlinedButton.icon(
          onPressed: () =>
              context.push('/edit-vehicle_manufacturer', extra: m),
          icon: const Icon(Icons.edit_outlined, size: 16),
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.accent,
            side: const BorderSide(color: AppColors.accent),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          ),
          label: const Text("Edit"),
        ),
        const SizedBox(width: 8),
        IconButton(
          tooltip: "Delete",
          onPressed: () => _confirmDelete(context, m),
          icon: const Icon(Icons.delete_outline, color: AppColors.danger),
        ),
      ],
    );
  }

  Widget _heroCard(VehicleManufacturer m) {
    final hasLogo = m.logo != null && m.logo!.startsWith('http');
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.accentSoft,
              shape: BoxShape.circle,
              image: hasLogo
                  ? DecorationImage(
                      image: NetworkImage(m.logo!), fit: BoxFit.cover)
                  : null,
            ),
            alignment: Alignment.center,
            child: hasLogo
                ? null
                : Text(
                    (m.displayName.isNotEmpty ? m.displayName : m.name)
                        .characters
                        .first
                        .toUpperCase(),
                    style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: AppColors.accent),
                  ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(m.name,
                    style: GoogleFonts.inter(
                        fontSize: 15, fontWeight: FontWeight.w600)),
                const SizedBox(height: 2),
                Text(m.originCountry.isEmpty ? '—' : m.originCountry,
                    style: GoogleFonts.inter(
                        fontSize: 12.5, color: AppColors.textSecondary)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  children: [
                    _chip(prettyVehicleCategory(m.vehicleCategory),
                        AppColors.accentSoft, AppColors.accent),
                    if (m.isPremium)
                      _chip("Premium", AppColors.warningSoft,
                          const Color(0xFF92400E)),
                    m.isActive
                        ? _chip("Active", AppColors.successSoft,
                            const Color(0xFF166534))
                        : _chip("Inactive", AppColors.dangerSoft,
                            const Color(0xFF991B1B)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(VehicleManufacturer m) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.info_outline,
                  size: 16, color: AppColors.textSecondary),
              const SizedBox(width: 8),
              Text("Manufacturer details",
                  style: GoogleFonts.inter(
                      fontSize: 13, fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 12),
          _kv("Name", m.name),
          _kv("Category", prettyVehicleCategory(m.vehicleCategory)),
          _kv("Origin country", m.originCountry.isEmpty ? '—' : m.originCountry),
          _kv("Founded", m.foundedYear?.toString() ?? '—'),
          _kv("Headquarters", _orDash(m.headquarters)),
          _kv("Website", _orDash(m.website)),
          _kv("Active", m.isActive ? "Yes" : "No"),
          _kv("Premium", m.isPremium ? "Yes" : "No"),
          _kv("Description", _orDash(m.description)),
        ],
      ),
    );
  }

  Widget _kv(String k, String v) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: Text(k,
                style: GoogleFonts.inter(
                    fontSize: 12.5, color: AppColors.textMuted)),
          ),
          Expanded(
            child: Text(v,
                style: GoogleFonts.inter(
                    fontSize: 13,
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }

  Widget _chip(String text, Color bg, Color fg) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration:
            BoxDecoration(color: bg, borderRadius: BorderRadius.circular(7)),
        child: Text(text,
            style: GoogleFonts.inter(
                fontSize: 12, fontWeight: FontWeight.w500, color: fg)),
      );

  static String _orDash(String? value) =>
      (value == null || value.trim().isEmpty) ? '—' : value;
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
              return Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                    vertical: 40, horizontal: 20),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.border),
                ),
                child: const Column(
                  children: [
                    Icon(Icons.directions_car_outlined,
                        size: 40, color: AppColors.textMuted),
                    SizedBox(height: 12),
                    Text("No models for this manufacturer",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600)),
                    SizedBox(height: 4),
                    Text(
                      "Add models from the Vehicle Models page, or upload a CSV above.",
                      style: TextStyle(
                          fontSize: 13, color: AppColors.textSecondary),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Vehicle Models (${response.total})",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
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
                                columnSpacing: isTablet ? 20 : 50,
                                headingRowColor: WidgetStateColor.resolveWith(
                                  (states) =>
                                      const Color.fromARGB(66, 144, 140, 140),
                                ),
                                dataRowColor: WidgetStatePropertyAll(
                                    AppColors.primaryColor),
                                dataRowMinHeight: isTablet ? 45 : 55,
                                dataRowMaxHeight: isTablet ? 45 : 55,
                                columns: [
                                  const DataColumn(
                                    label: Padding(
                                      padding: EdgeInsets.only(left: 30),
                                      child: Text(
                                        'ID',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      isTablet ? 'Name' : 'Name',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      isTablet
                                          ? 'Display Name'
                                          : 'Display Name',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      isTablet
                                          ? 'Manufacturer'
                                          : 'Manufacturer',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      isTablet
                                          ? 'Vehicle Type'
                                          : 'Vehicle Type',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      isTablet ? 'Description' : 'Description',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      isTablet ? 'Segment' : 'Segment',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      isTablet ? 'Is Active' : 'Is Active',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      isTablet ? 'Variants' : 'Variant Count',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                                rows: models.asMap().entries.map((entry) {
                                  final index = entry.key;
                                  final model = entry.value;
                                  int rowNumber =
                                      ((response.page - 1) * rowsPerPage) +
                                          index +
                                          1;
                                  return DataRow(
                                    cells: [
                                      DataCell(Padding(
                                        padding:
                                            const EdgeInsets.only(left: 30),
                                        child: Text('$rowNumber'),
                                      )),
                                      DataCell(Text(model.name)),
                                      DataCell(Text(model.displayName)),
                                      DataCell(Text(
                                          model.manufacturer?.displayName ??
                                              model.manufacturer?.name ??
                                              'N/A')),
                                      DataCell(Text(model.vehicleType)),
                                      DataCell(SizedBox(
                                        width: 150,
                                        child: Text(
                                          model.description ?? 'N/A',
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )),
                                      DataCell(SizedBox(
                                        width: 150,
                                        child: Text(
                                          model.segment ?? 'N/A',
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )),
                                      DataCell(Text(
                                          model.isActive?.toString() ?? 'N/A')),
                                      DataCell(Text(
                                          model.variantCount?.toString() ??
                                              '-')),
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
