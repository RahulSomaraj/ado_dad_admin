import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/models/moderation/moderation_models.dart';
import 'package:ado_dad_admin/models/report_model.dart';
import 'package:ado_dad_admin/repositories/moderation_rep.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ReportDetailScreen extends StatefulWidget {
  final ReportModel report;
  const ReportDetailScreen({super.key, required this.report});

  @override
  State<ReportDetailScreen> createState() => _ReportDetailScreenState();
}

class _ReportDetailScreenState extends State<ReportDetailScreen> {
  final ModerationRepository _repo = ModerationRepository();
  ModerationProfile? _profile;
  bool _loadingProfile = true;
  bool _adRemoved = false;
  bool _busy = false;

  ReportModel get _report => widget.report;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadProfile());
  }

  Future<void> _loadProfile() async {
    if (!mounted) return;
    setState(() => _loadingProfile = true);
    try {
      final p = await _repo.getProfile(_report.reportedUser);
      if (mounted) setState(() => _profile = p);
    } catch (_) {
      // ignore
    } finally {
      if (mounted) setState(() => _loadingProfile = false);
    }
  }

  void _snack(String msg, {bool error = false}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(msg),
        backgroundColor: error ? AppColors.danger : AppColors.success));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _headerBar(),
          const SizedBox(height: 16),
          LayoutBuilder(builder: (context, c) {
            final stacked = c.maxWidth < 820;
            final left = Column(children: [
              _reportInfoCard(),
              const SizedBox(height: 12),
              if (_report.relatedAd != null) ...[
                _advertisementCard(),
                const SizedBox(height: 12),
              ],
              _reportedUserCard(),
            ]);
            final right = _actionPanel();
            if (stacked) {
              return Column(children: [
                left,
                const SizedBox(height: 12),
                right
              ]);
            }
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 17, child: left),
                const SizedBox(width: 14),
                Expanded(flex: 11, child: right),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget _headerBar() {
    return Row(
      children: [
        IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
            onPressed: () => context.pop()),
        const SizedBox(width: 4),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Reports / Detail",
                  style: GoogleFonts.inter(
                      fontSize: 12, color: AppColors.textMuted)),
              const SizedBox(height: 2),
              Row(
                children: [
                  Flexible(
                    child: Text(
                        "Report #${_report.id.length > 6 ? _report.id.substring(_report.id.length - 6) : _report.id}",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary)),
                  ),
                  const SizedBox(width: 8),
                  _reasonChip(_report.reason),
                ],
              ),
            ],
          ),
        ),
        _statusChip(_report.status),
      ],
    );
  }

  // --------------------------------------------------------------- Cards
  Widget _card({required String title, Widget? trailing, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.border)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: GoogleFonts.inter(
                      fontSize: 13, fontWeight: FontWeight.w600)),
              if (trailing != null) trailing,
            ],
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }

  Widget _reportInfoCard() {
    return _card(
      title: "Report info",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _kv("Reporter", _report.reportedByDetails.name),
          _kv("Reported user", _report.reportedUserDetails.name),
          _kv("Reported on", DateFormat('dd MMM yyyy').format(_report.createdAt)),
          const SizedBox(height: 6),
          Text("Description",
              style: GoogleFonts.inter(fontSize: 11, color: AppColors.textMuted)),
          const SizedBox(height: 2),
          Text(_report.description.isEmpty ? '—' : _report.description,
              style: GoogleFonts.inter(
                  fontSize: 13, height: 1.5, color: AppColors.textPrimary)),
        ],
      ),
    );
  }

  Widget _advertisementCard() {
    return _card(
      title: "Reported advertisement",
      trailing: _busy
          ? null
          : (_adRemoved
              ? OutlinedButton(
                  onPressed: _restoreAd,
                  style: OutlinedButton.styleFrom(
                      minimumSize: const Size(0, 30),
                      padding: const EdgeInsets.symmetric(horizontal: 10)),
                  child: Text("Restore",
                      style: GoogleFonts.inter(fontSize: 12)))
              : GestureDetector(
                  onTap: _removeAdDialog,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                    decoration: BoxDecoration(
                        color: AppColors.dangerSoft,
                        borderRadius: BorderRadius.circular(6)),
                    child: Text("Remove ad",
                        style: GoogleFonts.inter(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF991B1B))),
                  ),
                )),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
                color: AppColors.surfaceAlt,
                borderRadius: BorderRadius.circular(8)),
            child: const Icon(Icons.inventory_2_outlined,
                color: AppColors.textMuted),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Advertisement ${_report.relatedAd}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                        fontSize: 13, fontWeight: FontWeight.w500)),
                Text(_adRemoved ? 'Removed by admin' : 'Linked to this report',
                    style: GoogleFonts.inter(
                        fontSize: 12,
                        color: _adRemoved
                            ? AppColors.danger
                            : AppColors.textMuted)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _reportedUserCard() {
    final p = _profile;
    return _card(
      title: "Reported user",
      trailing: TextButton(
        onPressed: () => context.push('/user-moderation-history', extra: {
          'userId': _report.reportedUser,
          'userName': _report.reportedUserDetails.name,
        }),
        style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 6)),
        child: Text("Full history",
            style: GoogleFonts.inter(fontSize: 12, color: AppColors.accent)),
      ),
      child: _loadingProfile
          ? const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Center(child: CircularProgressIndicator()))
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColors.accentSoft,
                      child: Text(_initials(_report.reportedUserDetails.name),
                          style: GoogleFonts.inter(
                              color: AppColors.accent,
                              fontWeight: FontWeight.w600)),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(_report.reportedUserDetails.name,
                              style: GoogleFonts.inter(
                                  fontSize: 14, fontWeight: FontWeight.w600)),
                          Text(
                              '${_report.reportedUserDetails.email}'
                              '${p != null && p.user.moderationStatus != 'active' ? ' · ${p.user.moderationStatus}' : ''}',
                              style: GoogleFonts.inter(
                                  fontSize: 12,
                                  color: p != null &&
                                          p.user.moderationStatus != 'active'
                                      ? AppColors.danger
                                      : AppColors.textMuted)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _stat('${p?.activeAds ?? '—'}', 'Active ads'),
                    _stat('${p?.previousReports ?? '—'}', 'Prev reports'),
                    _stat('${p?.strikeCount ?? '—'}', 'Strikes',
                        color: const Color(0xFF92400E)),
                  ],
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _smallBtn("+ Add strike", _strikeDialog),
                    _smallBtn("Suspend", _suspendDialog),
                    if (p?.user.moderationStatus != 'active')
                      _smallBtn("Lift", _unsuspend, color: AppColors.success),
                    _smallBtn("Ban", _banDialog, danger: true),
                  ],
                ),
              ],
            ),
    );
  }

  Widget _stat(String value, String label, {Color? color}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: AppColors.surfaceAlt, borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Text(value,
                style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: color ?? AppColors.textPrimary)),
            Text(label,
                style: GoogleFonts.inter(
                    fontSize: 10.5, color: AppColors.textMuted)),
          ],
        ),
      ),
    );
  }

  Widget _smallBtn(String label, VoidCallback onTap,
      {bool danger = false, Color? color}) {
    final c = danger ? const Color(0xFF991B1B) : (color ?? AppColors.textPrimary);
    return GestureDetector(
      onTap: _busy ? null : onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(
                color: danger ? const Color(0xFFFCA5A5) : AppColors.border)),
        child: Text(label,
            style: GoogleFonts.inter(
                fontSize: 12, fontWeight: FontWeight.w500, color: c)),
      ),
    );
  }

  // ---------------------------------------------------------- Action panel
  Widget _actionPanel() {
    return _card(
      title: "Resolve report",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              "Take an action on the reported user above, then resolve or dismiss this report.",
              style: GoogleFonts.inter(
                  fontSize: 12, height: 1.5, color: AppColors.textSecondary)),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _busy ? null : () => _resolveOrDismiss(true),
              child: const Text("Resolve report"),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: _busy ? null : () => _resolveOrDismiss(false),
              child: const Text("Dismiss report"),
            ),
          ),
        ],
      ),
    );
  }

  // ------------------------------------------------------------- Actions
  Future<void> _restoreAd() async {
    if (_report.relatedAd == null) return;
    setState(() => _busy = true);
    try {
      await _repo.restoreAd(_report.relatedAd!);
      setState(() => _adRemoved = false);
      _snack('Advertisement restored');
    } catch (_) {
      _snack('Failed to restore ad', error: true);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _removeAdDialog() async {
    final reason = await _reasonPrompt('Remove advertisement', 'Reason');
    if (reason == null || _report.relatedAd == null) return;
    setState(() => _busy = true);
    try {
      await _repo.removeAd(_report.relatedAd!, reason);
      setState(() => _adRemoved = true);
      _snack('Advertisement removed');
    } catch (_) {
      _snack('Failed to remove ad', error: true);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _strikeDialog() async {
    final reason = await _reasonPrompt('Add strike', 'Reason');
    if (reason == null) return;
    await _run(() => _repo.addStrike(_report.reportedUser,
        reason: reason, reportId: _report.id));
    _snack('Strike added');
  }

  Future<void> _suspendDialog() async {
    final result = await _suspendPrompt();
    if (result == null) return;
    await _run(() => _repo.suspend(_report.reportedUser,
        reason: result.$1, durationDays: result.$2, reportId: _report.id));
    _snack('User suspended');
  }

  Future<void> _banDialog() async {
    final reason = await _reasonPrompt('Ban user', 'Reason');
    if (reason == null) return;
    await _run(() =>
        _repo.ban(_report.reportedUser, reason: reason, reportId: _report.id));
    _snack('User banned');
  }

  Future<void> _unsuspend() async {
    await _run(() => _repo.unsuspend(_report.reportedUser));
    _snack('Suspension lifted');
  }

  Future<void> _run(Future<ModerationProfile> Function() action) async {
    setState(() => _busy = true);
    try {
      final p = await action();
      if (mounted) setState(() => _profile = p);
    } catch (_) {
      _snack('Action failed', error: true);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _resolveOrDismiss(bool resolve) async {
    setState(() => _busy = true);
    try {
      if (resolve) {
        await _repo.resolveReport(_report.id);
      } else {
        await _repo.dismissReport(_report.id);
      }
      _snack(resolve ? 'Report resolved' : 'Report dismissed');
      if (mounted) context.pop();
    } catch (_) {
      _snack('Action failed', error: true);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  // ------------------------------------------------------------- Prompts
  Future<String?> _reasonPrompt(String title, String label) async {
    final controller = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        title: Text(title, style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
        content: TextField(
          controller: controller,
          maxLines: 3,
          autofocus: true,
          decoration: InputDecoration(hintText: label),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx), child: const Text("Cancel")),
          ElevatedButton(
            onPressed: () {
              final v = controller.text.trim();
              if (v.isNotEmpty) Navigator.pop(ctx, v);
            },
            child: const Text("Confirm"),
          ),
        ],
      ),
    );
  }

  Future<(String, int)?> _suspendPrompt() async {
    final controller = TextEditingController();
    int days = 7;
    return showDialog<(String, int)>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setLocal) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          title: Text("Suspend user",
              style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: controller,
                maxLines: 2,
                autofocus: true,
                decoration: const InputDecoration(hintText: "Reason"),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Text("Duration:",
                      style: GoogleFonts.inter(fontSize: 13)),
                  const SizedBox(width: 10),
                  DropdownButton<int>(
                    value: days,
                    items: const [1, 3, 7, 14, 30, 90]
                        .map((d) =>
                            DropdownMenuItem(value: d, child: Text('$d days')))
                        .toList(),
                    onChanged: (v) => setLocal(() => days = v ?? 7),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text("Cancel")),
            ElevatedButton(
              onPressed: () {
                final v = controller.text.trim();
                if (v.isNotEmpty) Navigator.pop(ctx, (v, days));
              },
              child: const Text("Suspend"),
            ),
          ],
        ),
      ),
    );
  }

  // -------------------------------------------------------------- Helpers
  Widget _kv(String k, String v) => Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: 110,
                child: Text(k,
                    style: GoogleFonts.inter(
                        fontSize: 12, color: AppColors.textMuted))),
            Expanded(
                child: Text(v,
                    style: GoogleFonts.inter(
                        fontSize: 13, color: AppColors.textPrimary))),
          ],
        ),
      );

  Widget _reasonChip(String reason) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: BoxDecoration(
            color: AppColors.dangerSoft, borderRadius: BorderRadius.circular(5)),
        child: Text(reason.replaceAll('_', ' '),
            style: GoogleFonts.inter(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF991B1B))),
      );

  Widget _statusChip(String status) {
    Color bg;
    Color fg;
    switch (status) {
      case 'resolved':
        bg = AppColors.successSoft;
        fg = AppColors.success;
        break;
      case 'dismissed':
        bg = AppColors.dangerSoft;
        fg = AppColors.danger;
        break;
      case 'under_review':
        bg = const Color(0xFFE0F2FE);
        fg = const Color(0xFF0369A1);
        break;
      default:
        bg = AppColors.warningSoft;
        fg = const Color(0xFF92400E);
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(6)),
      child: Text(status.replaceAll('_', ' '),
          style: GoogleFonts.inter(
              fontSize: 11, fontWeight: FontWeight.w600, color: fg)),
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
