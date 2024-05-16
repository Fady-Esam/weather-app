import 'package:flutter/material.dart';

import '../../data/models/weather_model.dart';

class HomeViewWithData extends StatelessWidget {
  const HomeViewWithData({
    super.key,
    required this.weatherModel,
  });

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentDirectional.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 248, 4, 85),
            Color.fromARGB(255, 241, 99, 146),
            Color.fromARGB(255, 241, 140, 174),
            Color.fromARGB(255, 239, 210, 219),
            // Color.fromARGB(255, 9, 144, 254),
            // Color.fromARGB(248, 76, 170, 247),
            // Color.fromARGB(255, 127, 193, 247),
            // Color.fromARGB(255, 203, 225, 243),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherModel.cityName,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            'Updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 80,
                child: Image.network(
                  'https:${weatherModel.image}',
                ),
              ),
              Text(
                weatherModel.temp.toString(),
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Column(
                children: [
                  Text(
                    'MaxTemp: ${weatherModel.maxTemp.toString()}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'MinTemp: ${weatherModel.minTemp.toString()}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 60),
          Text(
            weatherModel.status,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
