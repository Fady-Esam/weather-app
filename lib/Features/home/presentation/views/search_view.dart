import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../manager/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late TextEditingController controller;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.pink,
        title: const Text(
          'Search A City',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Color.fromARGB(230, 255, 255, 255),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 150, right: 15, left: 15),
        child: Form(
          key: formKey,
          child: TextFormField(
            onFieldSubmitted: (value) {
              if (formKey.currentState!.validate()) {
                BlocProvider.of<GetWeatherCubit>(context)
                    .getWeatherData(cityName: value);
                GoRouter.of(context).pop();
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter a city name';
              } else if (value.trim().length < 4) {
                return 'Please enter a valid city name';
              }
              return null;
            },
            controller: controller,
            autovalidateMode: autovalidateMode,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 16,
              ),
              labelText: 'Search',
              suffixIcon: IconButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    BlocProvider.of<GetWeatherCubit>(context)
                        .getWeatherData(cityName: controller.text);
                    GoRouter.of(context).pop();
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                icon: const Icon(
                  Icons.search,
                ),
              ),
              hintText: 'City Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Colors.pink,
                  width: 2,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Colors.pink,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Colors.pink,
                  width: 2,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
