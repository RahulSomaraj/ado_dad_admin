import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/models/moderation/moderation_models.dart';
import 'package:ado_dad_admin/repositories/moderation_rep.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AppealsReviewScreen extends StatefulWidget {
  const AppealsReviewScreen({super.key});

  @override
  State<AppealsReviewScreen> createState() => _AppealsReviewScreenState();
}

class _AppealsReviewScreenState extends State<AppealsReviewScreen> {
  final ModerationRepository _repo = ModerationRepository();
  final TextEditingController _noteController = TextEditingController();

  List<AppealModel> _appeals = [];
  AppealModel? _selected;
  bool _loading = true;
  bool _submitting = false;
  String _status = 'pending';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _load());
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    if (!mounted) return;
    setState(() => _loading = true);
    try {
      final r = await _repo.listAppeals(status: _status, page: 1, limit: 50);
      if (mounted) {
        setState(() {
          _appeals = r.data;
          _selected = r.data.isNotEmpty ? r.data.first : null;
        });
      }
    } catch (_) {
      if (mounted) setState(() => _appeals = []);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _review(String decision) async {
    final appeal = _selected;
    if (appeal == null) return;
    setState(() => _submitting = true);
    try {
      await _repo.reviewAppeal(appeal.id,
          decision: decision, note: _noteController.text.trim());
      _noteController.clear();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Appeal $decision'),
            backgroundColor: AppColors.success));
      }
      _load();
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Failed to review appeal'),
            backgroundColor: AppColors.danger));
      }
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _header(),
          const SizedBox(height: 14),
          _statusTabs(),
          const SizedBox(height: 12),
          LayoutBuilder(builder: (context, c) {
            final stacked = c.maxWidth < 760;
            final list = _listPanel();
            final detail = _detailPanel();
            if (stacked) {
              return Column(children: [
                SizedBox(height: 240, child: list),
                const SizedBox(height: 12),
                detail
              ]);
            }
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 280, child: list),
                const SizedBox(width: 14),
                Expanded(child: detail),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget _header() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Moderation / Appeals",
              style:
                  GoogleFonts.inter(fontSize: 12, color: AppColors.textMuted)),
          const SizedBox(height: 2),
          Text("Suspension appeals",
              style: GoogleFonts.inter(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary)),
          const SizedBox(height: 2),
          Text("Review appeals submitted by suspended users",
              style:
                  GoogleFonts.inter(fontSize: 13, color: AppColors.textSecondary)),
        ],
      );

  Widget _statusTabs() {
    const tabs = [
      ['pending', 'Pending'],
      ['approved', 'Approved'],
      ['rejected', 'Rejected'],
    ];
    return Wrap(
      spacing: 8,
      children: tabs.map((t) {
        final sel = _status == t[0];
        return GestureDetector(
          onTap: () {
            setState(() => _status = t[0]);
            _load();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
            decoration: BoxDecoration(
              color: sel ? AppColors.accent : AppColors.surface,
              borderRadius: BorderRadius.circular(8),
              border:
                  Border.all(color: sel ? AppColors.accent : AppColors.border),
            ),
            child: Text(t[1],
                style: GoogleFonts.inter(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                    color: sel ? Colors.white : AppColors.textSecondary)),
          ),
        );
      }).toList(),
    );
  }

  Widget _card({required Widget child}) => Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.border),
        ),
        clipBehavior: Clip.antiAlias,
        child: child,
      );

  Widget _listPanel() {
    if (_loading) {
      return _card(
          child: const Padding(
              padding: EdgeInsets.all(40),
              child: Center(child: CircularProgressIndicator())));
    }
    if (_appeals.isEmpty) {
      return _card(
          child: Padding(
              padding: const EdgeInsets.all(40),
              child: Center(
                  child: Text("No appeals",
                      style:
                          GoogleFonts.inter(color: AppColors.textSecondary)))));
    }
    return _card(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: _appeals.length,
        separatorBuilder: (_, __) =>
            const Divider(height: 1, color: AppColors.border),
        itemBuilder: (context, i) {
          final a = _appeals[i];
          final sel = a.id == _selected?.id;
          return InkWell(
            onTap: () => setState(() => _selected = a),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: sel ? AppColors.accentSoft.withOpacity(0.4) : null,
                border: Border(
                    left: BorderSide(
                        color: sel ? AppColors.accent : Colors.transparent,
                        width: 3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(a.userName,
                      style: GoogleFonts.inter(
                          fontSize: 13, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 2),
                  Text(
                      '${a.suspension?.isBan == true ? 'Ban' : 'Suspension'} · ${a.createdAt != null ? DateFormat('dd MMM').format(a.createdAt!) : ''}',
                      style: GoogleFonts.inter(
                          fontSize: 11.5, color: AppColors.textSecondary)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _detailPanel() {
    final a = _selected;
    if (a == null) {
      return _card(
          child: Padding(
              padding: const EdgeInsets.all(40),
              child: Center(
                  child: Text("Select an appeal",
                      style:
                          GoogleFonts.inter(color: AppColors.textSecondary)))));
    }
    return _card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 19,
                  backgroundColor: AppColors.accentSoft,
                  child: Text(_initials(a.userName),
                      style: GoogleFonts.inter(
                          color: AppColors.accent,
                          fontWeight: FontWeight.w600,
                          fontSize: 13)),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(a.userName,
                          style: GoogleFonts.inter(
                              fontSize: 14, fontWeight: FontWeight.w600)),
                      Text(a.userEmail,
                          style: GoogleFonts.inter(
                              fontSize: 12, color: AppColors.textMuted)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.surfaceAlt,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Appeal message",
                      style: GoogleFonts.inter(
                          fontSize: 11, color: AppColors.textMuted)),
                  const SizedBox(height: 4),
                  Text(a.message,
                      style: GoogleFonts.inter(
                          fontSize: 13,
                          height: 1.5,
                          color: AppColors.textPrimary)),
                ],
              ),
            ),
            if (a.status == 'pending') ...[
              const SizedBox(height: 14),
              Text("Decision note",
                  style: GoogleFonts.inter(
                      fontSize: 11, color: AppColors.textMuted)),
              const SizedBox(height: 4),
              TextField(
                controller: _noteController,
                maxLines: 2,
                style: GoogleFonts.inter(fontSize: 13),
                decoration: const InputDecoration(
                    hintText: "Add a note for the audit log…"),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed:
                          _submitting ? null : () => _review('approved'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.success),
                      icon: const Icon(Icons.check, size: 16),
                      label: const Text("Approve & lift"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed:
                          _submitting ? null : () => _review('rejected'),
                      style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.danger,
                          side: const BorderSide(color: Color(0xFFFCA5A5))),
                      icon: const Icon(Icons.close, size: 16),
                      label: const Text("Reject"),
                    ),
                  ),
                ],
              ),
            ] else ...[
              const SizedBox(height: 14),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                    color: a.status == 'approved'
                        ? AppColors.successSoft
                        : AppColors.dangerSoft,
                    borderRadius: BorderRadius.circular(6)),
                child: Text(
                    'Appeal ${a.status}${a.decisionNote != null && a.decisionNote!.isNotEmpty ? ' — ${a.decisionNote}' : ''}',
                    style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: a.status == 'approved'
                            ? AppColors.success
                            : AppColors.danger)),
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.length > 1 && parts[0].isNotEmpty && parts[1].isNotEmpty) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return parts.isNotEmpty && parts[0].isNotEmpty
        ? parts[0][0].toUpperCase()
        : 'U';
  }
}
