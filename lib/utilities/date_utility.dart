import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class VDate {
  DateTime date;
  String text;
  VDate(this.date, this.text);
}

abstract class DateUtility {
  static String dateToString(DateTime? time, String format) {
    if (time == null) return '-';

    var formatter = DateFormat(format);
    String formatted = formatter.format(time);
    return formatted;
  }

  static Future<VDate?> pickDate(context) async {
    DateTime now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: now,
      initialDate: now,
      lastDate: DateTime(2040),
    );
    if (picked != null) {
      return VDate(picked, dateToString(picked, "yyyy-MM-dd"));
    }
    return null;
  }
}
