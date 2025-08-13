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
  // @override
  // void initState() {
  //   super.initState();
  //   context.read<BannerBloc>().add(const FetchAllBanners(page: 1, limit: 10));
  // }

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
              onPressed: () => context.pop(),
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void _deleteUser(String bannerId) {
    context.read<BannerBloc>().add(DeleteBanner(bannerId: bannerId));

    Future.delayed(const Duration(milliseconds: 500), () {
      _showSuccessPopup(context, "Banner deleted successfully!");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(30),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Banner Management",
                    style: AppTextStyle.titleTextstyle,
                  ),
                  // Text(
                  //   "",
                  //   style: AppTextStyle.titleTextstyle,
                  // ),

                  ElevatedButton.icon(
                    onPressed: () async {
                      context.push('/upload-banners');
                      // final result = await context.push('/upload-banners');
                      // if (result == true) {
                      //   context
                      //       .read<BannerBloc>()
                      //       .add(const FetchAllBanners(page: 1, limit: 10));
                      // }
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
          ),
        ),
        _buildBannerList(),
      ],
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
              const SizedBox(height: 30),
              _buildPaginationBar(currentPage, totalPages),
            ],
          ),
          updated: () => const Center(
            child: Text('Banner Updated Successfully'),
          ),
        );
      },
    );
  }

  Widget _buildBannerTable(List<BannerUploadRequest> banners, int currentPage) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600 && screenWidth <= 900;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
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
                      columnSpacing: isTablet ? 20 : 40,
                      headingRowColor: WidgetStateColor.resolveWith(
                        (states) => const Color.fromARGB(66, 144, 140, 140),
                      ),
                      dataRowColor:
                          WidgetStatePropertyAll(AppColors.primaryColor),
                      dataRowMinHeight: isTablet ? 45 : 55,
                      dataRowMaxHeight: isTablet ? 45 : 55,
                      columns: const [
                        DataColumn(
                          label: Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Text('ID',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                        DataColumn(
                            label: Text('Title',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Desktop Image',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Phone Image',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Tablet Image',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Date Uploaded',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Actions',
                                style: TextStyle(fontWeight: FontWeight.bold))),
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
        padding: const EdgeInsets.only(right: 20, bottom: 20),
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
    int rowNumber = ((currentPage - 1) * rowsPerPage) + index + 1;
    return DataRow(cells: [
      DataCell(Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Text('$rowNumber'),
      )),
      DataCell(Text(banner.title)),
      DataCell(SizedBox(
        width: 150,
        child: Text(
          banner.desktopImage,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
      )),
      DataCell(SizedBox(
          width: 150,
          child: Text(
            banner.phoneImage,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ))),
      DataCell(SizedBox(
          width: 150,
          child: Text(
            banner.tabletImage,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ))),
      DataCell(Text(
        banner.createdAt != null
            ? DateFormat('dd/MM/yyyy hh:mm a').format(banner.createdAt!)
            : 'N/A',
      )),
      DataCell(
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit,
                  color: Color.fromARGB(255, 59, 59, 59)),
              onPressed: () {
                context.push('/edit-banner', extra: banner);
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete,
                  color: Color.fromARGB(255, 20, 20, 20)),
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
