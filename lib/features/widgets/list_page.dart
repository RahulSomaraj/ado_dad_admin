import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Shared building blocks for list / management pages so they all match the
/// Advertisements dashboard design. Pages keep their own bloc logic and pass
/// data + callbacks in.

BoxDecoration listCardDecoration() => BoxDecoration(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: AppColors.border),
    );

/// Page header: breadcrumb + title + subtitle on the left, optional search and
/// an "Add" button on the right. Stacks on narrow widths.
class ListPageHeader extends StatelessWidget {
  final String breadcrumb;
  final String title;
  final String? subtitle;
  final String? searchHint;
  final TextEditingController? searchController;
  final ValueChanged<String>? onSearch;
  final String? addLabel;
  final VoidCallback? onAdd;
  final Widget? trailing;

  const ListPageHeader({
    super.key,
    required this.breadcrumb,
    required this.title,
    this.subtitle,
    this.searchHint,
    this.searchController,
    this.onSearch,
    this.addLabel,
    this.onAdd,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final narrow = constraints.maxWidth < 720;

        final titleBlock = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(breadcrumb,
                style:
                    GoogleFonts.inter(fontSize: 12, color: AppColors.textMuted)),
            const SizedBox(height: 2),
            Text(title,
                style: GoogleFonts.inter(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary)),
            if (subtitle != null) ...[
              const SizedBox(height: 2),
              Text(subtitle!,
                  style: GoogleFonts.inter(
                      fontSize: 13, color: AppColors.textSecondary)),
            ],
          ],
        );

        final search = onSearch == null
            ? null
            : _SearchField(
                hint: searchHint ?? "Search…",
                controller: searchController,
                onChanged: onSearch!,
                fullWidth: narrow,
              );

        final addBtn = onAdd == null
            ? null
            : SizedBox(
                height: 40,
                width: narrow ? double.infinity : null,
                child: ElevatedButton.icon(
                  onPressed: onAdd,
                  icon: const Icon(Icons.add, size: 18),
                  label: Text(addLabel ?? "Add"),
                ),
              );

        if (narrow) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              titleBlock,
              const SizedBox(height: 12),
              if (search != null) ...[search, const SizedBox(height: 10)],
              if (trailing != null) ...[trailing!, const SizedBox(height: 10)],
              if (addBtn != null) addBtn,
            ],
          );
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: titleBlock),
            if (search != null) ...[
              SizedBox(width: 240, child: search),
              const SizedBox(width: 10),
            ],
            if (trailing != null) ...[trailing!, const SizedBox(width: 10)],
            if (addBtn != null) addBtn,
          ],
        );
      },
    );
  }
}

class _SearchField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final ValueChanged<String> onChanged;
  final bool fullWidth;

  const _SearchField({
    required this.hint,
    required this.controller,
    required this.onChanged,
    required this.fullWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: GoogleFonts.inter(fontSize: 14, color: AppColors.textPrimary),
        decoration: InputDecoration(
          isDense: true,
          hintText: hint,
          prefixIcon:
              const Icon(Icons.search, size: 18, color: AppColors.textMuted),
          contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
        ),
      ),
    );
  }
}

/// A DataTable that fills available width on large screens and scrolls
/// horizontally below [minWidth].
class FillWidthDataTable extends StatelessWidget {
  final ScrollController controller;
  final List<DataColumn> columns;
  final List<DataRow> rows;
  final double minWidth;
  final double columnSpacing;

  const FillWidthDataTable({
    super.key,
    required this.controller,
    required this.columns,
    required this.rows,
    this.minWidth = 900,
    this.columnSpacing = 48,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final tableWidth =
            constraints.maxWidth > minWidth ? constraints.maxWidth : minWidth;
        return Scrollbar(
          controller: controller,
          thumbVisibility: true,
          child: SingleChildScrollView(
            controller: controller,
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: tableWidth),
              child: DataTable(
                columnSpacing: columnSpacing,
                horizontalMargin: 16,
                headingRowColor: WidgetStateColor.resolveWith(
                    (states) => AppColors.surfaceAlt),
                dataRowColor: WidgetStatePropertyAll(AppColors.surface),
                dividerThickness: 1,
                dataRowMinHeight: 56,
                dataRowMaxHeight: 64,
                columns: columns,
                rows: rows,
              ),
            ),
          ),
        );
      },
    );
  }
}

/// Standard column heading text.
DataColumn listColumn(String label) => DataColumn(
      label: Text(
        label,
        style: GoogleFonts.inter(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: AppColors.textMuted,
            letterSpacing: 0.3),
      ),
    );

/// Standard pagination bar matching the Advertisements page.
class ListPagination extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final int rowsPerPage;
  final List<int> rowsPerPageOptions;
  final ValueChanged<int> onRowsPerPageChanged;
  final ValueChanged<int> onPageChanged;

  const ListPagination({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.rowsPerPage,
    required this.onRowsPerPageChanged,
    required this.onPageChanged,
    this.rowsPerPageOptions = const [10, 20],
  });

  @override
  Widget build(BuildContext context) {
    if (totalPages <= 1) return const SizedBox.shrink();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("Rows per page:",
              style: GoogleFonts.inter(
                  fontSize: 12.5, color: AppColors.textSecondary)),
          const SizedBox(width: 8),
          DropdownButton<int>(
            value: rowsPerPage,
            dropdownColor: Colors.white,
            underline: const SizedBox.shrink(),
            style:
                GoogleFonts.inter(fontSize: 13, color: AppColors.textPrimary),
            items: rowsPerPageOptions
                .map((v) =>
                    DropdownMenuItem<int>(value: v, child: Text(v.toString())))
                .toList(),
            onChanged: (v) {
              if (v != null) onRowsPerPageChanged(v);
            },
          ),
          const SizedBox(width: 20),
          Text("Page $currentPage of $totalPages",
              style: GoogleFonts.inter(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary)),
          const SizedBox(width: 14),
          _arrow(
            icon: Icons.chevron_left,
            enabled: currentPage > 1,
            onTap: () => onPageChanged(currentPage - 1),
          ),
          const SizedBox(width: 6),
          _arrow(
            icon: Icons.chevron_right,
            enabled: currentPage < totalPages,
            onTap: () => onPageChanged(currentPage + 1),
          ),
        ],
      ),
    );
  }

  Widget _arrow({
    required IconData icon,
    required bool enabled,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: enabled ? onTap : null,
      borderRadius: BorderRadius.circular(7),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Icon(icon,
            size: 18,
            color: enabled ? AppColors.textPrimary : AppColors.textMuted),
      ),
    );
  }
}

/// Small rounded icon action button used in table rows.
class ListRowAction extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final String tooltip;
  final VoidCallback onTap;

  const ListRowAction({
    super.key,
    required this.icon,
    required this.tooltip,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Icon(icon, size: 18, color: color ?? AppColors.textSecondary),
        ),
      ),
    );
  }
}
