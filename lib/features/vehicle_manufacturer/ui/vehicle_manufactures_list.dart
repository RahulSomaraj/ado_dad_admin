import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/features/vehicle_manufacturer/bloc/bloc/vehicle_manufacturer_bloc.dart';
import 'package:ado_dad_admin/features/widgets/list_page.dart';
import 'package:ado_dad_admin/models/vehicle_manufacturer/vehicle_manufacturer_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class VehicleManufacturesList extends StatefulWidget {
  const VehicleManufacturesList({super.key});

  @override
  State<VehicleManufacturesList> createState() =>
      _VehicleManufacturesListState();
}

class _VehicleManufacturesListState extends State<VehicleManufacturesList> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _horizontalScrollController = ScrollController();
  String? _selectedCategory;
  int rowsPerPage = 10;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<VehicleManufacturerBloc>()
          .add(const FetchAllVehicleManufacturers(page: 1, limit: 10));
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _horizontalScrollController.dispose();
    super.dispose();
  }

  /// Helper method to create FetchAllVehicleManufacturers event
  FetchAllVehicleManufacturers _createFetchEvent({
    required int page,
    required int limit,
    String? searchQuery,
    String? category,
  }) {
    final finalSearchQuery =
        (searchQuery != null && searchQuery.trim().isNotEmpty)
            ? searchQuery.trim()
            : null;
    final finalCategory = (category != null && category.trim().isNotEmpty)
        ? category.trim()
        : null;

    if (finalCategory != null && finalSearchQuery != null) {
      return FetchAllVehicleManufacturers(
          page: page,
          limit: limit,
          searchQuery: finalSearchQuery,
          category: finalCategory);
    } else if (finalCategory != null) {
      return FetchAllVehicleManufacturers(
          page: page, limit: limit, category: finalCategory);
    } else if (finalSearchQuery != null) {
      return FetchAllVehicleManufacturers(
          page: page, limit: limit, searchQuery: finalSearchQuery);
    } else {
      return FetchAllVehicleManufacturers(page: page, limit: limit);
    }
  }

  void _onCategoryChanged(String? category) {
    setState(() => _selectedCategory = category);
    final searchQuery = _searchController.text.trim().isEmpty
        ? null
        : _searchController.text.trim();
    context.read<VehicleManufacturerBloc>().add(
          _createFetchEvent(
            page: 1,
            limit: rowsPerPage,
            searchQuery: searchQuery,
            category: category,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListPageHeader(
            breadcrumb: "Home / Vehicle Manufacturers",
            title: "Vehicle Manufacturers",
            subtitle: "Manage manufacturer catalog",
            searchHint: "Search manufacturers…",
            searchController: _searchController,
            onSearch: (query) {
              final searchQuery = query.trim().isEmpty ? null : query.trim();
              context.read<VehicleManufacturerBloc>().add(
                    _createFetchEvent(
                      page: 1,
                      limit: rowsPerPage,
                      searchQuery: searchQuery,
                      category: _selectedCategory,
                    ),
                  );
            },
            trailing: _buildCategoryDropdown(),
            addLabel: "Add manufacturer",
            onAdd: () => context.push('/add-vehiclemanufacturer'),
          ),
          const SizedBox(height: 16),
          Container(
            decoration: listCardDecoration(),
            clipBehavior: Clip.antiAlias,
            child: _buildCompanyList(),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryDropdown() {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      child: DropdownButton<String>(
        value: _selectedCategory,
        hint: Text('All categories',
            style:
                GoogleFonts.inter(fontSize: 13, color: AppColors.textSecondary)),
        isDense: true,
        underline: const SizedBox.shrink(),
        icon: const Icon(Icons.arrow_drop_down, color: AppColors.textSecondary),
        style: GoogleFonts.inter(fontSize: 13, color: AppColors.textPrimary),
        items: const [
          DropdownMenuItem<String>(value: null, child: Text('All categories')),
          DropdownMenuItem<String>(
              value: 'two_wheeler', child: Text('Two Wheeler')),
          DropdownMenuItem<String>(
              value: 'passenger_car', child: Text('Passenger Car')),
          DropdownMenuItem<String>(
              value: 'commercial_vehicle', child: Text('Commercial Vehicle')),
          DropdownMenuItem<String>(value: 'luxury', child: Text('Luxury')),
          DropdownMenuItem<String>(value: 'suv', child: Text('SUV')),
        ],
        onChanged: _onCategoryChanged,
      ),
    );
  }

  Widget _buildCompanyList() {
    return BlocBuilder<VehicleManufacturerBloc, VehicleManufacturerState>(
      builder: (context, state) {
        return state.when(
          initial: () => _statusBox(Text("No manufacturers found",
              style: GoogleFonts.inter(color: AppColors.textSecondary))),
          loading: () => _statusBox(const CircularProgressIndicator()),
          loaded: (response) {
            if (response.data.isEmpty) {
              return _statusBox(Text("No manufacturers found",
                  style: GoogleFonts.inter(color: AppColors.textSecondary)));
            }
            return Column(
              children: [
                FillWidthDataTable(
                  controller: _horizontalScrollController,
                  minWidth: 900,
                  columns: [
                    listColumn('#'),
                    listColumn('Name'),
                    listColumn('Display name'),
                    listColumn('Origin country'),
                    listColumn('Premium'),
                    listColumn('Actions'),
                  ],
                  rows: response.data
                      .asMap()
                      .entries
                      .map((e) => _buildCompanyRow(e.key, e.value, response.page))
                      .toList(),
                ),
                ListPagination(
                  currentPage: response.page,
                  totalPages: response.totalPages,
                  rowsPerPage: rowsPerPage,
                  onRowsPerPageChanged: (v) {
                    setState(() => rowsPerPage = v);
                    _fetchPage(1);
                  },
                  onPageChanged: _fetchPage,
                ),
              ],
            );
          },
          error: (message) => _statusBox(Text(message,
              style: GoogleFonts.inter(color: AppColors.danger))),
          dropdownLoaded: (_, __, ___) => const SizedBox.shrink(),
        );
      },
    );
  }

  void _fetchPage(int page) {
    final searchQuery = _searchController.text.trim().isEmpty
        ? null
        : _searchController.text.trim();
    context.read<VehicleManufacturerBloc>().add(_createFetchEvent(
          page: page,
          limit: rowsPerPage,
          searchQuery: searchQuery,
          category: _selectedCategory,
        ));
  }

  Widget _statusBox(Widget child) => Padding(
        padding: const EdgeInsets.all(48),
        child: Center(child: child),
      );

  DataRow _buildCompanyRow(
      int index, VehicleManufacturer manufacturer, int currentPage) {
    final rowNumber = ((currentPage - 1) * rowsPerPage) + index + 1;
    final cellStyle =
        GoogleFonts.inter(fontSize: 13, color: AppColors.textPrimary);
    return DataRow(cells: [
      DataCell(Text('$rowNumber',
          style: GoogleFonts.inter(
              fontSize: 13, color: AppColors.textSecondary))),
      DataCell(SizedBox(
        width: 150,
        child: Text(manufacturer.name,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: cellStyle.copyWith(fontWeight: FontWeight.w500)),
      )),
      DataCell(SizedBox(
        width: 150,
        child: Text(manufacturer.displayName,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: GoogleFonts.inter(
                fontSize: 13, color: AppColors.textSecondary)),
      )),
      DataCell(Text(manufacturer.originCountry, style: cellStyle)),
      DataCell(_yesNoChip(manufacturer.isPremium)),
      DataCell(Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListRowAction(
            icon: Icons.edit_outlined,
            tooltip: "Edit",
            onTap: () =>
                context.push('/edit-vehicle_manufacturer', extra: manufacturer),
          ),
          ListRowAction(
            icon: Icons.visibility_outlined,
            tooltip: "View",
            onTap: () =>
                context.push('/view-vehicle_manufacturer', extra: manufacturer),
          ),
        ],
      )),
    ]);
  }

  Widget _yesNoChip(bool value) {
    final bg = value ? AppColors.successSoft : AppColors.surfaceAlt;
    final fg = value ? AppColors.success : AppColors.textSecondary;
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
        decoration:
            BoxDecoration(color: bg, borderRadius: BorderRadius.circular(6)),
        child: Text(value ? 'Yes' : 'No',
            style: GoogleFonts.inter(
                fontSize: 11, fontWeight: FontWeight.w600, color: fg)),
      ),
    );
  }
}
