import 'package:get/get.dart';

class ChangePasswordController {
  RxBool obscurePassword = true.obs;
  void toggleObscurePassword() => obscurePassword(!obscurePassword.value);

  RxBool obscureNewPassword = true.obs;
  void toggleObscureNewPassword() =>
      obscureNewPassword(!obscureNewPassword.value);

  RxBool obscureNewPasswordConfirmation = true.obs;
  void toggleObscurePasswordConfirmation() =>
      obscureNewPasswordConfirmation(!obscureNewPasswordConfirmation.value);
}
