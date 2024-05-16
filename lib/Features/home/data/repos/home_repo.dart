import 'package:dartz/dartz.dart';
import 'package:weather_app/core/errors/failure.dart';

import '../models/weather_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, WeatherModel>> fetchWeatherData({required String cityName});
}