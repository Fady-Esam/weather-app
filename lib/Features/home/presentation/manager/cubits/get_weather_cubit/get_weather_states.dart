
import '../../../../data/models/weather_model.dart';

class WeatherState {}

class InitialWeatherState extends WeatherState {}

class SuccessWeatherState extends WeatherState {
  final WeatherModel weatherModel;

  SuccessWeatherState({required this.weatherModel});
}

class FailureWeatherState extends WeatherState {
  final String errMessage;

  FailureWeatherState({required this.errMessage});
}

class LoadingWeatherState extends WeatherState {}
