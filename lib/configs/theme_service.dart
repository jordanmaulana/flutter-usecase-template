import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static final light = ThemeData(
    brightness: Brightness.light,
    primaryColor: Color(0xff2382AA),
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color(0xff1a1a1a),
  );
}

class ThemeService extends GetxController {
  Rx<ThemeData> theme = AppThemes.light.obs;

  void toggleTheme() {
    if (theme.value.brightness == Brightness.light) {
      theme.value = AppThemes.dark;
    } else {
      theme.value = AppThemes.light;
    }
  }
}
