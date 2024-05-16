import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/utils/app_router.dart';
import 'package:weather_app/core/utils/service_locator.dart';
import 'package:weather_app/core/utils/simple_bloc_observer.dart';
import 'Features/home/data/repos/home_repo_impl.dart';
import 'Features/home/presentation/manager/cubits/get_weather_cubit/get_weather_cubit.dart';


void main() {
  Bloc.observer = SimpleBlocObserver();
  setUpServiceLocator();
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(getIt.get<HomeRepoImpl>()),
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        title: 'Weather App',
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
