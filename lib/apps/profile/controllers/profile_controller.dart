import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../configs/constants.dart';
import '../../../configs/route_name.dart';
import '../models/profile.dart';
import '../usecases/get_profile_usecase.dart';

class ProfileController extends GetxController {
  final GetProfileUsecase _getProfileUsecase = Get.find();
  final GetStorage _box = Get.find();
  Profile? profile;

  Future<void> getProfile() async {
    if (_box.hasData(Constants.savedProfile)) {
      profile = Profile.fromJson(_box.read(Constants.savedProfile));
      update();
    }

    final result = await _getProfileUsecase.invoke();
    result.when(
      onSuccess: (data) {
        profile = data;
        update();
      },
      onFailure: (message) {},
    );
  }

  void logout() {
    profile = null;
    _box.erase();
    update();
    Get.offAllNamed(RouteName.main);
  }

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }
}
