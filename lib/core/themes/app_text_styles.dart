import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static double _responsiveFontSize(BuildContext context, double baseSize) {
    double width = MediaQuery.of(context).size.width;
    if (width > 1200) return baseSize * 1.2;
    if (width > 600) return baseSize;
    return baseSize * 0.9; // Slightly smaller on mobile but still readable
  }

  static TextStyle splashHeading(
    BuildContext context, {
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) => GoogleFonts.inter(
    fontSize: fontSize ?? _responsiveFontSize(context, 48), // Increased for Hero
    fontWeight: fontWeight ?? FontWeight.w800, // Bolder
    letterSpacing: -1.0,
    height: 1.1,
    color: color ?? Theme.of(context).textTheme.bodyLarge?.color,
  );

  static TextStyle heading(
    BuildContext context, {
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) => GoogleFonts.inter(
    fontSize: fontSize ?? _responsiveFontSize(context, 28), // Slightly larger
    fontWeight: fontWeight ?? FontWeight.w700, // Bolder
    letterSpacing: -0.5,
    height: 1.2,
    color: color ?? Theme.of(context).textTheme.bodyLarge?.color,
  );

  static TextStyle subtitle(
    BuildContext context, {
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double wordSpacing = 0.2,
  }) => GoogleFonts.inter(
    fontSize: fontSize ?? _responsiveFontSize(context, 18),
    fontWeight: fontWeight ?? FontWeight.w500,
    letterSpacing: -0.2,
    wordSpacing: wordSpacing,
    height: 1.4,
    color: color ?? Theme.of(context).textTheme.bodyMedium?.color,
  );

  static TextStyle body(
    BuildContext context, {
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextDecoration? decoration,
  }) => GoogleFonts.inter(
    fontSize: fontSize ?? _responsiveFontSize(context, 16),
    fontWeight: fontWeight ?? FontWeight.w400,
    decoration: decoration ?? TextDecoration.none,
    height: 1.6,
    letterSpacing: 0.1,
    color: color ?? Theme.of(context).textTheme.bodyMedium?.color,
  );

  static TextStyle small(
    BuildContext context, {
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextDecoration? decoration,
  }) => GoogleFonts.inter(
    fontSize: fontSize ?? _responsiveFontSize(context, 14),
    fontWeight: fontWeight ?? FontWeight.w400,
    decoration: decoration ?? TextDecoration.none,
    letterSpacing: 0.1,
    height: 1.4,
    color: color ?? Theme.of(context).textTheme.bodySmall?.color,
  );

  static TextStyle button(BuildContext context, {Color? color}) =>
      GoogleFonts.inter(
        fontSize: _responsiveFontSize(context, 15),
        fontWeight: FontWeight.w600,
        letterSpacing: 0.2,
        color: color ?? Colors.white,
      );
}
