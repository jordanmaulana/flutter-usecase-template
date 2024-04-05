import 'package:flutter_usecase_template/api/dio_client.dart';
import 'package:flutter_usecase_template/apps/profile/repo/profile_repo.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  GetStorage,
  DioClient,

  /// Add objects to be mocked here.
  ProfileRepo,
])
void main() {}
