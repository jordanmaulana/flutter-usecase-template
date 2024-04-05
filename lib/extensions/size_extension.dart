import 'package:flutter/material.dart';

/// Declare general sizes based on usages
extension SizeExtension on BuildContext {
  double get smPadding => 8.0;
  double get mdPadding => 16.0;
  double get lgPadding => 24.0;
  double get xlPadding => 32.0;

  double get screenPadding => lgPadding;
}
