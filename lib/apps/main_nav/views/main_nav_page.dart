import 'package:flutter_usecase_template/apps/profile/views/profile_page.dart';

import '../../../base/export_view.dart';
import '../controllers/main_nav_controller.dart';

class MainNavPage extends StatelessWidget {
  const MainNavPage({super.key});

  @override
  Widget build(BuildContext context) {
    MainNavController controller = Get.put(MainNavController());

    return Obx(
      () {
        return Scaffold(
          body: Builder(
            builder: (context) {
              switch (controller.index.value) {
                case 0:
                  return Container();
                case 1:
                  return Container();
                case 2:
                  return const ProfilePage();
              }
              return Container();
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: VColor.white,
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.index.value,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0.0,
            onTap: (v) => controller.setIndex(v),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.data_array),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: '',
              ),
            ],
          ),
        );
      },
    );
  }
}
