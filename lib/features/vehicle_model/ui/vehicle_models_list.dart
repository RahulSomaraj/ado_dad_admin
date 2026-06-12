import 'dart:async';

import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/features/vehicle_model/bloc/vehicle_model_bloc.dart';
import 'package:ado_dad_admin/features/widgets/list_page.dart';
import 'package:ado_dad_admin/models/vehicle_model/vehicle_model.dart';
import 'package:ado_dad_admin/models/vehicle_manufacturer/vehicle_manufacturer_model.dart';
import 'package:ado_dad_admin/repositories/vehicle_manufacturer_rep.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class VehicleModelsList extends StatefulWidget {
  const VehicleModelsList({super.key});

  @override
  State<VehicleModelsList> createState() => _VehicleModelsListState();
}

class _VehicleModelsListState extends State<VehicleModelsList> {
  final TextEditingController _searchController = TextEditingController();
  VehicleModelResponse? _lastListResponse;
  final ScrollController _horizontalScrollController = ScrollController();
  final VehicleManufacturerRepository _manufacturerRepository =
      VehicleManufacturerRepository();
  List<VehicleManufacturer> _manufacturers = [];
  String? _selectedManufacturerId;
  bool _isLoadingManufacturers = false;
  bool _isLoadingMoreManufacturers = false;
  String _manufacturerSearchQuery = '';
  final TextEditingController _manufacturerSearchController =
      TextEditingController();
  final GlobalKey _dropdownKey = GlobalKey();
  int _manufacturerCurrentPage = 1;
  bool _hasMoreManufacturers = true;
  StateSetter? _menuSetState;
  Timer? _searchDebounceTimer;
  int rowsPerPage = 10;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchManufacturers();
      context
          .read<VehicleModelBloc>()
          .add(const VehicleModelEvent.fetchAllModels());
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _horizontalScrollController.dispose();
    _manufacturerSearchController.dispose();
    _searchDebounceTimer?.cancel();
    super.dispose();
  }

  Future<void> _fetchManufacturers(
      {bool loadMore = false, String? searchQuery}) async {
    if (searchQuery != null && searchQuery.isNotEmpty) {
      loadMore = false;
    }

    if (loadMore) {
      if (_isLoadingMoreManufacturers || !_hasMoreManufacturers) return;
      setState(() => _isLoadingMoreManufacturers = true);
    } else {
      setState(() {
        _isLoadingManufacturers = true;
        _manufacturerCurrentPage = 1;
        _hasMoreManufacturers = true;
      });
    }

    try {
      int pageToFetch = loadMore ? _manufacturerCurrentPage + 1 : 1;
      final response = await _manufacturerRepository.fetchDropDownManufacturers(
        page: pageToFetch,
        limit: 10,
        searchQuery: searchQuery,
      );

      if (response.data.isEmpty && loadMore) {
        setState(() {
          _hasMoreManufacturers = false;
          _isLoadingMoreManufacturers = false;
        });
        return;
      }

      setState(() {
        if (loadMore) {
          _manufacturers = List<VehicleManufacturer>.from(_manufacturers)
            ..addAll(response.data);
        } else {
          _manufacturers = List<VehicleManufacturer>.from(response.data);
        }
        _manufacturerCurrentPage = response.page;
        _hasMoreManufacturers = response.hasNext;
        _isLoadingManufacturers = false;
        _isLoadingMoreManufacturers = false;
      });

      if (_menuSetState != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_menuSetState != null) {
            _menuSetState!(() {});
          }
        });
      }
    } catch (e) {
      setState(() {
        _isLoadingManufacturers = false;
        _isLoadingMoreManufacturers = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to load manufacturers: ${e.toString()}'),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  bool _onManufacturerScroll(ScrollNotification notification) {
    if (_manufacturerSearchQuery.isEmpty &&
        (notification is ScrollUpdateNotification ||
            notification is ScrollEndNotification)) {
      final metrics = notification.metrics;
      if (metrics.maxScrollExtent > 0 &&
          metrics.pixels >= metrics.maxScrollExtent - 100) {
        if (_hasMoreManufacturers &&
            !_isLoadingMoreManufacturers &&
            !_isLoadingManufacturers) {
          _fetchManufacturers(loadMore: true, searchQuery: null);
        }
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListPageHeader(
            breadcrumb: "Home / Vehicle Models",
            title: "Vehicle Models",
            subtitle: "Manage model catalog",
            searchHint: "Search models…",
            searchController: _searchController,
            onSearch: (query) {
              if (_selectedManufacturerId == null) {
                context.read<VehicleModelBloc>().add(FetchAllVehicleModels(
                    page: 1,
                    limit: rowsPerPage,
                    searchQuery: query.isNotEmpty ? query : ''));
              } else {
                context.read<VehicleModelBloc>().add(
                    VehicleModelEvent.fetchByManufacturer(
                        _selectedManufacturerId!,
                        page: 1,
                        limit: rowsPerPage));
              }
            },
            trailing: _buildManufacturerFilterTrigger(),
            addLabel: "Add model",
            onAdd: () => context.push('/add-vehiclemodel'),
          ),
          const SizedBox(height: 16),
          Container(
            decoration: listCardDecoration(),
            clipBehavior: Clip.antiAlias,
            child: _buildVehicleModelsList(),
          ),
        ],
      ),
    );
  }

  Widget _buildManufacturerFilterTrigger() {
    VehicleManufacturer? selected;
    if (_selectedManufacturerId != null && _manufacturers.isNotEmpty) {
      try {
        selected =
            _manufacturers.firstWhere((m) => m.id == _selectedManufacturerId);
      } catch (_) {
        selected = null;
      }
    }
    return GestureDetector(
      onTap: _isLoadingManufacturers ? null : _showManufacturerDropdown,
      child: Container(
        key: _dropdownKey,
        height: 40,
        constraints: const BoxConstraints(maxWidth: 220),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.filter_alt_outlined,
                size: 16, color: AppColors.textSecondary),
            const SizedBox(width: 8),
            Flexible(
              child: _isLoadingManufacturers
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2))
                  : Text(
                      selected?.displayName ?? 'Filter by manufacturer',
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.inter(
                          fontSize: 13,
                          color: selected != null
                              ? AppColors.textPrimary
                              : AppColors.textSecondary),
                    ),
            ),
            const Icon(Icons.arrow_drop_down, color: AppColors.textSecondary),
          ],
        ),
      ),
    );
  }

  void _showManufacturerDropdown() {
    _manufacturerSearchController.clear();
    _manufacturerSearchQuery = '';
    if (_manufacturers.length < 10) {
      _manufacturerCurrentPage = 1;
      _hasMoreManufacturers = true;
    }

    final RenderBox? renderBox =
        _dropdownKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final Size size = renderBox.size;
    const double dropdownWidth = 300.0;

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        offset.dx + size.width - dropdownWidth,
        offset.dy + size.height + 5,
        offset.dx + size.width,
        offset.dy + size.height + 305,
      ),
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      items: [
        PopupMenuItem<String>(
          enabled: false,
          padding: EdgeInsets.zero,
          child: StatefulBuilder(
            builder: (context, setMenuState) {
              _menuSetState = setMenuState;
              final filteredList = _manufacturers;

              return Container(
                width: dropdownWidth - 2,
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: _manufacturerSearchController,
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: 'Search manufacturers...',
                        prefixIcon: const Icon(Icons.search, size: 20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        isDense: true,
                      ),
                      style: const TextStyle(fontSize: 14),
                      onChanged: (value) {
                        setMenuState(() {
                          _manufacturerSearchQuery = value;
                        });
                        _searchDebounceTimer?.cancel();
                        if (value.isNotEmpty) {
                          _searchDebounceTimer =
                              Timer(const Duration(milliseconds: 500), () {
                            setState(() {
                              _manufacturerCurrentPage = 1;
                              _hasMoreManufacturers = true;
                              _isLoadingMoreManufacturers = false;
                            });
                            _fetchManufacturers(
                                loadMore: false, searchQuery: value);
                          });
                        } else {
                          setState(() {
                            _manufacturerCurrentPage = 1;
                            _hasMoreManufacturers = true;
                            _isLoadingMoreManufacturers = false;
                          });
                          _fetchManufacturers(
                              loadMore: false, searchQuery: null);
                        }
                      },
                    ),
                    const SizedBox(height: 8),
                    Container(
                      constraints: const BoxConstraints(maxHeight: 250),
                      child: filteredList.isEmpty &&
                              _manufacturerSearchQuery.isNotEmpty
                          ? const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text('No manufacturers found',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14)),
                            )
                          : NotificationListener<ScrollNotification>(
                              onNotification: _onManufacturerScroll,
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemCount: filteredList.length +
                                    1 +
                                    (_manufacturerSearchQuery.isEmpty &&
                                            _isLoadingMoreManufacturers
                                        ? 1
                                        : 0),
                                itemBuilder: (context, index) {
                                  if (index == 0) {
                                    final isSelected =
                                        _selectedManufacturerId == null;
                                    return InkWell(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                        setState(() {
                                          _selectedManufacturerId = null;
                                        });
                                        context.read<VehicleModelBloc>().add(
                                            FetchAllVehicleModels(
                                                page: 1, limit: rowsPerPage));
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 12),
                                        color: isSelected
                                            ? Colors.grey[200]
                                            : null,
                                        child: const Text('All Manufacturers',
                                            style: TextStyle(fontSize: 14)),
                                      ),
                                    );
                                  }

                                  if (_manufacturerSearchQuery.isEmpty &&
                                      _isLoadingMoreManufacturers &&
                                      index == filteredList.length + 1) {
                                    return const Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Center(
                                        child: SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: CircularProgressIndicator(
                                              strokeWidth: 2),
                                        ),
                                      ),
                                    );
                                  }

                                  final manufacturer = filteredList[index - 1];
                                  final isSelected = _selectedManufacturerId ==
                                      manufacturer.id;

                                  return InkWell(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                      setState(() {
                                        _selectedManufacturerId =
                                            manufacturer.id;
                                      });
                                      context.read<VehicleModelBloc>().add(
                                          VehicleModelEvent.fetchByManufacturer(
                                              manufacturer.id,
                                              page: 1,
                                              limit: rowsPerPage));
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 12),
                                      color:
                                          isSelected ? Colors.grey[200] : null,
                                      child: Text(manufacturer.displayName,
                                          style:
                                              const TextStyle(fontSize: 14)),
                                    ),
                                  );
                                },
                              ),
                            ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    ).then((_) {
      _menuSetState = null;
    });
  }

  Widget _buildVehicleModelsList() {
    return BlocBuilder<VehicleModelBloc, VehicleModelState>(
      builder: (context, state) {
        return state.when(
          initial: () => _statusBox(Text("No vehicle models found",
              style: GoogleFonts.inter(color: AppColors.textSecondary))),
          loading: () => _statusBox(const CircularProgressIndicator()),
          loaded: (response) {
            _lastListResponse = response;
            return _loadedContent(response);
          },
          error: (message) => _statusBox(
              Text(message, style: GoogleFonts.inter(color: AppColors.danger))),
          optionsLoaded: (_, __) => _renderFromCacheOrEmpty(),
          oneLoaded: (_) => _renderFromCacheOrEmpty(),
          created: () => const SizedBox.shrink(),
          updated: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _renderFromCacheOrEmpty() {
    if (_lastListResponse == null) return const SizedBox.shrink();
    return _loadedContent(_lastListResponse!);
  }

  Widget _loadedContent(VehicleModelResponse r) {
    if (r.data.isEmpty) {
      return _statusBox(Text("No vehicle models found",
          style: GoogleFonts.inter(color: AppColors.textSecondary)));
    }
    return Column(
      children: [
        FillWidthDataTable(
          controller: _horizontalScrollController,
          minWidth: 1240,
          columnSpacing: 36,
          columns: [
            listColumn('#'),
            listColumn('Name'),
            listColumn('Display name'),
            listColumn('Manufacturer'),
            listColumn('Vehicle type'),
            listColumn('Description'),
            listColumn('Segment'),
            listColumn('Active'),
            listColumn('Variants'),
            listColumn('Actions'),
          ],
          rows: r.data
              .asMap()
              .entries
              .map((e) => _buildVehicleModelRow(e.key, e.value, r.page))
              .toList(),
        ),
        ListPagination(
          currentPage: r.page,
          totalPages: r.totalPages,
          rowsPerPage: rowsPerPage,
          onRowsPerPageChanged: (v) {
            setState(() => rowsPerPage = v);
            _fetchModelsPage(1);
          },
          onPageChanged: _fetchModelsPage,
        ),
      ],
    );
  }

  void _fetchModelsPage(int page) {
    if (_selectedManufacturerId == null) {
      context
          .read<VehicleModelBloc>()
          .add(FetchAllVehicleModels(page: page, limit: rowsPerPage));
    } else {
      context.read<VehicleModelBloc>().add(
          VehicleModelEvent.fetchByManufacturer(_selectedManufacturerId!,
              page: page, limit: rowsPerPage));
    }
  }

  Widget _statusBox(Widget child) => Padding(
        padding: const EdgeInsets.all(48),
        child: Center(child: child),
      );

  DataRow _buildVehicleModelRow(
      int index, VehicleModel models, int currentPage) {
    final rowNumber = ((currentPage - 1) * rowsPerPage) + index + 1;
    final cellStyle =
        GoogleFonts.inter(fontSize: 13, color: AppColors.textPrimary);
    final mutedStyle =
        GoogleFonts.inter(fontSize: 13, color: AppColors.textSecondary);
    return DataRow(cells: [
      DataCell(Text('$rowNumber', style: mutedStyle)),
      DataCell(Text(models.name,
          style: cellStyle.copyWith(fontWeight: FontWeight.w500))),
      DataCell(Text(models.displayName, style: mutedStyle)),
      DataCell(Text(
          models.manufacturer?.displayName ??
              models.manufacturer?.name ??
              'N/A',
          style: cellStyle)),
      DataCell(Text(models.vehicleType, style: cellStyle)),
      DataCell(SizedBox(
          width: 160,
          child: Text(models.description ?? 'N/A',
              maxLines: 2, overflow: TextOverflow.ellipsis, style: mutedStyle))),
      DataCell(SizedBox(
          width: 130,
          child: Text(models.segment ?? 'N/A',
              maxLines: 2, overflow: TextOverflow.ellipsis, style: mutedStyle))),
      DataCell(models.isActive == null
          ? Text('—', style: mutedStyle)
          : _activeChip(models.isActive!)),
      DataCell(Text(models.variantCount?.toString() ?? '-', style: cellStyle)),
      DataCell(Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListRowAction(
            icon: Icons.edit_outlined,
            tooltip: "Edit",
            onTap: () => context.push('/edit-vehicle_model', extra: models),
          ),
          ListRowAction(
            icon: Icons.visibility_outlined,
            tooltip: "View",
            onTap: () {
              if (models.id != null) {
                context.push('/view-vehicle_model', extra: models);
              }
            },
          ),
        ],
      )),
    ]);
  }

  Widget _activeChip(bool value) {
    final bg = value ? AppColors.successSoft : AppColors.surfaceAlt;
    final fg = value ? AppColors.success : AppColors.textSecondary;
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
        decoration:
            BoxDecoration(color: bg, borderRadius: BorderRadius.circular(6)),
        child: Text(value ? 'Active' : 'Inactive',
            style: GoogleFonts.inter(
                fontSize: 11, fontWeight: FontWeight.w600, color: fg)),
      ),
    );
  }
}
