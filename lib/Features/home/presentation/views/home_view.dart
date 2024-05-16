import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../manager/cubits/get_weather_cubit/get_weather_cubit.dart';
import '../manager/cubits/get_weather_cubit/get_weather_states.dart';
import 'home_view_with_data.dart';
import 'home_view_without_data.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.pink,
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              GoRouter.of(context).push('/searchView');
            },
            icon: const Icon(
              Icons.search,
              size: 29,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is InitialWeatherState) {
            return const HomeViewWithoutData();
          } else if (state is FailureWeatherState) {
            return Align(
              alignment: Alignment.center,
              child: Text(
                '${state.errMessage}, Please try again',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            );
          } else if (state is SuccessWeatherState) {
            return HomeViewWithData(weatherModel: state.weatherModel);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
