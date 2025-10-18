import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/features/reports/bloc/reports_bloc.dart';
import 'package:ado_dad_admin/models/report_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportList extends StatefulWidget {
  const ReportList({super.key});

  @override
  State<ReportList> createState() => _ReportListState();
}

class _ReportListState extends State<ReportList> {
  final ScrollController _horizontalScrollController = ScrollController();
  int rowsPerPage = 20;
  String selectedStatus = '';

  @override
  void initState() {
    super.initState();
    // Fetch stats and reports on page load
    context.read<ReportsBloc>().add(const FetchReportStats());
    context.read<ReportsBloc>().add(const FetchReports());
  }

  @override
  void dispose() {
    _horizontalScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReportsBloc, ReportsState>(
      listener: (context, state) {
        if (state is ReportDeleted) {
          _showSuccessDialog('Report deleted successfully');
        }
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildStatsHeader(),
            const SizedBox(height: 20),
            _buildStatusFilterSection(),
            const SizedBox(height: 20),
            _buildReportsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsHeader() {
    return BlocBuilder<ReportsBloc, ReportsState>(
      builder: (context, state) {
        print('🔍 UI: Current state type: ${state.runtimeType}');
        print('🔍 UI: State details: $state');

        if (state is ReportsStatsLoaded) {
          print(
              '🎯 UI: Displaying loaded stats - Total: ${state.stats.totalReports}');
          return _buildHeaderSection(state.stats);
        } else if (state is ReportsLoaded) {
          print(
              '🎯 UI: Displaying combined loaded stats - Total: ${state.stats.totalReports}');
          return _buildHeaderSection(state.stats);
        } else if (state is ReportsStatsLoading) {
          print('🔄 UI: Stats loading, showing default stats');
          return _buildHeaderSection(_getDefaultStats());
        } else {
          print('❓ UI: Unknown state, showing default stats');
          return _buildHeaderSection(_getDefaultStats());
        }
      },
    );
  }

  ReportStatsModel _getDefaultStats() {
    return ReportStatsModel(
      totalReports: 0,
      pendingReports: 0,
      resolvedReports: 0,
      dismissedReports: 0,
      reportsByReason: {},
      reportsByStatus: {},
    );
  }

  Widget _buildHeaderSection(ReportStatsModel stats) {
    print(
        '📊 Header: Building with stats - Total: ${stats.totalReports}, Pending: ${stats.pendingReports}');
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Column(
                children: [
                  const Text(
                    "Reports Management",
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      _buildStatCard(
                        "Total Reports",
                        stats.totalReports.toString(),
                        Colors.blue,
                        Icons.report,
                      ),
                      _buildStatCard(
                        "Pending",
                        stats.pendingReports.toString(),
                        Colors.orange,
                        Icons.pending,
                      ),
                      _buildStatCard(
                        "Resolved",
                        stats.resolvedReports.toString(),
                        Colors.green,
                        Icons.check_circle,
                      ),
                      _buildStatCard(
                        "Dismissed",
                        stats.dismissedReports.toString(),
                        Colors.red,
                        Icons.cancel,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Reports Management",
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: [
                          _buildStatCard(
                            "Total Reports",
                            stats.totalReports.toString(),
                            Colors.blue,
                            Icons.report,
                          ),
                          _buildStatCard(
                            "Pending",
                            stats.pendingReports.toString(),
                            Colors.orange,
                            Icons.pending,
                          ),
                          _buildStatCard(
                            "Resolved",
                            stats.resolvedReports.toString(),
                            Colors.green,
                            Icons.check_circle,
                          ),
                          _buildStatCard(
                            "Dismissed",
                            stats.dismissedReports.toString(),
                            Colors.red,
                            Icons.cancel,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildStatCard(
      String title, String value, Color color, IconData icon) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: color, size: 24),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReportsList() {
    return BlocBuilder<ReportsBloc, ReportsState>(
      builder: (context, state) {
        print('🔍 Reports List: Current state type: ${state.runtimeType}');
        print('🔍 Reports List: State details: $state');

        if (state is ReportsListLoading) {
          print('🔄 Reports List: Loading state');
          return const Center(child: CircularProgressIndicator());
        } else if (state is ReportsListLoaded) {
          print(
              '✅ Reports List: Loaded state with ${state.reports.length} reports');
          return Column(
            children: [
              _buildReportsTable(state.reports, state.page),
              const SizedBox(height: 30),
              _buildPaginationBar(state.page, state.totalPages),
            ],
          );
        } else if (state is ReportsLoaded) {
          print(
              '✅ Reports List: Combined loaded state with ${state.reports.length} reports');
          return Column(
            children: [
              _buildReportsTable(state.reports, state.page),
              const SizedBox(height: 30),
              _buildPaginationBar(state.page, state.totalPages),
            ],
          );
        } else if (state is ReportsError) {
          print('❌ Reports List: Error state - ${state.message}');
          return Center(
            child: Text(
              'Error loading reports: ${state.message}',
              style: const TextStyle(color: Colors.red),
            ),
          );
        }
        print('❓ Reports List: Unknown state, showing "No Reports Found"');
        return const Center(child: Text("No Reports Found"));
      },
    );
  }

  Widget _buildStatusFilterSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildStatusFilter(),
        ],
      ),
    );
  }

  Widget _buildStatusFilter() {
    return Container(
      height: 50,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.blackColor),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedStatus.isEmpty ? null : selectedStatus,
          hint: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text('Status'),
          ),
          isExpanded: true,
          items: [
            const DropdownMenuItem<String>(
                value: '', child: Text('All Status')),
            const DropdownMenuItem<String>(
                value: 'pending', child: Text('Pending')),
            const DropdownMenuItem<String>(
                value: 'resolved', child: Text('Resolved')),
            const DropdownMenuItem<String>(
                value: 'under_review', child: Text('Under Review')),
            const DropdownMenuItem<String>(
                value: 'dismissed', child: Text('Dismissed')),
          ],
          onChanged: (value) {
            setState(() {
              selectedStatus = value ?? '';
            });
            _fetchReports();
          },
        ),
      ),
    );
  }

  Widget _buildReportsTable(List<ReportModel> reports, int currentPage) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600 && screenWidth <= 900;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Scrollbar(
            thumbVisibility: true,
            controller: _horizontalScrollController,
            child: SingleChildScrollView(
              controller: _horizontalScrollController,
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: isTablet ? 800 : 1000,
                ),
                child: DataTable(
                  columnSpacing: isTablet ? 20 : 40,
                  headingRowColor: WidgetStateColor.resolveWith(
                    (states) => const Color.fromARGB(66, 144, 140, 140),
                  ),
                  dataRowColor: WidgetStatePropertyAll(AppColors.primaryColor),
                  dataRowMinHeight: isTablet ? 45 : 55,
                  dataRowMaxHeight: isTablet ? 45 : 55,
                  columns: _buildTableColumns(isTablet),
                  rows: reports.asMap().entries.map((entry) {
                    return _buildReportRow(entry.key, entry.value, currentPage);
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<DataColumn> _buildTableColumns(bool isTablet) {
    return [
      DataColumn(
        label: Container(
          width: isTablet ? 60 : 80,
          child:
              const Text('ID', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
      DataColumn(
        label: Container(
          width: isTablet ? 120 : 150,
          child: const Text('Reported User',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
      DataColumn(
        label: Container(
          width: isTablet ? 120 : 150,
          child: const Text('Reported By',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
      DataColumn(
        label: Container(
          width: isTablet ? 100 : 120,
          child: const Text('Reason',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
      DataColumn(
        label: Container(
          width: isTablet ? 150 : 200,
          child: const Text('Description',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
      DataColumn(
        label: Container(
          width: isTablet ? 100 : 120,
          child: const Text('Status',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
      DataColumn(
        label: Container(
          width: isTablet ? 100 : 120,
          child: const Text('Created',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
      DataColumn(
        label: Container(
          width: isTablet ? 120 : 140,
          child: const Text('Actions',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
    ];
  }

  DataRow _buildReportRow(int index, ReportModel report, int currentPage) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600 && screenWidth <= 900;

    int rowNumber = ((currentPage - 1) * rowsPerPage) + index + 1;

    return DataRow(cells: [
      DataCell(Container(
        width: isTablet ? 60 : 80,
        child: Text('$rowNumber'),
      )),
      DataCell(Container(
        width: isTablet ? 120 : 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              report.reportedUserDetails.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            Text(
              report.reportedUserDetails.email,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      )),
      DataCell(Container(
        width: isTablet ? 120 : 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              report.reportedByDetails.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            Text(
              report.reportedByDetails.email,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      )),
      DataCell(Container(
        width: isTablet ? 100 : 120,
        child: Text(
          report.reason.replaceAll('_', ' ').toUpperCase(),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      )),
      DataCell(Container(
        width: isTablet ? 150 : 200,
        child: Text(
          report.description,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
      )),
      DataCell(Container(
        width: isTablet ? 100 : 120,
        child: _buildStatusChip(report.status),
      )),
      DataCell(Container(
        width: isTablet ? 100 : 120,
        child: Text(
          _formatDate(report.createdAt),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      )),
      DataCell(Container(
        width: isTablet ? 120 : 140,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.delete,
                  color: Color.fromARGB(255, 20, 20, 20)),
              onPressed: () {
                _showDeleteDialog(report);
              },
            ),
          ],
        ),
      )),
    ]);
  }

  Widget _buildStatusChip(String status) {
    Color color;
    switch (status) {
      case 'pending':
        color = Colors.orange;
        break;
      case 'resolved':
        color = Colors.green;
        break;
      case 'under_review':
        color = Colors.blue;
        break;
      case 'dismissed':
        color = Colors.red;
        break;
      default:
        color = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color),
      ),
      child: Text(
        status.replaceAll('_', ' ').toUpperCase(),
        style: TextStyle(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

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
              items: [10, 20, 50].map((int value) {
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
                  _fetchReports();
                }
              },
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: currentPage > 1
                  ? () {
                      context.read<ReportsBloc>().add(FetchReports(
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
                      context.read<ReportsBloc>().add(FetchReports(
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

  void _fetchReports() {
    context.read<ReportsBloc>().add(FetchReports(
          page: 1,
          limit: rowsPerPage,
          status: selectedStatus,
        ));
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  void _showDeleteDialog(ReportModel report) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirm Delete"),
        content: const Text("Are you sure you want to delete this report?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              context
                  .read<ReportsBloc>()
                  .add(DeleteReport(reportId: report.id));
              Navigator.of(context).pop();
            },
            child: const Text("Delete", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Success"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Refresh both stats and reports list after successful deletion
              context.read<ReportsBloc>().add(const FetchReportStats());
              context.read<ReportsBloc>().add(const FetchReports());
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}
