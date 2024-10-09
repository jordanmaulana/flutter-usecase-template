import '../../../base/resource.dart';
import '../models/profile.dart';
import '../repo/profile_repo.dart';

class GetProfileUsecase {
  final ProfileRepo _repo;
  GetProfileUsecase(this._repo);

  Future<Resource<Profile, String>> invoke() async {
    /// A usecase can directly return repo if there is no further action other than to call the API from repo.
    /// Why not directly call the repo then?
    /// Because controller SHOULD NOT directly call repo to maintain its clean architecture.
    /// See [readme.md] for better understanding.
    return await _repo.getProfile();
  }
}
