import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static final TextStyle labelStyle = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.greyColor,
  );

  static final TextStyle errortextStyle = GoogleFonts.roboto(
    fontSize: 12,
    color: AppColors.redColor,
  );
  static final TextStyle texttstyle = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
  );

  static final TextStyle buttonTextstyle = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor,
  );

  static TextStyle drawerTextstyle = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );

  static final TextStyle titleTextstyle = GoogleFonts.roboto(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    color: AppColors.blackColor,
  );

  static final TextStyle title2Textstyle = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: const Color.fromARGB(255, 79, 78, 78),
  );

  static final TextStyle valueTextstyle = GoogleFonts.roboto(
    fontSize: 20,
    // fontWeight: FontWeight.w500,
    color: const Color.fromARGB(255, 79, 78, 78),
  );
}
