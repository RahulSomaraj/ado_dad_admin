import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/models/moderation/moderation_models.dart';
import 'package:ado_dad_admin/repositories/moderation_rep.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModerationSettingsScreen extends StatefulWidget {
  const ModerationSettingsScreen({super.key});

  @override
  State<ModerationSettingsScreen> createState() =>
      _ModerationSettingsScreenState();
}

class _ModerationSettingsScreenState extends State<ModerationSettingsScreen> {
  final ModerationRepository _repo = ModerationRepository();
  ModerationSettings? _settings;
  bool _loading = true;
  bool _saving = false;
  String? _error;

  static const _actions = ['warning', 'notify', 'suspend', 'ban'];
  static const _durations = [1, 3, 7, 14, 30, 90];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _load());
  }

  Future<void> _load() async {
    if (!mounted) return;
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final s = await _repo.getSettings();
      s.thresholds.sort((a, b) => a.level.compareTo(b.level));
      if (mounted) setState(() => _settings = s);
    } catch (e) {
      if (mounted) setState(() => _error = 'Failed to load settings');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _save() async {
    if (_settings == null) return;
    setState(() => _saving = true);
    try {
      final updated = await _repo.updateSettings(_settings!);
      updated.thresholds.sort((a, b) => a.level.compareTo(b.level));
      if (mounted) {
        setState(() => _settings = updated);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Settings saved'),
            backgroundColor: AppColors.success));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Failed to save settings'),
            backgroundColor: AppColors.danger));
      }
    } finally {
      if (mounted) setState(() => _saving = false);
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
          const SizedBox(height: 16),
          if (_loading)
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 60),
                child: Center(child: CircularProgressIndicator()))
          else if (_error != null)
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 60),
                child: Center(
                    child: Text(_error!,
                        style: GoogleFonts.inter(color: AppColors.danger))))
          else
            _form(),
        ],
      ),
    );
  }

  Widget _header() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Moderation / Settings",
              style: GoogleFonts.inter(fontSize: 12, color: AppColors.textMuted)),
          const SizedBox(height: 2),
          Row(
            children: [
              Text("Moderation settings",
                  style: GoogleFonts.inter(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary)),
              const SizedBox(width: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                    color: AppColors.accentSoft,
                    borderRadius: BorderRadius.circular(5)),
                child: Text("Super Admin",
                    style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: AppColors.accent)),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Text("Configure strike thresholds and automatic actions",
              style:
                  GoogleFonts.inter(fontSize: 13, color: AppColors.textSecondary)),
        ],
      );

  Widget _form() {
    final s = _settings!;
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Strike thresholds",
                  style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary)),
              const SizedBox(height: 14),
              ...s.thresholds.map(_thresholdRow),
              const Divider(height: 28),
              Text("Notifications",
                  style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary)),
              const SizedBox(height: 8),
              _toggleRow("Email + push on strike & suspension", s.notifyByPush,
                  (v) {
                setState(() {
                  s.notifyByPush = v;
                  s.notifyByEmail = v;
                });
              }),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                      onPressed: _saving ? null : _load,
                      child: const Text("Reset")),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _saving ? null : _save,
                    child: _saving
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                                strokeWidth: 2, color: Colors.white))
                        : const Text("Save settings"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _thresholdRow(StrikeThreshold t) {
    final showDuration = t.action == 'suspend';
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SizedBox(
            width: 64,
            child: Text("Strike ${t.level}",
                style: GoogleFonts.inter(
                    fontSize: 12.5, fontWeight: FontWeight.w600)),
          ),
          Expanded(
            child: _boxDropdown<String>(
              value: t.action,
              items: _actions,
              labelOf: _actionLabel,
              danger: t.action == 'ban',
              onChanged: (v) => setState(() {
                t.action = v!;
                if (v != 'suspend') t.durationDays = null;
                if (v == 'suspend') t.durationDays ??= 7;
              }),
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 130,
            child: showDuration
                ? _boxDropdown<int>(
                    value: _durations.contains(t.durationDays)
                        ? t.durationDays!
                        : 7,
                    items: _durations,
                    labelOf: (d) => '$d days',
                    onChanged: (v) => setState(() => t.durationDays = v),
                  )
                : Container(
                    height: 36,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: AppColors.surfaceAlt,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.border)),
                    child: Text(t.action == 'ban' ? 'Permanent' : 'No duration',
                        style: GoogleFonts.inter(
                            fontSize: 12, color: AppColors.textMuted)),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _boxDropdown<T>({
    required T value,
    required List<T> items,
    required String Function(T) labelOf,
    required ValueChanged<T?> onChanged,
    bool danger = false,
  }) {
    return Container(
      height: 36,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: danger ? const Color(0xFFFCA5A5) : AppColors.border),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          isExpanded: true,
          isDense: true,
          icon: const Icon(Icons.arrow_drop_down,
              color: AppColors.textSecondary),
          style: GoogleFonts.inter(
              fontSize: 12.5,
              color: danger ? const Color(0xFF991B1B) : AppColors.textPrimary),
          items: items
              .map((e) => DropdownMenuItem<T>(value: e, child: Text(labelOf(e))))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  String _actionLabel(String a) {
    switch (a) {
      case 'warning':
        return 'Warning only';
      case 'notify':
        return 'Notify user';
      case 'suspend':
        return 'Suspend';
      case 'ban':
        return 'Permanent ban';
      default:
        return a;
    }
  }

  Widget _toggleRow(String label, bool value, ValueChanged<bool> onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style:
                GoogleFonts.inter(fontSize: 13, color: AppColors.textPrimary)),
        Switch(
            value: value,
            activeColor: AppColors.accent,
            onChanged: onChanged),
      ],
    );
  }
}
