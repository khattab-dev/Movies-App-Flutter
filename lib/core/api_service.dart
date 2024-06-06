import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  // eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwNDhlMmU0OGUzNDFmNTY0YWFlN2M3OTVlZTkzNmRiNSIsInN1YiI6IjY0YjkzMjJmMjdkYjYxMDBjNTNjMTE3YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.IEV94-F1OTDq4SJI2OExfN9lqXZwquPsj0jdR2Ij9Zc
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get(endPoint);
    return response.data;
  }
}
