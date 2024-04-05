import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'api/dio_client.dart';
import 'apps/auth/usecases/login_usecase.dart';
import 'apps/profile/repo/profile_repo.dart';
import 'apps/profile/usecases/get_profile_usecase.dart';
import 'configs/flavors.dart';

/// Inject all dependencies
///
/// Use [Get.put] for dependencies that is called everywhere and no need to be destroyed.
/// Use [Get.lazyput] for dependencies that is only called after some stages of user interaction.
/// fenix: true indicates that it has its own lifecyle, so that it can be called again after being destroyed.
void initDi() {
  GetStorage box = Get.put(GetStorage());

  DioClient dioClient = Get.put(
    DioClient(
      box,
      options: BaseOptions(
        baseUrl: (Get.find<BuildFlavor>()).apiUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 30),
      ),
    ),
  );

  /// Inject [ProfileRepo] so it can't be called using [Get.find()]
  Get.lazyPut(
    () => ProfileRepo(box: box, dioClient: dioClient),
    fenix: true,
  );

  Get.lazyPut(
    () => LoginUsecase(
      box: box,
      dioClient: dioClient,
      profileRepo: Get.find(),
    ),
    fenix: true,
  );

  Get.lazyPut(() => GetProfileUsecase(Get.find()));
}
