import 'package:dio/dio.dart';
import 'package:flutter_application_2/core/constants.dart';

Dio createDio() {
  var dio = Dio(BaseOptions(baseUrl: baseUrl));

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['Authorization'] = token;
        return handler.next(options);
      },
    ),
  );

  return dio;
}
