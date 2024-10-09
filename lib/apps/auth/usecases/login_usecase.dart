import 'package:get_storage/get_storage.dart';

import '../../../api/dio_client.dart';

import '../../../base/resource.dart';
import '../../../configs/constants.dart';
import '../../profile/models/profile.dart';
import '../../profile/repo/profile_repo.dart';
import '../views/login/login_page.dart';

class LoginUsecase {
  final DioClient _dioClient;
  final ProfileRepo _profileRepo;
  final GetStorage _box;

  LoginUsecase({
    required DioClient dioClient,
    required ProfileRepo profileRepo,
    required GetStorage box,
  })  : _box = box,
        _profileRepo = profileRepo,
        _dioClient = dioClient;

  /// Execute login flow.
  ///
  /// Login API from backend only returns token, user profile is called from another API.
  ///
  /// No need for login API call to be moved to repo because it is only called once in 1 place [LoginPage].
  /// Returns [Profile] upon success.
  Future<Resource<Profile, String>> invoke(
      String email, String password) async {
    try {
      final response = await _dioClient.post(
        '/api/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      _box.write(Constants.token, response.data['api_token']);

      return _profileRepo.getProfile();
    } on DioException catch (e) {
      return e.errorMessage.toResourceFailure();
    }
  }
}
