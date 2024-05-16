import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/core/errors/failure.dart';
import 'package:weather_app/core/utils/api_service.dart';
import 'package:weather_app/secrets/app_secrets.dart';
import '../models/weather_model.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, WeatherModel>> fetchWeatherData(
      {required String cityName}) async {
    try {
      var res = await apiService.get(
          endpoint:
              '/forecast.json?key=${AppSecrets.apiKey}&q=$cityName&days=1');
      return right(WeatherModel.fromJson(res));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioErro(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
