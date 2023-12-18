import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UiConstants {
  const UiConstants._();

  /// shimmer
  static const shimmerItemCount = 20;

  /// material app
  static const materialAppTitle = 'My App';
// ignore: avoid_hard_coded_colors
  static const taskMenuMaterialAppColor = Color.fromARGB(255, 153, 154, 251);

  /// orientation
  static const mobileOrientation = [
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ];

  static const tabletOrientation = [
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ];

  /// status bar color
  static const systemUiOverlay = SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
// ignore: avoid_hard_coded_colors
    statusBarColor: Color.fromARGB(255, 156, 39, 176),
  );

  static const textFieldTextStyleHeight = 1.3;

  static const bgColorFamousPlayer = [
    [Color(0xFFFF8A00), Color(0xFFFAA543)],
    [Color(0xFF353DEF), Color(0xFF5E64FF)],
    [Color(0xFFFA258A), Color(0xFFFF77B8)],
    [Color(0xFF00A542), Color(0xFF46F48C)],
    [Color(0xFF0F81EB), Color(0xFF8D92FF)],
    [Color(0xFF8F00FF), Color(0xFFB75BFF)],
    [Color(0xFF0085FF), Color(0xFF46B8F7)],
    [Color(0xFFFF0E00), Color(0xFFFF5B5B)],
  ];
}
