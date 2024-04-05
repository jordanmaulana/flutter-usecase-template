import 'dart:convert';

import 'package:get/get.dart';

extension MyStringExtension on String? {
  /// Used for number formatting.
  /// Adding comma, every 3 digits.
  String get withNumberSeparator {
    if (this == null) {
      return '';
    }
    final formattedString = this!.replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match match) => '${match.group(1)},',
    );
    return formattedString;
  }
}

extension MyMapExtension on dynamic {
  /// Used to print json map to be more readable in logs.
  String get prettyPrint {
    if (this == null) return '';
    try {
      var encoder = const JsonEncoder.withIndent('     ');
      return encoder.convert(this);
    } catch (e) {
      Get.log(e.toString());
      return '';
    }
  }
}
