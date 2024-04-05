import 'package:get/get.dart';

class MainNavController extends GetxController {
  RxInt index = 0.obs;

  void setIndex(int data) => index(data);
}
