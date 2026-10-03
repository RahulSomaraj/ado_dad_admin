import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/models/vehicle_model/vehicle_model.dart';
import 'package:ado_dad_admin/models/vehicle_variant/vehicle_variant_response_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

/// Read-only detail view for a single vehicle variant.
///
/// This screen is additive — it does not replace the embedded variant table
/// inside the model detail page. It surfaces the rich catalog data (engine
/// specs, performance specs, pricing, timestamps) that the table omits, and
/// gives a stable "back to model" context plus a quick Edit entry point.
class VehicleVariantView extends StatelessWidget {
  final VehicleVariantResponseModel variant;
  final VehicleModel vehicleModel;

  const VehicleVariantView({
    super.key,
    required this.variant,
    required this.vehicleModel,
  });

  String get _modelLabel => vehicleModel.displayName.isNotEmpty
      ? vehicleModel.displayName
      : vehicleModel.name;

  String _money(int? v) {
    if (v == null) return '—';
    return '₹${NumberFormat.decimalPattern('en_IN').format(v)}';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _headerBar(context),
          const SizedBox(height: 16),
          _heroCard(),
          const SizedBox(height: 12),
          LayoutBuilder(builder: (context, c) {
            final stacked = c.maxWidth < 760;
            final left = _engineCard();
            final right = _performanceCard();
            if (stacked) {
              return Column(children: [
                left,
                const SizedBox(height: 12),
                right,
              ]);
            }
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: left),
                const SizedBox(width: 12),
                Expanded(child: right),
              ],
            );
          }),
          const SizedBox(height: 12),
          _metaCard(),
        ],
      ),
    );
  }

  Widget _headerBar(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => context.pop(),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Variants / $_modelLabel",
                  style: GoogleFonts.inter(
                      fontSize: 12, color: AppColors.textMuted)),
              const SizedBox(height: 2),
              Text(
                variant.displayName.isNotEmpty
                    ? variant.displayName
                    : variant.name,
                style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary),
              ),
            ],
          ),
        ),
        OutlinedButton.icon(
          onPressed: () => context.push(
            '/edit-vehiclevariant',
            extra: {
              'variant': variant,
              'vehicleModel': vehicleModel,
            },
          ),
          icon: const Icon(Icons.edit_outlined, size: 16),
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.accent,
            side: const BorderSide(color: AppColors.accent),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          ),
          label: Text("Edit", style: GoogleFonts.inter(fontSize: 13)),
        ),
      ],
    );
  }

  Widget _heroCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.accentSoft,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.tune, color: AppColors.accent),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(variant.name,
                    style: GoogleFonts.inter(
                        fontSize: 15, fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  children: [
                    if (variant.fuelType != null)
                      _chip(variant.fuelType!.displayName, AppColors.accentSoft,
                          AppColors.accent),
                    if (variant.transmissionType != null)
                      _chip(variant.transmissionType!.displayName,
                          AppColors.surfaceAlt, AppColors.textSecondary),
                    if (variant.featurePackage != null &&
                        variant.featurePackage!.isNotEmpty)
                      _chip(variant.featurePackage!, AppColors.surfaceAlt,
                          AppColors.textSecondary),
                    variant.isActive
                        ? _chip("Active", AppColors.successSoft,
                            const Color(0xFF166534))
                        : _chip("Inactive", AppColors.dangerSoft,
                            const Color(0xFF991B1B)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Asking price",
                  style: GoogleFonts.inter(
                      fontSize: 11, color: AppColors.textMuted)),
              const SizedBox(height: 2),
              Text(_money(variant.price),
                  style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _engineCard() {
    final e = variant.engineSpecs;
    return _card(
      title: "Engine",
      icon: Icons.settings_outlined,
      rows: [
        _kv("Engine type", e?.engineType ?? '—'),
        _kv(
            "Displacement / capacity",
            (e?.capacity ?? e?.displacement) != null
                ? "${e?.capacity ?? e?.displacement} cc"
                : '—'),
        _kv("Max power", e?.maxPower != null ? "${e!.maxPower} bhp" : '—'),
        _kv("Max torque", e?.maxTorque != null ? "${e!.maxTorque} Nm" : '—'),
        _kv("Seating capacity",
            variant.seatingCapacity?.toString() ?? '—'),
      ],
    );
  }

  Widget _performanceCard() {
    final p = variant.performanceSpecs;
    return _card(
      title: "Performance & pricing",
      icon: Icons.speed_outlined,
      rows: [
        _kv("Mileage", p?.mileage != null ? "${p!.mileage} kmpl" : '—'),
        _kv("Top speed", p?.topSpeed != null ? "${p!.topSpeed} km/h" : '—'),
        _kv("0–100 km/h",
            p?.acceleration != null ? "${p!.acceleration} s" : '—'),
        _kv("Price", _money(variant.price)),
      ],
    );
  }

  Widget _metaCard() {
    final df = DateFormat('dd MMM yyyy, hh:mm a');
    return _card(
      title: "Record",
      icon: Icons.info_outline,
      rows: [
        _kv("Variant ID", variant.id.isEmpty ? '—' : variant.id),
        _kv("Belongs to model", _modelLabel),
        _kv(
            "Created",
            variant.createdAt != null ? df.format(variant.createdAt!) : '—'),
        _kv(
            "Last updated",
            variant.updatedAt != null ? df.format(variant.updatedAt!) : '—'),
      ],
    );
  }

  Widget _card({
    required String title,
    required IconData icon,
    required List<Widget> rows,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: AppColors.textSecondary),
              const SizedBox(width: 8),
              Text(title,
                  style: GoogleFonts.inter(
                      fontSize: 13, fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 12),
          ...rows,
        ],
      ),
    );
  }

  Widget _kv(String k, String v) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 170,
            child: Text(k,
                style: GoogleFonts.inter(
                    fontSize: 12.5, color: AppColors.textMuted)),
          ),
          Expanded(
            child: Text(v,
                style: GoogleFonts.inter(
                    fontSize: 13,
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w500)),
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
}
