import 'dart:async';

import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/features/widgets/inventory_filter_bar.dart';
import 'package:ado_dad_admin/features/widgets/list_page.dart';
import 'package:ado_dad_admin/models/vehicle_variant/variant_list_item.dart';
import 'package:ado_dad_admin/repositories/vehicle_variant_rep.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

/// Standalone, cross-model listing of vehicle variants.
///
/// Additive surface — the embedded per-model variant section (inside the model
/// detail page) is unchanged. This page lets admins browse/search every variant
/// with its parent model, and jump into the variant detail/edit screens.
class VehicleVariantsList extends StatefulWidget {
  const VehicleVariantsList({super.key});

  @override
  State<VehicleVariantsList> createState() => _VehicleVariantsListState();
}

class _VehicleVariantsListState extends State<VehicleVariantsList> {
  final VehicleVariantRepository _repo = VehicleVariantRepository();
  final ScrollController _hController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  bool _loading = true;
  String? _error;
  String _search = '';
  String? _status; // 'true' | 'false' | null
  int _page = 1;
  int _limit = 10;
  int _totalPages = 1;
  int _total = 0;
  List<VariantListItem> _items = [];

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _hController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _fetch() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final res = await _repo.fetchAllVariantsDetailed(
        page: _page,
        limit: _limit,
        searchQuery: _search,
        isActive: _status == null ? null : _status == 'true',
      );
      if (!mounted) return;
      setState(() {
        _items = res.items;
        _total = res.total;
        _totalPages = res.totalPages < 1 ? 1 : res.totalPages;
        _page = res.page;
        _limit = res.limit;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

  void _onSearch(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 450), () {
      _search = value;
      _page = 1;
      _fetch();
    });
  }

  String _money(int? v) => v == null ? '—' : '₹$v';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListPageHeader(
            breadcrumb: "Vehicle Inventory / Variants",
            title: "Vehicle Variants",
            subtitle: _loading
                ? "Loading…"
                : "$_total variant${_total == 1 ? '' : 's'} across all models",
          ),
          const SizedBox(height: 14),
          InventoryFilterBar(
            searchController: _searchController,
            searchHint: "Search variants…",
            onSearch: _onSearch,
            searchActive: _search.isNotEmpty,
            dropdowns: [
              InventoryDropdownFilter(
                label: "Status",
                allLabel: "All statuses",
                value: _status,
                options: kStatusFilterOptions,
                onChanged: (v) {
                  setState(() => _status = v);
                  _page = 1;
                  _fetch();
                },
              ),
            ],
            onReset: () {
              _searchController.clear();
              setState(() {
                _search = '';
                _status = null;
                _page = 1;
              });
              _fetch();
            },
          ),
          const SizedBox(height: 16),
          Container(
            decoration: listCardDecoration(),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                _body(),
                if (!_loading && _error == null && _items.isNotEmpty)
                  ListPagination(
                    currentPage: _page,
                    totalPages: _totalPages,
                    rowsPerPage: _limit,
                    onRowsPerPageChanged: (v) {
                      _limit = v;
                      _page = 1;
                      _fetch();
                    },
                    onPageChanged: (p) {
                      _page = p;
                      _fetch();
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _body() {
    if (_loading) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 60),
        child: Center(child: CircularProgressIndicator()),
      );
    }
    if (_error != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 20),
        child: Column(
          children: [
            const Icon(Icons.error_outline,
                size: 40, color: AppColors.textMuted),
            const SizedBox(height: 12),
            Text("Couldn't load variants",
                style: GoogleFonts.inter(
                    fontSize: 15, fontWeight: FontWeight.w600)),
            const SizedBox(height: 4),
            Text(_error!,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                    fontSize: 12.5, color: AppColors.textSecondary)),
            const SizedBox(height: 16),
            OutlinedButton(onPressed: _fetch, child: const Text("Retry")),
          ],
        ),
      );
    }
    if (_items.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 56, horizontal: 20),
        child: Column(
          children: [
            const Icon(Icons.tune, size: 40, color: AppColors.textMuted),
            const SizedBox(height: 12),
            Text(
                _search.isEmpty
                    ? "No variants found"
                    : "No variants match \"$_search\"",
                style: GoogleFonts.inter(
                    fontSize: 15, fontWeight: FontWeight.w600)),
            const SizedBox(height: 4),
            Text("Variants are added from a model's detail page.",
                style: GoogleFonts.inter(
                    fontSize: 13, color: AppColors.textSecondary)),
          ],
        ),
      );
    }

    return FillWidthDataTable(
      controller: _hController,
      showCheckboxColumn: false,
      minWidth: 800,
      columns: [
        listColumn("VARIANT"),
        listColumn("MODEL"),
        listColumn("FUEL"),
        listColumn("PRICE"),
        listColumn("STATUS"),
        listColumn("ACTIONS"),
      ],
      rows: _items.map((it) {
        final v = it.variant;
        return DataRow(
          onSelectChanged: (_) => context.push(
            '/view-vehiclevariant',
            extra: {'variant': v, 'vehicleModel': it.model},
          ),
          cells: [
            DataCell(Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(v.displayName.isNotEmpty ? v.displayName : v.name,
                    style: GoogleFonts.inter(
                        fontSize: 13, fontWeight: FontWeight.w600)),
                if (v.name.isNotEmpty && v.name != v.displayName)
                  Text(v.name,
                      style: GoogleFonts.inter(
                          fontSize: 11.5, color: AppColors.textMuted)),
              ],
            )),
            DataCell(Text(it.modelName,
                style: GoogleFonts.inter(fontSize: 13))),
            DataCell(Text(v.fuelType?.displayName ?? '—',
                style: GoogleFonts.inter(fontSize: 13))),
            DataCell(Text(_money(v.price),
                style: GoogleFonts.inter(
                    fontSize: 13, fontWeight: FontWeight.w600))),
            DataCell(_statusChip(v.isActive)),
            DataCell(Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListRowAction(
                  icon: Icons.visibility_outlined,
                  tooltip: "View",
                  onTap: () => context.push(
                    '/view-vehiclevariant',
                    extra: {'variant': v, 'vehicleModel': it.model},
                  ),
                ),
                ListRowAction(
                  icon: Icons.edit_outlined,
                  tooltip: "Edit",
                  onTap: () => context.push(
                    '/edit-vehiclevariant',
                    extra: {'variant': v, 'vehicleModel': it.model},
                  ),
                ),
              ],
            )),
          ],
        );
      }).toList(),
    );
  }

  Widget _statusChip(bool active) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: active ? AppColors.successSoft : AppColors.dangerSoft,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Text(active ? "Active" : "Inactive",
          style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: active ? const Color(0xFF166534) : const Color(0xFF991B1B))),
    );
  }
}
