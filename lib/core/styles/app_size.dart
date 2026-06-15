import 'package:flutter/material.dart';

class AppSize {
  // Common Box Sizes
  static const double iconSmall = 24.0;
  static const double iconMedium = 32.0;
  static const double iconLarge = 48.0;
  static const double iconExtraLarge = 80.0;

  // Card & Container Sizes
  static const double cardRadius = 32.0;
  static const double buttonRadius = 16.0;
  static const double inputRadius = 12.0;
  static const double badgeRadius = 100.0;

  // Section specific
  static const double maxContentWidth = 1200.0;
  static const double maxFormWidth = 800.0;
  static const double maxAppCardWidth = 600.0;
  static const double featureCardWidth = 400.0;
  static const double featureCardHeight = 200.0;

  // Responsive Breakpoints
  static const double tabletBreakpoint = 900.0;
  static const double mobileBreakpoint = 600.0;

  static const double maxTextWidth = 800.0;
  static const double headingLarge = 40.0;
  static const double headingMedium = 24.0;
  static const double headingSmall = 20.0;

  static const double appCardMinHeight = 380.0;
  static double screenHeight(BuildContext context) => MediaQuery.sizeOf(context).height;
  static double screenWidth(BuildContext context) => MediaQuery.sizeOf(context).width;
}
