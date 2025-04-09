import 'package:flutter_usecase_template/base/export_view.dart';

class DeleteAccountController {
  RxBool isLoading = false.obs;

  RxBool isInputValid = false.obs;

  void onChange(String? value) {
    if (value == 'DELETE') {
      isInputValid(true);
    } else {
      isInputValid(false);
    }
  }

  void submit() {
    // Logic to delete the account
  }
}
