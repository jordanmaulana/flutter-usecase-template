import 'package:dio/dio.dart';
import 'package:get/get.dart';

/// This is the error parser. It is used as standard to parse error from API responses.
extension ResponseExtension on DioException {
  String get errorMessage {
    if (response != null) {
      String? error;
      try {
        /// TODO: Modify the error parser according to your own standard backend response.
        error = response!.data['message'];
      } catch (e) {
        Get.log('Error $e');
      }

      switch (response!.statusCode) {
        case 400:
          return error ?? 'Please check your input';
        case 403:
          return error ?? 'Invalid access';
        case 404:
          return error ?? 'This service is no longer available';
        case 500:
          return error ?? 'Something went wrong on our end';
        default:
          return error ?? 'Something went wrong';
      }
    } else {
      /// Something happened in setting up or sending the request that triggered an Error
      return 'ERROR\n${requestOptions.uri.path.toString()}\n${toString()}';
    }
  }
}
