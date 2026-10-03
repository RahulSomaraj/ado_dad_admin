import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/models/moderation/moderation_models.dart';
import 'package:ado_dad_admin/repositories/moderation_rep.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class _TimelineEvent {
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;
  final DateTime? date;
  _TimelineEvent(this.icon, this.color, this.title, this.subtitle, this.date);
}

class UserModerationHistoryScreen extends StatefulWidget {
  final String userId;
  final String? userName;

  const UserModerationHistoryScreen({
    super.key,
    required this.userId,
    this.userName,
  });

  @override
  State<UserModerationHistoryScreen> createState() =>
      _UserModerationHistoryScreenState();
}

class _UserModerationHistoryScreenState
    extends State<UserModerationHistoryScreen> {
  final ModerationRepository _repo = ModerationRepository();
  ModerationProfile? _profile;
  List<_TimelineEvent> _events = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _load());
  }

  Future<void> _load() async {
    if (!mounted) return;
    setState(() => _loading = true);
    try {
      final results = await Future.wait([
        _repo.getProfile(widget.userId),
        _repo.getStrikes(widget.userId, limit: 50),
        _repo.getSuspensions(widget.userId, limit: 50),
      ]);
      final profile = results[0] as ModerationProfile;
      final strikes = (results[1] as Paginated<StrikeModel>).data;
      final suspensions = (results[2] as Paginated<SuspensionModel>).data;

      final events = <_TimelineEvent>[];
      for (final s in strikes) {
        events.add(_TimelineEvent(
          Icons.warning_amber_rounded,
          const Color(0xFF92400E),
          'Strike ${s.level} ${s.isActive ? 'added' : 'revoked'} — ${s.reason}',
          'by ${s.issuedBy}',
          s.createdAt,
        ));
      }
      for (final sp in suspensions) {
        events.add(_TimelineEvent(
          sp.isBan ? Icons.block : Icons.pause_circle_outline,
          const Color(0xFF991B1B),
          sp.isBan ? 'Permanently banned' : 'Suspended',
          '${sp.reason}${sp.isAutomatic ? ' (automatic)' : ''} · by ${sp.issuedBy}',
          sp.startsAt ?? sp.createdAt,
        ));
      }
      events.sort((a, b) =>
          (b.date ?? DateTime(2000)).compareTo(a.date ?? DateTime(2000)));

      if (mounted) {
        setState(() {
          _profile = profile;
          _events = events;
        });
      }
    } catch (_) {
      // leave empty
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                  icon: const Icon(Icons.arrow_back,
                      color: AppColors.textPrimary),
                  onPressed: () => context.pop()),
              const SizedBox(width: 4),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Moderation / User history",
                      style: GoogleFonts.inter(
                          fontSize: 12, color: AppColors.textMuted)),
                  const SizedBox(height: 2),
                  Text(_profile?.user.name ?? widget.userName ?? 'User',
                      style: GoogleFonts.inter(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (_loading)
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 60),
                child: Center(child: CircularProgressIndicator()))
          else ...[
            if (_profile != null) _summaryCard(_profile!),
            const SizedBox(height: 12),
            _timelineCard(),
          ],
        ],
      ),
    );
  }

  Widget _summaryCard(ModerationProfile p) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.border)),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: AppColors.accentSoft,
            child: Text(_initials(p.user.name),
                style: GoogleFonts.inter(
                    color: AppColors.accent, fontWeight: FontWeight.w600)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(p.user.email,
                    style: GoogleFonts.inter(
                        fontSize: 13, fontWeight: FontWeight.w500)),
                Text('${p.activeAds} active ads · ${p.previousReports} reports',
                    style: GoogleFonts.inter(
                        fontSize: 12, color: AppColors.textMuted)),
              ],
            ),
          ),
          Wrap(
            spacing: 8,
            children: [
              _chip('${p.strikeCount} strikes', AppColors.warningSoft,
                  const Color(0xFF92400E)),
              if (p.user.moderationStatus != 'active')
                _chip(
                    p.user.moderationStatus == 'banned'
                        ? 'Banned'
                        : 'Suspended',
                    AppColors.dangerSoft,
                    const Color(0xFF991B1B)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _chip(String text, Color bg, Color fg) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration:
            BoxDecoration(color: bg, borderRadius: BorderRadius.circular(7)),
        child: Text(text,
            style: GoogleFonts.inter(
                fontSize: 12, fontWeight: FontWeight.w500, color: fg)),
      );

  Widget _timelineCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.border)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Moderation timeline",
              style: GoogleFonts.inter(
                  fontSize: 14, fontWeight: FontWeight.w600)),
          const SizedBox(height: 14),
          if (_events.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text("No moderation events",
                  style: GoogleFonts.inter(color: AppColors.textSecondary)),
            )
          else
            ...List.generate(_events.length, (i) {
              return _timelineRow(_events[i], i == _events.length - 1);
            }),
        ],
      ),
    );
  }

  Widget _timelineRow(_TimelineEvent e, bool isLast) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                    color: e.color.withOpacity(0.12), shape: BoxShape.circle),
                child: Icon(e.icon, size: 14, color: e.color),
              ),
              if (!isLast)
                Expanded(
                    child: Container(width: 2, color: AppColors.border)),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(e.title,
                      style: GoogleFonts.inter(
                          fontSize: 13, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 2),
                  Text(
                      '${e.subtitle}${e.date != null ? ' · ${DateFormat('dd MMM yyyy').format(e.date!)}' : ''}',
                      style: GoogleFonts.inter(
                          fontSize: 11.5, color: AppColors.textSecondary)),
                ],
              ),
            ),
          ),
        ],
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
