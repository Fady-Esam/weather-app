import 'package:dio/dio.dart';

class ApiService {
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final Dio dio;

  ApiService({required this.dio});

  Future<Map<String, dynamic>> get({required String endpoint}) async {
    var res = await dio.get(baseUrl + endpoint);
    return res.data;
  }
}
