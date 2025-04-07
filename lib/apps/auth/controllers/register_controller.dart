import 'package:get/get.dart';

// import '../../../components/popup.dart';
// import '../../../configs/route_name.dart';
// import '../../profile/controllers/profile_controller.dart';
// import '../usecases/login_usecase.dart';

class RegisterController extends GetxController {
  // final ProfileController _profileController = Get.find();
  // final LoginUsecase _loginUsecase = Get.find();

  RxBool obscurePassword = true.obs;
  void toggleObscurePassword() => obscurePassword(!obscurePassword.value);

  RxBool obscurePasswordConfirmation = true.obs;
  void toggleObscurePasswordConfirmation() =>
      obscurePasswordConfirmation(!obscurePasswordConfirmation.value);

  void submit() async {
    // VPopup.loading();
    // final result = await _loginUsecase.invoke(email, password);
    // VPopup.pop();
    // result.when(
    //   onSuccess: (data) async {
    //     await _profileController.getProfile();
    //     Get.offAllNamed(RouteName.main);
    //   },
    //   onFailure: (message) {
    //     VPopup.error(message);
    //   },
    // );
  }
}
