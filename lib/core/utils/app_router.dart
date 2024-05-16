
import 'package:go_router/go_router.dart';

import '../../Features/home/presentation/views/home_view.dart';
import '../../Features/home/presentation/views/search_view.dart';

abstract class AppRouter{
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/',builder: (context, state) => const HomeView()),
      GoRoute(path: '/searchView',builder: (context, state) => const SearchView()),
    ]
  );
} 
