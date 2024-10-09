import 'package:get_storage/get_storage.dart';

import '../../../api/dio_client.dart';
import '../../../base/resource.dart';
import '../../../configs/constants.dart';
import '../models/profile.dart';
import '../../auth/usecases/login_usecase.dart';
import '../../profile/usecases/get_profile_usecase.dart';

/// Handles API calls related to the profile.
///
/// Repo classes will come in handy when it's used by many usecases.
/// For instance, [getProfile] is used in [LoginUsecase] and [GetProfileUsecase].
/// This way, we don't have to write the whole API call flow twice, thus reducing human error of copy pasting the code.
class ProfileRepo {
  final DioClient _dioClient;
  final GetStorage _box;

  /// Constructor is required to enable unit testing.
  /// This way, we can mock the [DioClient] & [GetStorage] functions.
  ProfileRepo({required DioClient dioClient, required GetStorage box})
      : _box = box,
        _dioClient = dioClient;

  Future<Resource<Profile, String>> getProfile() async {
    try {
      /// if no token saved, return unauthenticated error.
      if (!_box.hasData(Constants.token)) {
        return 'Unauthenticated'.toResourceFailure();
      }
      final response = await _dioClient.get('/api/account');
      Profile data = Profile.fromJson(response.data['data']);

      /// Save the newest profile to local storage
      _box.write(Constants.savedProfile, data.toJson());
      return data.toResourceSuccess();
    } on DioException catch (e) {
      return e.errorMessage.toResourceFailure();
    }
  }
}
