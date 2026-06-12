import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/features/vehicle_model/ui/widget/vehicle_variant_list_section.dart';
import 'package:ado_dad_admin/features/widgets/form_kit.dart';
import 'package:ado_dad_admin/models/vehicle_model/vehicle_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class VehicleModelView extends StatefulWidget {
  final VehicleModel vehiclemodel;
  const VehicleModelView({super.key, required this.vehiclemodel});

  @override
  State<VehicleModelView> createState() => _VehicleModelViewState();
}

class _VehicleModelViewState extends State<VehicleModelView> {
  VehicleModel get m => widget.vehiclemodel;

  String get _title => m.displayName.isNotEmpty ? m.displayName : m.name;

  @override
  Widget build(BuildContext context) {
    final images = m.images ?? const [];
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormHeaderBar(
            breadcrumb: "Vehicle Models / Detail",
            title: _title,
            onBack: () => context.pop(),
            actions: [
              OutlinedButton.icon(
                onPressed: () =>
                    context.push('/edit-vehicle_model', extra: m),
                icon: const Icon(Icons.edit_outlined, size: 16),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.accent,
                  side: const BorderSide(color: AppColors.accent),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                ),
                label: Text("Edit", style: GoogleFonts.inter(fontSize: 13)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _heroCard(images),
          const SizedBox(height: 12),
          _infoCard(),
          if (images.isNotEmpty) ...[
            const SizedBox(height: 12),
            _imagesCard(images),
          ],
          const SizedBox(height: 20),
          if (m.id != null)
            VehicleVariantListSection(modelId: m.id!, vehicleModel: m)
          else
            _noVariants(),
        ],
      ),
    );
  }

  Widget _heroCard(List<String> images) {
    final hasImage = images.isNotEmpty;
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
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.accentSoft,
              borderRadius: BorderRadius.circular(14),
              image: hasImage
                  ? DecorationImage(
                      image: NetworkImage(images.first), fit: BoxFit.cover)
                  : null,
            ),
            child: hasImage
                ? null
                : const Icon(Icons.directions_car_outlined,
                    color: AppColors.accent),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(m.name,
                    style: GoogleFonts.inter(
                        fontSize: 15, fontWeight: FontWeight.w600)),
                const SizedBox(height: 2),
                Text(m.manufacturer?.displayName ?? '—',
                    style: GoogleFonts.inter(
                        fontSize: 12.5, color: AppColors.textSecondary)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  children: [
                    if (m.vehicleType.isNotEmpty)
                      _chip(m.vehicleType, AppColors.accentSoft,
                          AppColors.accent),
                    if (m.segment != null && m.segment!.isNotEmpty)
                      _chip("Segment ${m.segment}", AppColors.surfaceAlt,
                          AppColors.textSecondary),
                    (m.isActive ?? true)
                        ? _chip("Active", AppColors.successSoft,
                            const Color(0xFF166534))
                        : _chip("Inactive", AppColors.dangerSoft,
                            const Color(0xFF991B1B)),
                  ],
                ),
              ],
            ),
          ),
          if (m.variantCount != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("Variants",
                    style: GoogleFonts.inter(
                        fontSize: 11, color: AppColors.textMuted)),
                const SizedBox(height: 2),
                Text("${m.variantCount}",
                    style: GoogleFonts.inter(
                        fontSize: 18, fontWeight: FontWeight.w700)),
              ],
            ),
        ],
      ),
    );
  }

  Widget _infoCard() {
    return _card(
      title: "Model details",
      icon: Icons.info_outline,
      rows: [
        _kv("Name", m.name),
        _kv("Display name", m.displayName),
        _kv("Manufacturer", m.manufacturer?.displayName ?? '—'),
        _kv("Vehicle type", m.vehicleType.isEmpty ? '—' : m.vehicleType),
        _kv("Segment", _orDash(m.segment)),
        _kv("Body type", _orDash(m.bodyType)),
        _kv("Launch year", m.launchYear?.toString() ?? '—'),
        _kv("Active", (m.isActive ?? true) ? "Yes" : "No"),
        _kv("Description", _orDash(m.description)),
      ],
    );
  }

  Widget _imagesCard(List<String> images) {
    return _card(
      title: "Images",
      icon: Icons.image_outlined,
      rows: [
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: images
              .map((url) => ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      url,
                      width: 96,
                      height: 96,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        width: 96,
                        height: 96,
                        color: AppColors.surfaceAlt,
                        child: const Icon(Icons.broken_image_outlined,
                            color: AppColors.textMuted),
                      ),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }

  Widget _noVariants() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Center(
        child: Text("Variants unavailable — model id missing.",
            style: GoogleFonts.inter(color: AppColors.textSecondary)),
      ),
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
            width: 150,
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

  static String _orDash(String? v) =>
      (v == null || v.trim().isEmpty) ? '—' : v;
}
