import 'package:flutter/material.dart';

/// Color name must be based on usage, not [purple, brown, etc]
abstract class VColor {
  /// Example when we will have a theme switch
  // static Color get primary => Get.find<ThemeService>().theme.value.primaryColor;

  static const Color primary = Color(0xff00786f);
  static const Color accent = Color(0xff00bba7);
  static const Color tertiary = Color(0xfff0fdfa);

  static const Color primary2 = Color(0xff7C49DF);
  static const Color accent2 = Color(0xffC33CE8);

  static const Color dark = Color(0xff240F51);
  static const Color error = Color(0xffc01c67);
  static const Color errorAccent = Color(0xfffef2f2);
  static const Color border = Color(0xffE0E0E0);
  static const Color scaffoldBg = Color(0xfff2f9fc);

  static const Color fieldFillColor = Color(0xfff3f3f6);
  static const Color greyText = Color(0xff72678A);
  static const Color titleItemText = Color(0xff736486);
  static const Color avatarBg = Color(0xffFDD8BC);

  static const white = Colors.white;

  /// This is to change the SVG color
  static ColorFilter colorFilter(Color color) {
    return ColorFilter.mode(color, BlendMode.srcIn);
  }
}
