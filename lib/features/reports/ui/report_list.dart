import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/features/reports/bloc/reports_bloc.dart';
import 'package:ado_dad_admin/features/widgets/list_page.dart';
import 'package:ado_dad_admin/models/report_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

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
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListPageHeader(
              breadcrumb: "Home / Reports",
              title: "Reports",
              subtitle: "User reports & moderation",
              trailing: _buildStatusFilter(),
            ),
            const SizedBox(height: 16),
            _buildStatsCards(),
            const SizedBox(height: 16),
            Container(
              decoration: listCardDecoration(),
              clipBehavior: Clip.antiAlias,
              child: _buildReportsList(),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Stats cards
  // ---------------------------------------------------------------------------
  Widget _buildStatsCards() {
    return BlocBuilder<ReportsBloc, ReportsState>(
      builder: (context, state) {
        ReportStatsModel stats;
        if (state is ReportsStatsLoaded) {
          stats = state.stats;
        } else if (state is ReportsLoaded) {
          stats = state.stats;
        } else {
          stats = _getDefaultStats();
        }

        return LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final columns = width >= 820
                ? 4
                : width >= 520
                    ? 2
                    : 1;
            const spacing = 12.0;
            final cardWidth =
                ((width - spacing * (columns - 1)) / columns) - 0.5;
            return Wrap(
              spacing: spacing,
              runSpacing: spacing,
              children: [
                SizedBox(
                    width: cardWidth,
                    child: _statCard("Total reports",
                        stats.totalReports.toString(), Icons.flag_outlined,
                        const Color(0xFFEEF2FF), AppColors.accent)),
                SizedBox(
                    width: cardWidth,
                    child: _statCard("Pending", stats.pendingReports.toString(),
                        Icons.schedule_outlined, AppColors.warningSoft,
                        const Color(0xFFB45309))),
                SizedBox(
                    width: cardWidth,
                    child: _statCard(
                        "Resolved",
                        stats.resolvedReports.toString(),
                        Icons.check_circle_outline,
                        AppColors.successSoft,
                        AppColors.success)),
                SizedBox(
                    width: cardWidth,
                    child: _statCard(
                        "Dismissed",
                        stats.dismissedReports.toString(),
                        Icons.cancel_outlined,
                        AppColors.dangerSoft,
                        AppColors.danger)),
              ],
            );
          },
        );
      },
    );
  }

  Widget _statCard(
      String label, String value, IconData icon, Color iconBg, Color iconFg) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: listCardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
                color: iconBg, borderRadius: BorderRadius.circular(9)),
            child: Icon(icon, color: iconFg, size: 19),
          ),
          const SizedBox(height: 14),
          Text(value,
              style: GoogleFonts.inter(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary)),
          const SizedBox(height: 2),
          Text(label,
              style: GoogleFonts.inter(
                  fontSize: 12.5, color: AppColors.textSecondary)),
        ],
      ),
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

  Widget _buildStatusFilter() {
    return Container(
      height: 40,
      width: 160,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedStatus.isEmpty ? null : selectedStatus,
          hint: Text('All status',
              style: GoogleFonts.inter(
                  fontSize: 13, color: AppColors.textSecondary)),
          isExpanded: true,
          isDense: true,
          icon:
              const Icon(Icons.arrow_drop_down, color: AppColors.textSecondary),
          style: GoogleFonts.inter(fontSize: 13, color: AppColors.textPrimary),
          items: const [
            DropdownMenuItem<String>(value: '', child: Text('All status')),
            DropdownMenuItem<String>(value: 'pending', child: Text('Pending')),
            DropdownMenuItem<String>(
                value: 'resolved', child: Text('Resolved')),
            DropdownMenuItem<String>(
                value: 'under_review', child: Text('Under Review')),
            DropdownMenuItem<String>(
                value: 'dismissed', child: Text('Dismissed')),
          ],
          onChanged: (value) {
            setState(() => selectedStatus = value ?? '');
            _fetchReports();
          },
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Reports table
  // ---------------------------------------------------------------------------
  Widget _buildReportsList() {
    return BlocBuilder<ReportsBloc, ReportsState>(
      builder: (context, state) {
        if (state is ReportsListLoading) {
          return _statusBox(const CircularProgressIndicator());
        } else if (state is ReportsListLoaded) {
          return _loadedContent(state.reports, state.page, state.totalPages);
        } else if (state is ReportsLoaded) {
          return _loadedContent(state.reports, state.page, state.totalPages);
        } else if (state is ReportsError) {
          return _statusBox(Text('Error loading reports: ${state.message}',
              style: GoogleFonts.inter(color: AppColors.danger)));
        }
        return _statusBox(Text("No reports found",
            style: GoogleFonts.inter(color: AppColors.textSecondary)));
      },
    );
  }

  Widget _loadedContent(
      List<ReportModel> reports, int page, int totalPages) {
    if (reports.isEmpty) {
      return _statusBox(Text("No reports found",
          style: GoogleFonts.inter(color: AppColors.textSecondary)));
    }
    return Column(
      children: [
        FillWidthDataTable(
          controller: _horizontalScrollController,
          minWidth: 1120,
          columns: [
            listColumn('#'),
            listColumn('Reported user'),
            listColumn('Reported by'),
            listColumn('Reason'),
            listColumn('Description'),
            listColumn('Status'),
            listColumn('Created'),
            listColumn('Actions'),
          ],
          rows: reports
              .asMap()
              .entries
              .map((e) => _buildReportRow(e.key, e.value, page))
              .toList(),
        ),
        ListPagination(
          currentPage: page,
          totalPages: totalPages,
          rowsPerPage: rowsPerPage,
          rowsPerPageOptions: const [10, 20, 50],
          onRowsPerPageChanged: (v) {
            setState(() => rowsPerPage = v);
            _fetchReports();
          },
          onPageChanged: (p) {
            context
                .read<ReportsBloc>()
                .add(FetchReports(page: p, limit: rowsPerPage));
          },
        ),
      ],
    );
  }

  Widget _statusBox(Widget child) => Padding(
        padding: const EdgeInsets.all(48),
        child: Center(child: child),
      );

  DataRow _buildReportRow(int index, ReportModel report, int currentPage) {
    final rowNumber = ((currentPage - 1) * rowsPerPage) + index + 1;
    return DataRow(cells: [
      DataCell(Text('$rowNumber',
          style: GoogleFonts.inter(
              fontSize: 13, color: AppColors.textSecondary))),
      DataCell(_userCell(
          report.reportedUserDetails.name, report.reportedUserDetails.email)),
      DataCell(_userCell(
          report.reportedByDetails.name, report.reportedByDetails.email)),
      DataCell(Text(report.reason.replaceAll('_', ' ').toUpperCase(),
          style: GoogleFonts.inter(fontSize: 12, color: AppColors.textPrimary))),
      DataCell(SizedBox(
        width: 200,
        child: Text(report.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.inter(
                fontSize: 13, color: AppColors.textSecondary)),
      )),
      DataCell(_buildStatusChip(report.status)),
      DataCell(Text(_formatDate(report.createdAt),
          style: GoogleFonts.inter(
              fontSize: 12.5, color: AppColors.textSecondary))),
      DataCell(ListRowAction(
        icon: Icons.delete_outline,
        tooltip: "Delete",
        color: AppColors.danger,
        onTap: () => _showDeleteDialog(report),
      )),
    ]);
  }

  Widget _userCell(String name, String email) {
    return SizedBox(
      width: 170,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(name,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary)),
          Text(email,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: GoogleFonts.inter(
                  fontSize: 11.5, color: AppColors.textMuted)),
        ],
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    Color bg;
    Color fg;
    switch (status) {
      case 'pending':
        bg = AppColors.warningSoft;
        fg = const Color(0xFFB45309);
        break;
      case 'resolved':
        bg = AppColors.successSoft;
        fg = AppColors.success;
        break;
      case 'under_review':
        bg = const Color(0xFFE0F2FE);
        fg = const Color(0xFF0369A1);
        break;
      case 'dismissed':
        bg = AppColors.dangerSoft;
        fg = AppColors.danger;
        break;
      default:
        bg = AppColors.surfaceAlt;
        fg = AppColors.textSecondary;
    }
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
        decoration:
            BoxDecoration(color: bg, borderRadius: BorderRadius.circular(6)),
        child: Text(status.replaceAll('_', ' ').toUpperCase(),
            style: GoogleFonts.inter(
                fontSize: 10, fontWeight: FontWeight.w700, color: fg)),
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        title: const Text("Confirm delete"),
        content: const Text("Are you sure you want to delete this report?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.danger),
            onPressed: () {
              context.read<ReportsBloc>().add(DeleteReport(reportId: report.id));
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        title: const Text("Success"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
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
