import 'package:flutter/material.dart';
import 'package:flutter_usecase_template/apps/auth/views/login/login_page.dart';
import 'package:flutter_usecase_template/apps/main_nav/views/main_nav_page.dart';
import 'package:flutter_usecase_template/apps/profile/controllers/profile_controller.dart';
import 'package:flutter_usecase_template/configs/route_name.dart';
import 'package:flutter_usecase_template/init_di.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initDi();
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: [
        GetPage(
          name: RouteName.main,
          page: () {
            return GetBuilder(
              builder: (ProfileController controller) {
                if (controller.profile == null) return const LoginPage();
                return const MainNavPage();
              },
            );
          },
        ),

        /// Add more pages here
      ],
    );
  }
}
