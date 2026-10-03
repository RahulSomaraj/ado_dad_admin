import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Reusable building blocks for the SaaS-styled add / edit forms across the
/// vehicle-inventory module (and beyond). Pages compose these around their own
/// field widgets and bloc logic — the kit is purely presentational.

/// Bordered white card used to wrap a form body.
BoxDecoration formCardDecoration() => BoxDecoration(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: AppColors.border),
    );

/// Top-of-page bar: back chevron + breadcrumb + big title (+ optional actions).
class FormHeaderBar extends StatelessWidget {
  final String breadcrumb;
  final String title;
  final VoidCallback onBack;
  final List<Widget> actions;

  const FormHeaderBar({
    super.key,
    required this.breadcrumb,
    required this.title,
    required this.onBack,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: onBack,
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(breadcrumb,
                  style: GoogleFonts.inter(
                      fontSize: 12, color: AppColors.textMuted)),
              const SizedBox(height: 2),
              Text(title,
                  style: GoogleFonts.inter(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary)),
            ],
          ),
        ),
        ...actions,
      ],
    );
  }
}

/// Header strip inside the card: a round avatar (icon, image, or initials) with
/// an optional camera badge, plus a title + subtitle. Sits on a subtle alt
/// surface with a bottom border.
class FormHeaderStrip extends StatelessWidget {
  final IconData icon;
  final ImageProvider? image;
  final String? initials;
  final String title;
  final String? subtitle;
  final VoidCallback? onPickImage;

  const FormHeaderStrip({
    super.key,
    required this.icon,
    required this.title,
    this.image,
    this.initials,
    this.subtitle,
    this.onPickImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: const BoxDecoration(
        color: AppColors.surfaceAlt,
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: onPickImage,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.accentSoft,
                    shape: BoxShape.circle,
                    image: image == null
                        ? null
                        : DecorationImage(image: image!, fit: BoxFit.cover),
                  ),
                  alignment: Alignment.center,
                  child: image != null
                      ? null
                      : (initials != null && initials!.isNotEmpty
                          ? Text(initials!,
                              style: GoogleFonts.inter(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.accent))
                          : Icon(icon, color: AppColors.accent, size: 26)),
                ),
                if (onPickImage != null)
                  Positioned(
                    right: -2,
                    bottom: -2,
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: AppColors.accent,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.surface, width: 2),
                      ),
                      child: const Icon(Icons.camera_alt,
                          size: 12, color: Colors.white),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: GoogleFonts.inter(
                        fontSize: 16, fontWeight: FontWeight.w600)),
                if (subtitle != null) ...[
                  const SizedBox(height: 3),
                  Text(subtitle!,
                      style: GoogleFonts.inter(
                          fontSize: 12.5, color: AppColors.textSecondary)),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Small uppercase-ish section heading.
class FormSectionTitle extends StatelessWidget {
  final String text;
  const FormSectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(text,
          style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary)),
    );
  }
}

/// A field with its label sitting above it.
class LabeledField extends StatelessWidget {
  final String label;
  final Widget child;
  const LabeledField({super.key, required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: GoogleFonts.inter(
                fontSize: 12.5,
                fontWeight: FontWeight.w500,
                color: AppColors.textSecondary)),
        const SizedBox(height: 6),
        child,
      ],
    );
  }
}

/// A bordered section card with an icon + title header — mirrors the detail
/// pages' card style so add/edit forms read the same way. Put the section's
/// fields in [child].
class FormSectionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget child;

  const FormSectionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.child,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
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
          if (subtitle != null) ...[
            const SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(subtitle!,
                  style: GoogleFonts.inter(
                      fontSize: 12, color: AppColors.textMuted)),
            ),
          ],
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }
}

/// Responsive 2-column grid: stacks to a single column below [breakpoint].
class TwoColGrid extends StatelessWidget {
  final List<Widget> children;
  final double breakpoint;
  final double gap;

  const TwoColGrid(
    this.children, {
    super.key,
    this.breakpoint = 520,
    this.gap = 16,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, c) {
      if (c.maxWidth < breakpoint) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (int i = 0; i < children.length; i++) ...[
              children[i],
              if (i != children.length - 1) SizedBox(height: gap),
            ],
          ],
        );
      }
      final colWidth = (c.maxWidth - gap) / 2;
      return Wrap(
        spacing: gap,
        runSpacing: gap,
        children: children
            .map((w) => SizedBox(width: colWidth, child: w))
            .toList(),
      );
    });
  }
}

/// Full-width indigo primary button with an optional loading spinner.
class PrimaryFormButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool loading;
  final IconData? icon;

  const PrimaryFormButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.loading = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: loading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accent,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: loading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                    strokeWidth: 2, color: Colors.white),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: 18),
                    const SizedBox(width: 8),
                  ],
                  Text(label,
                      style: GoogleFonts.inter(
                          fontSize: 15, fontWeight: FontWeight.w600)),
                ],
              ),
      ),
    );
  }
}

/// Shared input decoration for hint-style fields (labels live above via
/// [LabeledField]). Pass a [hint]; borders/padding are consistent everywhere.
InputDecoration formInputDecoration(String hint) => InputDecoration(
      hintText: hint,
      hintStyle: GoogleFonts.inter(fontSize: 13.5, color: AppColors.textMuted),
      isDense: true,
      filled: true,
      fillColor: AppColors.surface,
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.accent, width: 1.4),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.border),
      ),
    );
