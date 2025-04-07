import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'configs/colors.dart';
import 'configs/flavors.dart';
import 'main.dart';

void main() async {
  /// Initialize get storage.
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize build flavor.
  Get.put(BuildFlavor.initiate(buildFlavorType: BuildFlavorType.staging));

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: VColor.primary, // Set your desired color here
      statusBarIconBrightness: Brightness.light, // For Android (dark icons)
      statusBarBrightness: Brightness.dark, // For iOS (light icons)
    ),
  );

  runApp(const MyApp());
}
