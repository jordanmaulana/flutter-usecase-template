import 'package:toastification/toastification.dart';

import 'texts.dart';

abstract class VToast {
  static void success(String message) {
    toastification.show(
      title: VText(message),
      type: ToastificationType.success,
      style: ToastificationStyle.fillColored,
      autoCloseDuration: const Duration(seconds: 3),
    );
  }

  static void error(String message) {
    toastification.show(
      title: VText(message),
      type: ToastificationType.error,
      style: ToastificationStyle.fillColored,
      autoCloseDuration: const Duration(seconds: 3),
    );
  }
}
