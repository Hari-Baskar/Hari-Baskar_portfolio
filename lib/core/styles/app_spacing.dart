import 'dart:math';
import 'package:flutter/material.dart';

class AppSpacing {
  static double _responsiveSize(double desktopSize) {
    // This allows sizes to scale down, but never below 60% of their desktop size
    return desktopSize; 
  }
  
  // We will keep them as fixed logical pixels for most things to ensure stability
  // but allow some scaling for large hero sections if needed.
  static double get w2 => 2.0;
  static double get w4 => 4.0;
  static double get w8 => 8.0;
  static double get w12 => 12.0;
  static double get w16 => 16.0;
  static double get w24 => 24.0;
  static double get w32 => 32.0;
  static double get w48 => 48.0;
  static double get w64 => 64.0;

  static double get h2 => 2.0;
  static double get h4 => 4.0;
  static double get h8 => 8.0;
  static double get h12 => 12.0;
  static double get h16 => 16.0;
  static double get h24 => 24.0;
  static double get h32 => 32.0;
  static double get h48 => 48.0;
  static double get h64 => 64.0;
  static double get h96 => 96.0;
  static double get h128 => 128.0;
}
