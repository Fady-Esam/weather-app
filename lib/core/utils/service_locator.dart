import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/core/utils/api_service.dart';

import '../../Features/home/data/repos/home_repo_impl.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));
  getIt.registerSingleton<HomeRepoImpl>(
      HomeRepoImpl(apiService: getIt.get<ApiService>()));
}
