import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// One selectable option inside an [InventoryDropdownFilter].
class InventoryFilterOption {
  final String value;
  final String label;
  const InventoryFilterOption(this.value, this.label);
}

/// Declarative description of a single dropdown filter rendered by
/// [InventoryFilterBar]. The owning page keeps the selected [value] in its
/// own state and rebuilds; the bar is stateless.
class InventoryDropdownFilter {
  final String label; // e.g. "Status"
  final String allLabel; // shown when nothing selected, e.g. "All statuses"
  final String? value; // selected option value (null = all)
  final List<InventoryFilterOption> options;
  final ValueChanged<String?> onChanged;

  const InventoryDropdownFilter({
    required this.label,
    required this.allLabel,
    required this.value,
    required this.options,
    required this.onChanged,
  });

  String? get selectedLabel {
    if (value == null) return null;
    for (final o in options) {
      if (o.value == value) return o.label;
    }
    return value;
  }
}

/// Shared filter bar for the vehicle-inventory list pages (manufacturers,
/// models, variants). Renders a search box, a set of dropdown filters, a Reset
/// action and removable chips for the active selections. Purely presentational
/// — all state lives in the parent page.
class InventoryFilterBar extends StatelessWidget {
  final TextEditingController? searchController;
  final String searchHint;
  final ValueChanged<String>? onSearch;
  final List<InventoryDropdownFilter> dropdowns;

  /// Called when the user taps Reset. The page should clear search + all
  /// dropdown values. Reset only appears when something is active.
  final VoidCallback? onReset;

  /// Whether the search field currently has text (so Reset can show even when
  /// no dropdown is selected). The bar can't see the controller's text changes
  /// reliably, so the page passes this in.
  final bool searchActive;

  /// Optional trailing widget (e.g. a custom manufacturer picker that can't be
  /// expressed as a simple dropdown).
  final Widget? trailing;

  const InventoryFilterBar({
    super.key,
    this.searchController,
    this.searchHint = 'Search…',
    this.onSearch,
    this.dropdowns = const [],
    this.onReset,
    this.searchActive = false,
    this.trailing,
  });

  bool get _anyActive =>
      searchActive || dropdowns.any((d) => d.value != null);

  @override
  Widget build(BuildContext context) {
    final activeChips = dropdowns.where((d) => d.value != null).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 8,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            if (onSearch != null)
              SizedBox(width: 240, child: _searchField()),
            ...dropdowns.map(_dropdown),
            if (trailing != null) trailing!,
            if (_anyActive && onReset != null)
              TextButton.icon(
                onPressed: onReset,
                icon: const Icon(Icons.close, size: 16),
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.textSecondary,
                ),
                label: Text("Reset",
                    style: GoogleFonts.inter(fontSize: 13)),
              ),
          ],
        ),
        if (activeChips.isNotEmpty) ...[
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: activeChips
                .map((d) => _chip(
                      "${d.label}: ${d.selectedLabel}",
                      () => d.onChanged(null),
                    ))
                .toList(),
          ),
        ],
      ],
    );
  }

  Widget _searchField() {
    return SizedBox(
      height: 40,
      child: TextField(
        controller: searchController,
        onChanged: onSearch,
        style: GoogleFonts.inter(fontSize: 14, color: AppColors.textPrimary),
        decoration: InputDecoration(
          isDense: true,
          hintText: searchHint,
          prefixIcon:
              const Icon(Icons.search, size: 18, color: AppColors.textMuted),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
        ),
      ),
    );
  }

  Widget _dropdown(InventoryDropdownFilter f) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
            color: f.value != null ? AppColors.accent : AppColors.border),
      ),
      child: DropdownButton<String?>(
        value: f.value,
        hint: Text(f.allLabel,
            style:
                GoogleFonts.inter(fontSize: 13, color: AppColors.textSecondary)),
        isDense: true,
        underline: const SizedBox.shrink(),
        dropdownColor: Colors.white,
        icon: const Icon(Icons.arrow_drop_down, color: AppColors.textSecondary),
        style: GoogleFonts.inter(fontSize: 13, color: AppColors.textPrimary),
        items: [
          DropdownMenuItem<String?>(value: null, child: Text(f.allLabel)),
          ...f.options.map((o) =>
              DropdownMenuItem<String?>(value: o.value, child: Text(o.label))),
        ],
        onChanged: f.onChanged,
      ),
    );
  }

  Widget _chip(String text, VoidCallback onRemove) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 6, top: 5, bottom: 5),
      decoration: BoxDecoration(
        color: AppColors.accentSoft,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text,
              style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.accent)),
          const SizedBox(width: 4),
          InkWell(
            onTap: onRemove,
            borderRadius: BorderRadius.circular(999),
            child: const Icon(Icons.close, size: 14, color: AppColors.accent),
          ),
        ],
      ),
    );
  }
}

/// Status options shared by all three inventory lists.
const List<InventoryFilterOption> kStatusFilterOptions = [
  InventoryFilterOption('true', 'Active'),
  InventoryFilterOption('false', 'Inactive'),
];
