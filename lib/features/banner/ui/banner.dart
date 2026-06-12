import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/features/banner/bloc/banner_bloc.dart';
import 'package:ado_dad_admin/features/widgets/list_page.dart';
import 'package:ado_dad_admin/models/banner_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class BannerPage extends StatefulWidget {
  const BannerPage({super.key});

  @override
  State<BannerPage> createState() => _BannerPageState();
}

class _BannerPageState extends State<BannerPage> {
  final ScrollController _horizontalScrollController = ScrollController();
  int rowsPerPage = 10;

  @override
  void initState() {
    super.initState();
    context.read<BannerBloc>().add(const FetchAllBanners(page: 1, limit: 10));
  }

  @override
  void dispose() {
    _horizontalScrollController.dispose();
    super.dispose();
  }

  void _showDeleteDialog(BuildContext context, String bannerId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
          title: const Text("Confirm delete",
              style: TextStyle(fontWeight: FontWeight.bold)),
          content: const Text("Are you sure you want to delete this banner?"),
          actions: [
            TextButton(
                onPressed: () => context.pop(), child: const Text("Cancel")),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.danger,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
              ),
              onPressed: () {
                _deleteBanner(bannerId);
                context.pop();
              },
              child:
                  const Text("Delete", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessPopup(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          title: const Text("Success"),
          content: Text(message),
          actions: [
            TextButton(onPressed: () => context.pop(), child: const Text("OK")),
          ],
        );
      },
    );
  }

  void _deleteBanner(String bannerId) {
    context.read<BannerBloc>().add(DeleteBanner(bannerId: bannerId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BannerBloc, BannerState>(
      listener: (context, state) {
        state.maybeWhen(
          deleted: () {
            _showSuccessPopup(context, "Banner deleted successfully!");
          },
          orElse: () {},
        );
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListPageHeader(
              breadcrumb: "Home / Banners",
              title: "Banners",
              subtitle: "Manage homepage banners",
              addLabel: "Add banner",
              onAdd: () => context.push('/upload-banners'),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: listCardDecoration(),
              clipBehavior: Clip.antiAlias,
              child: _buildBannerList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBannerList() {
    return BlocBuilder<BannerBloc, BannerState>(
      builder: (context, state) {
        return state.when(
          initial: () => _statusBox(Text("No banners found",
              style: GoogleFonts.inter(color: AppColors.textSecondary))),
          loading: () => _statusBox(const CircularProgressIndicator()),
          success: (banners) => const SizedBox.shrink(),
          failure: (message) => _statusBox(
              Text(message, style: GoogleFonts.inter(color: AppColors.danger))),
          loaded: (banners, totalPages, currentPage) {
            if (banners.isEmpty) {
              return _statusBox(Text("No banners found",
                  style: GoogleFonts.inter(color: AppColors.textSecondary)));
            }
            return Column(
              children: [
                FillWidthDataTable(
                  controller: _horizontalScrollController,
                  minWidth: 760,
                  columns: [
                    listColumn('#'),
                    listColumn('Preview'),
                    listColumn('Title'),
                    listColumn('Uploaded'),
                    listColumn('Actions'),
                  ],
                  rows: banners
                      .asMap()
                      .entries
                      .map((e) => _buildBannerRow(e.key, e.value, currentPage))
                      .toList(),
                ),
                ListPagination(
                  currentPage: currentPage,
                  totalPages: totalPages,
                  rowsPerPage: rowsPerPage,
                  onRowsPerPageChanged: (v) {
                    setState(() => rowsPerPage = v);
                    context
                        .read<BannerBloc>()
                        .add(FetchAllBanners(page: 1, limit: rowsPerPage));
                  },
                  onPageChanged: (p) {
                    context
                        .read<BannerBloc>()
                        .add(FetchAllBanners(page: p, limit: rowsPerPage));
                  },
                ),
              ],
            );
          },
          updated: () => _statusBox(const CircularProgressIndicator()),
          deleted: () => _statusBox(const CircularProgressIndicator()),
        );
      },
    );
  }

  Widget _statusBox(Widget child) => Padding(
        padding: const EdgeInsets.all(48),
        child: Center(child: child),
      );

  DataRow _buildBannerRow(
      int index, BannerUploadRequest banner, int currentPage) {
    final rowNumber = ((currentPage - 1) * rowsPerPage) + index + 1;
    return DataRow(cells: [
      DataCell(Text('$rowNumber',
          style: GoogleFonts.inter(
              fontSize: 13, color: AppColors.textSecondary))),
      DataCell(_bannerPreview(banner.desktopImage)),
      DataCell(SizedBox(
        width: 240,
        child: Text(banner.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary)),
      )),
      DataCell(Text(
          banner.createdAt != null
              ? DateFormat('dd/MM/yyyy hh:mm a').format(banner.createdAt!)
              : 'N/A',
          style: GoogleFonts.inter(
              fontSize: 12.5, color: AppColors.textSecondary))),
      DataCell(Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListRowAction(
            icon: Icons.edit_outlined,
            tooltip: "Edit",
            onTap: () => context.push('/edit-banner', extra: banner),
          ),
          ListRowAction(
            icon: Icons.delete_outline,
            tooltip: "Delete",
            color: AppColors.danger,
            onTap: () => _showDeleteDialog(context, banner.id!),
          ),
        ],
      )),
    ]);
  }

  Widget _bannerPreview(String url) {
    return Container(
      width: 72,
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.surfaceAlt,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.border),
      ),
      clipBehavior: Clip.antiAlias,
      child: url.isEmpty
          ? const Icon(Icons.image_outlined,
              size: 18, color: AppColors.textMuted)
          : Image.network(
              url,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const Icon(Icons.broken_image_outlined,
                  size: 18, color: AppColors.textMuted),
            ),
    );
  }
}
