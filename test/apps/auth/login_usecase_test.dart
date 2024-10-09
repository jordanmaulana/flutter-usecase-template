import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_usecase_template/apps/auth/usecases/login_usecase.dart';
import 'package:flutter_usecase_template/apps/profile/models/profile.dart';
import 'package:flutter_usecase_template/base/resource.dart';

import 'package:flutter_usecase_template/configs/constants.dart';
import 'package:mockito/mockito.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  group('Testing login flow', () {
    final MockDioClient dioClient = MockDioClient();
    final MockGetStorage box = MockGetStorage();
    final MockProfileRepo profileRepo = MockProfileRepo();
    late LoginUsecase loginUsecase;

    setUp(() {
      loginUsecase = LoginUsecase(
        dioClient: dioClient,
        profileRepo: profileRepo,
        box: box,
      );
    });

    test('Login failed', () async {
      /// Mock login API to return error user not found.
      when(
        dioClient.post(
          '/api/login',
          data: {
            'email': 'tes',
            'password': 'tes',
          },
        ),
      ).thenThrow(
        DioException(
          response: Response(
            data: {
              'message': 'User not found',
            },
            requestOptions: RequestOptions(),
          ),
          requestOptions: RequestOptions(),
        ),
      );

      /// Execute the login flow
      final result = await loginUsecase.invoke('tes', 'tes');

      /// Expect the error to be the same with mocked API.
      expect(result.error, 'User not found');

      /// Make sure that box.write is never called.
      verifyNever(box.write(Constants.token, 'tes'));
    });

    test('Login success get profile failed', () async {
      /// Mock login API to return success with token.
      when(
        dioClient.post(
          '/api/login',
          data: {
            'email': 'tes',
            'password': 'tes',
          },
        ),
      ).thenAnswer(
        (realInvocation) {
          return Future.value(
            Response(
              requestOptions: RequestOptions(),
              data: {'api_token': 'token'},
            ),
          );
        },
      );

      /// Mock get profile repo to return error with the specified message.
      when(profileRepo.getProfile()).thenAnswer(
          (realInvocation) => Future.value('Server error'.toResourceFailure()));

      /// Execute login flow.
      final result = await loginUsecase.invoke('tes', 'tes');

      /// Make sure box write is called once because login API success.
      verify(box.write(Constants.token, 'token')).called(1);

      /// Expect the same error with the mocked error
      expect(result.error, 'Server error');

      /// Expect login usecase has error true
      expect(result.hasError, true);

      /// Expect login usecase has no data
      expect(result.hasData, false);
    });

    test('Login success', () async {
      /// Mock login API to return success with token.
      when(
        dioClient.post(
          '/api/login',
          data: {
            'email': 'tes',
            'password': 'tes',
          },
        ),
      ).thenAnswer(
        (realInvocation) {
          return Future.value(
            Response(
              requestOptions: RequestOptions(),
              data: {'api_token': 'token'},
            ),
          );
        },
      );

      /// Mock profile repo to return a profile with id 1.
      when(profileRepo.getProfile()).thenAnswer(
          (realInvocation) => Future.value(Profile(id: 1).toResourceSuccess()));

      /// Execute login flow
      final result = await loginUsecase.invoke('tes', 'tes');

      /// Make sure box.write is called because login API success.
      verify(box.write(Constants.token, 'token')).called(1);
      expect(result.hasError, false);
      expect(result.hasData, true);

      /// Expect the data to be the same with mocked data.
      expect(result.data!.id, 1);
    });
  });
}
