import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/common/text_style.dart';
import 'package:ado_dad_admin/features/banner/bloc/banner_bloc.dart';
import 'package:ado_dad_admin/models/banner_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class BannerPage extends StatefulWidget {
  const BannerPage({super.key});

  @override
  State<BannerPage> createState() => _BannerPageState();
}

class _BannerPageState extends State<BannerPage> {
  final ScrollController _horizontalScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Initialize banner data when page loads
    context.read<BannerBloc>().add(const FetchAllBanners(page: 1, limit: 10));
  }

  void _showDeleteDialog(BuildContext context, String bannerId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          title: Center(
            child: const Text(
              "Confirm Delete",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          content: const Text(
            "Are you sure you want to delete this banner?",
          ),
          actions: [
            TextButton(
              onPressed: () => context.pop(),
              child: const Text(
                "Cancel",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () {
                _deleteUser(bannerId);
                context.pop();
              },
              child: const Text(
                "Delete",
                style: TextStyle(color: Colors.white),
              ),
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
          title: const Text("Success"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void _deleteUser(String bannerId) {
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
        child: Column(
          children: [
            _buildHeaderSection(),
            _buildBannerList(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _horizontalScrollController.dispose();
    super.dispose();
  }

  Widget _buildHeaderSection() {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600 && screenWidth <= 900;

    return Padding(
      padding: const EdgeInsets.all(15),
      child: isTablet
          ? Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth < 600 ? 20 : 100, vertical: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Banner Management",
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final buttonWidth = constraints.maxWidth;

                        // Dynamically adjust content based on width
                        double iconSize = buttonWidth < 180 ? 18 : 20;
                        double fontSize = buttonWidth < 180 ? 12 : 14;
                        double spacing = buttonWidth < 180 ? 4 : 6;

                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.blackColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 10),
                            textStyle: TextStyle(
                                fontSize: fontSize,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () async {
                            context.push('/upload-banners');
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add,
                                  color: Colors.white, size: iconSize),
                              SizedBox(width: spacing),
                              Flexible(
                                child: Text(
                                  "Add Banner",
                                  style: TextStyle(fontSize: fontSize),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Banner Management",
                    style: AppTextStyle.titleTextstyle,
                  ),
                  ElevatedButton.icon(
                    onPressed: () async {
                      context.push('/upload-banners');
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blackColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    label: const Text("Add Banner"),
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
          initial: () => const Center(child: Text("No Banners Found")),
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (banners) => Column(
            children: [
              // _buildBannerTable(banners, 1), // temp currentPage
              // const SizedBox(height: 30),
              // _buildPaginationBar(1, 1),
            ],
          ),
          failure: (message) => Center(
            child: Text(message, style: const TextStyle(color: Colors.red)),
          ),
          loaded: (banners, totalPages, currentPage) => Column(
            children: [
              _buildBannerTable(banners, currentPage),
              const SizedBox(height: 20),
              _buildPaginationBar(currentPage, totalPages),
            ],
          ),
          updated: () => const Center(
            child: Text('Banner Updated Successfully'),
          ),
          deleted: () => const Center(
            child: Text('Banner Deleted Successfully'),
          ),
        );
      },
    );
  }

  Widget _buildBannerTable(List<BannerUploadRequest> banners, int currentPage) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600 && screenWidth <= 900;
    final isMobile = screenWidth <= 600;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Scrollbar(
            thumbVisibility: true,
            controller: _horizontalScrollController,
            child: SingleChildScrollView(
              controller: _horizontalScrollController,
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: constraints.maxWidth,
                ),
                child: IntrinsicWidth(
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: DataTable(
                        columnSpacing: isMobile ? 8 : (isTablet ? 20 : 30),
                        headingRowColor: WidgetStateColor.resolveWith(
                          (states) => const Color.fromARGB(66, 144, 140, 140),
                        ),
                        dataRowColor:
                            WidgetStatePropertyAll(AppColors.primaryColor),
                        dataRowMinHeight: isMobile ? 35 : (isTablet ? 40 : 45),
                        dataRowMaxHeight: isMobile ? 35 : (isTablet ? 40 : 45),
                        columns: [
                          DataColumn(
                            label: Padding(
                              padding: EdgeInsets.only(left: isMobile ? 8 : 16),
                              child: Text('ID',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: isMobile ? 12 : 14,
                                  )),
                            ),
                          ),
                          DataColumn(
                              label: Text('Title',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: isMobile ? 12 : 14,
                                  ))),
                          if (!isMobile) ...[
                            DataColumn(
                                label: Text('Desktop Image',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: isMobile ? 12 : 14,
                                    ))),
                            DataColumn(
                                label: Text('Phone Image',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: isMobile ? 12 : 14,
                                    ))),
                            DataColumn(
                                label: Text('Tablet Image',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: isMobile ? 12 : 14,
                                    ))),
                          ],
                          DataColumn(
                              label: Text('Date Uploaded',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: isMobile ? 12 : 14,
                                  ))),
                          DataColumn(
                              label: Text('Actions',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: isMobile ? 12 : 14,
                                  ))),
                        ],
                        rows: banners.asMap().entries.map((entry) {
                          return _buildBannerRow(
                              entry.key, entry.value, currentPage);
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  int rowsPerPage = 10;

  Widget _buildPaginationBar(int currentPage, int totalPages) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 20, bottom: 10),
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
                  setState(() {
                    rowsPerPage = value;
                  });
                  context
                      .read<BannerBloc>()
                      .add(FetchAllBanners(page: 1, limit: rowsPerPage));
                }
              },
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: currentPage > 1
                  ? () {
                      context.read<BannerBloc>().add(FetchAllBanners(
                          page: currentPage - 1, limit: rowsPerPage));
                    }
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
                  ? () {
                      context.read<BannerBloc>().add(FetchAllBanners(
                          page: currentPage + 1, limit: rowsPerPage));
                    }
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

  DataRow _buildBannerRow(
      int index, BannerUploadRequest banner, int currentPage) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 600;

    int rowNumber = ((currentPage - 1) * rowsPerPage) + index + 1;
    return DataRow(cells: [
      DataCell(Padding(
        padding: EdgeInsets.only(left: isMobile ? 8 : 30),
        child: Text(
          '$rowNumber',
          style: TextStyle(fontSize: isMobile ? 12 : 14),
        ),
      )),
      DataCell(SizedBox(
        width: isMobile ? 120 : 200,
        child: Text(
          banner.title,
          style: TextStyle(fontSize: isMobile ? 12 : 14),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
      )),
      if (!isMobile) ...[
        DataCell(SizedBox(
          width: 150,
          child: Text(
            banner.desktopImage,
            style: const TextStyle(fontSize: 12),
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        )),
        DataCell(SizedBox(
            width: 150,
            child: Text(
              banner.phoneImage,
              style: const TextStyle(fontSize: 12),
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ))),
        DataCell(SizedBox(
            width: 150,
            child: Text(
              banner.tabletImage,
              style: const TextStyle(fontSize: 12),
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ))),
      ],
      DataCell(SizedBox(
        width: isMobile ? 100 : 120,
        child: Text(
          banner.createdAt != null
              ? DateFormat('dd/MM/yyyy hh:mm a').format(banner.createdAt!)
              : 'N/A',
          style: TextStyle(fontSize: isMobile ? 10 : 12),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
      )),
      DataCell(
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                Icons.edit,
                color: const Color.fromARGB(255, 59, 59, 59),
                size: isMobile ? 18 : 24,
              ),
              onPressed: () {
                context.push('/edit-banner', extra: banner);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.delete,
                color: const Color.fromARGB(255, 20, 20, 20),
                size: isMobile ? 18 : 24,
              ),
              onPressed: () {
                _showDeleteDialog(context, banner.id!);
              },
            ),
          ],
        ),
      ),
    ]);
  }
}
