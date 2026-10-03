import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/features/widgets/list_page.dart';
import 'package:ado_dad_admin/models/moderation/moderation_models.dart';
import 'package:ado_dad_admin/repositories/moderation_rep.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SuspensionManagementScreen extends StatefulWidget {
  const SuspensionManagementScreen({super.key});

  @override
  State<SuspensionManagementScreen> createState() =>
      _SuspensionManagementScreenState();
}

class _SuspensionManagementScreenState
    extends State<SuspensionManagementScreen> {
  final ModerationRepository _repo = ModerationRepository();
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _hController = ScrollController();

  Paginated<SuspensionModel>? _result;
  bool _loading = true;
  String _status = 'active';
  String _search = '';
  int _page = 1;
  final int _limit = 10;

  static const _tabs = [
    ['active', 'Active'],
    ['lifted', 'Lifted'],
    ['expired', 'Expired'],
    ['', 'All'],
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _load());
  }

  @override
  void dispose() {
    _searchController.dispose();
    _hController.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    if (!mounted) return;
    setState(() => _loading = true);
    try {
      final r = await _repo.listSuspensions(
          status: _status, search: _search, page: _page, limit: _limit);
      if (mounted) setState(() => _result = r);
    } catch (_) {
      if (mounted) setState(() => _result = null);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _lift(SuspensionModel s) async {
    if (s.userId == null) return;
    try {
      await _repo.unsuspend(s.userId!);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Suspension lifted'),
            backgroundColor: AppColors.success));
      }
      _load();
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Failed to lift suspension'),
            backgroundColor: AppColors.danger));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListPageHeader(
            breadcrumb: "Moderation / Suspensions",
            title: "Suspension management",
            subtitle: "Active suspensions and permanent bans",
            searchHint: "Search user…",
            searchController: _searchController,
            onSearch: (q) {
              _search = q;
              _page = 1;
              _load();
            },
          ),
          const SizedBox(height: 14),
          _tabsRow(),
          const SizedBox(height: 12),
          Container(
            decoration: listCardDecoration(),
            clipBehavior: Clip.antiAlias,
            child: _body(),
          ),
        ],
      ),
    );
  }

  Widget _tabsRow() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: _tabs.map((t) {
        final selected = _status == t[0];
        return GestureDetector(
          onTap: () {
            setState(() {
              _status = t[0];
              _page = 1;
            });
            _load();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
            decoration: BoxDecoration(
              color: selected ? AppColors.accent : AppColors.surface,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  color: selected ? AppColors.accent : AppColors.border),
            ),
            child: Text(t[1],
                style: GoogleFonts.inter(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                    color: selected ? Colors.white : AppColors.textSecondary)),
          ),
        );
      }).toList(),
    );
  }

  Widget _body() {
    if (_loading) {
      return const Padding(
          padding: EdgeInsets.all(48),
          child: Center(child: CircularProgressIndicator()));
    }
    final r = _result;
    if (r == null || r.data.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(48),
        child: Center(
            child: Text("No suspensions found",
                style: GoogleFonts.inter(color: AppColors.textSecondary))),
      );
    }
    return Column(
      children: [
        FillWidthDataTable(
          controller: _hController,
          minWidth: 820,
          columns: [
            listColumn('User'),
            listColumn('Type'),
            listColumn('Reason'),
            listColumn('Ends on'),
            listColumn('Action'),
          ],
          rows: r.data.map(_row).toList(),
        ),
        ListPagination(
          currentPage: r.page,
          totalPages: r.totalPages,
          rowsPerPage: _limit,
          rowsPerPageOptions: const [10],
          onRowsPerPageChanged: (_) {},
          onPageChanged: (p) {
            _page = p;
            _load();
          },
        ),
      ],
    );
  }

  DataRow _row(SuspensionModel s) {
    return DataRow(cells: [
      DataCell(SizedBox(
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(s.userName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary)),
            Text(s.userEmail,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(
                    fontSize: 11.5, color: AppColors.textMuted)),
          ],
        ),
      )),
      DataCell(_typeChip(s)),
      DataCell(SizedBox(
        width: 200,
        child: Text(
            '${s.reason}${s.isAutomatic ? ' (auto)' : ''}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style:
                GoogleFonts.inter(fontSize: 12.5, color: AppColors.textSecondary)),
      )),
      DataCell(Text(
          s.endsAt != null ? DateFormat('dd MMM yyyy').format(s.endsAt!) : '—',
          style:
              GoogleFonts.inter(fontSize: 12.5, color: AppColors.textSecondary))),
      DataCell(s.status == 'active'
          ? OutlinedButton(
              onPressed: () => _lift(s),
              style: OutlinedButton.styleFrom(
                  minimumSize: const Size(0, 32),
                  padding: const EdgeInsets.symmetric(horizontal: 12)),
              child: Text(s.isBan ? 'Lift ban' : 'Lift',
                  style: GoogleFonts.inter(fontSize: 12)),
            )
          : Text(s.status,
              style:
                  GoogleFonts.inter(fontSize: 12, color: AppColors.textMuted))),
    ]);
  }

  Widget _typeChip(SuspensionModel s) {
    final bg = s.isBan ? const Color(0xFF1E1B4B) : AppColors.dangerSoft;
    final fg = s.isBan ? Colors.white : const Color(0xFF991B1B);
    final label = s.isBan ? 'Banned' : 'Suspended';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
      decoration:
          BoxDecoration(color: bg, borderRadius: BorderRadius.circular(6)),
      child: Text(label,
          style: GoogleFonts.inter(
              fontSize: 11, fontWeight: FontWeight.w600, color: fg)),
    );
  }
}
