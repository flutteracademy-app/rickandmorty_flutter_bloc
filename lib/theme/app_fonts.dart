import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

//TODO: Los textos comentados no se encuentran definidos en Figma

// ignore: non_constant_identifier_names
TextTheme TEXT_THEME_BLACK = TextTheme(
  headline1: GoogleFonts.montserrat(
    color: AppColors.COLOR_BLACK,
    fontWeight: FontWeight.w400,
    fontSize: 18,
  ),
  headline2: GoogleFonts.montserrat(
    color: AppColors.COLOR_TEXT_GREY1,
    fontWeight: FontWeight.w400,
    fontSize: 18,
  ),
  headline3: GoogleFonts.montserrat(
    color: AppColors.COLOR_BLACK_GREY,
    fontWeight: FontWeight.w600,
    fontSize: 30,
  ),
  // headline4: GoogleFonts.montserrat(
  //   color: AppColors.COLOR_TEXT_GREY1,
  //   fontWeight: FontWeight.w500,
  //   fontSize: 19,
  // ),
  // headline5: GoogleFonts.montserrat(
  //   color: AppColors.COLOR_BLACK,
  //   fontWeight: FontWeight.w400,
  //   fontSize: 16,
  // ),
  // headline6: GoogleFonts.montserrat(
  //   color: AppColors.COLOR_BLACK,
  //   fontWeight: FontWeight.w400,
  //   fontSize: 16,
  // ),
  bodyText1: GoogleFonts.montserrat(
    color: AppColors.COLOR_BLACK,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 1.5,
  ),
  bodyText2: GoogleFonts.montserrat(
    color: AppColors.COLOR_BLACK,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 1.5,
  ),
  subtitle1: GoogleFonts.montserrat(
    color: AppColors.COLOR_BLACK,
    fontWeight: FontWeight.w400,
    fontSize: 14,
  ),
  subtitle2: GoogleFonts.montserrat(
    color: AppColors.COLOR_TEXT_GREY1,
    fontWeight: FontWeight.w300,
    fontSize: 12,
  ),
  button: GoogleFonts.montserrat(
    color: AppColors.COLOR_BLUE,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  ),
);

// ignore: non_constant_identifier_names
TextTheme TEXT_THEME_WHITE = TextTheme(
  headline1: GoogleFonts.montserrat(
    color: AppColors.COLOR_WHITE,
    fontWeight: FontWeight.w500,
    fontSize: 25,
  ),

  // headline2: GoogleFonts.montserrat(
  //   color: AppColors.COLOR_WHITE,
  //   fontWeight: FontWeight.w400,
  //   fontSize: 26,
  // ),
  // headline3: GoogleFonts.montserrat(
  //   color: AppColors.COLOR_WHITE,
  //   fontWeight: FontWeight.w700,
  //   fontSize: 14,
  // ),
  // headline4: GoogleFonts.montserrat(
  //   color: AppColors.COLOR_WHITE,
  //   fontWeight: FontWeight.w500,
  //   fontSize: 19,
  // ),
  // headline5: GoogleFonts.montserrat(
  //   color: AppColors.COLOR_WHITE,
  //   fontWeight: FontWeight.w400,
  //   fontSize: 16,
  // ),
  // headline6: GoogleFonts.montserrat(
  //   color: AppColors.COLOR_WHITE,
  //   fontWeight: FontWeight.w400,
  //   fontSize: 16,
  // ),
  bodyText1: GoogleFonts.montserrat(
    color: AppColors.COLOR_WHITE,
    fontWeight: FontWeight.w400,
    fontSize: 18,
    height: 1.5,
  ),
  bodyText2: GoogleFonts.montserrat(
    color: AppColors.COLOR_WHITE,
    fontWeight: FontWeight.w400,
    fontSize: 16,
  ),
  subtitle1: GoogleFonts.montserrat(
    color: AppColors.COLOR_WHITE,
    fontWeight: FontWeight.w300,
    fontSize: 14,
  ),
  // subtitle2: GoogleFonts.montserrat(
  //   color: AppColors.COLOR_WHITE,
  //   fontWeight: FontWeight.w400,
  //   fontSize: 13,
  // ),
  button: GoogleFonts.montserrat(
    color: AppColors.COLOR_WHITE,
    fontWeight: FontWeight.w600,
    fontSize: 18,
  ),
);
