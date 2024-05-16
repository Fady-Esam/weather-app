
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Features/home/data/repos/home_repo.dart';
import 'get_weather_states.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit(this.homeRepo) : super(InitialWeatherState());
  final HomeRepo homeRepo;

  void getWeatherData({required String cityName}) async {
    emit(LoadingWeatherState());
      var res = await homeRepo.fetchWeatherData(cityName: cityName);
      res.fold((failure) {
        emit(FailureWeatherState(errMessage: failure.errMessage));
      }, (weatherModel) {
        emit(SuccessWeatherState(weatherModel: weatherModel));
      });
  }
}
