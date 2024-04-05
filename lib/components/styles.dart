import 'package:flutter/material.dart';

import '../configs/colors.dart';

abstract class VStyle {
  /// Box shadow with rounded corner
  static BoxDecoration boxShadow({color = VColor.white, radius = 8.0}) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: shadow(),
    );
  }

  /// Outline & shadow with rounded corner
  static BoxDecoration boxShadowOutline(
      {color = VColor.white, radius = 8.0, borderColor = Colors.grey}) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: borderColor),
      boxShadow: shadow(),
    );
  }

  /// Add shadow to container
  static shadow() {
    return const [BoxShadow(blurRadius: 8.0, color: Colors.black12)];
  }

  /// Rounded corner
  static BoxDecoration corner({radius = 12.0, color}) {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(radius), color: color);
  }
}
