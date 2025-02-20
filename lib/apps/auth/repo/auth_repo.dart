import 'package:flutter_usecase_template/api/dio_client.dart';
import 'package:flutter_usecase_template/base/resource.dart';

class AuthRepo {
  final DioClient _dioClient;

  AuthRepo({required DioClient dioClient}) : _dioClient = dioClient;

  Future<Resource<String, String>> invoke(String email, String password) async {
    try {
      final response = await _dioClient.post(
        '/api/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      return response.data['api_token'].toResourceSuccess();
    } on DioException catch (e) {
      return e.errorMessage.toResourceFailure();
    }
  }
}
