import 'package:flutter/material.dart';

class AppColors {
  // ---------------------------------------------------------------------------
  // Legacy tokens (kept for backward compatibility — do not remove).
  // Values updated to fit the Modern SaaS palette so existing screens that
  // reference these names inherit the new look without code changes.
  // ---------------------------------------------------------------------------
  static const Color primaryColor = Color(0xFFFFFFFF); // on-accent (white)
  static const Color blackColor = Color(0xFF0F172A); // near-black slate
  static const Color greyColor = Color(0xFF94A3B8); // muted slate
  static const Color redColor = Color(0xFFEF4444); // error / danger
  static const Color greyColor2 = Colors.black26;
  static const Color logoColor = Color(0xFFFABA00); // brand amber (logo only)
  static const Color scaffoldColor = Color(0xFFF7F8FA); // app background (light)
  static const Color primaryColor1 = Color(0xFF4F48EC); // primary accent (indigo)

  // ---------------------------------------------------------------------------
  // Modern SaaS design-system tokens.
  // ---------------------------------------------------------------------------
  static const Color accent = Color(0xFF4F48EC); // primary indigo
  static const Color accentHover = Color(0xFF4138D6); // darker indigo (hover/pressed)
  static const Color accentSoft = Color(0xFFEEEDFD); // indigo tint (chips, hovers)

  static const Color background = Color(0xFFF7F8FA); // page background
  static const Color surface = Color(0xFFFFFFFF); // cards / sheets
  static const Color surfaceAlt = Color(0xFFF1F3F7); // subtle alt surface
  static const Color border = Color(0xFFE5E7EB); // hairline borders
  static const Color borderStrong = Color(0xFFD1D5DB);

  static const Color textPrimary = Color(0xFF0F172A); // headings / primary text
  static const Color textSecondary = Color(0xFF64748B); // secondary / labels
  static const Color textMuted = Color(0xFF94A3B8); // hints / disabled

  static const Color success = Color(0xFF16A34A);
  static const Color successSoft = Color(0xFFDCFCE7);
  static const Color warning = Color(0xFFF59E0B);
  static const Color warningSoft = Color(0xFFFEF3C7);
  static const Color danger = Color(0xFFEF4444);
  static const Color dangerSoft = Color(0xFFFEE2E2);
  static const Color info = Color(0xFF0EA5E9);
}
