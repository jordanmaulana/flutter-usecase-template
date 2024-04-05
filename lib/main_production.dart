import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'configs/flavors.dart';
import 'main.dart';

void main() async {
  /// Initialize get storage.
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize build flavor.
  Get.put(BuildFlavor.initiate(buildFlavorType: BuildFlavorType.production));

  runApp(const MyApp());
}
