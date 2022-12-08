import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/counter_cubit.dart';
import '../screens/home_page.dart';
import '../screens/second_page.dart';
import '../screens/thrid_page.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: const HomePage(
              title: 'HomePage',
              color: Colors.blueAccent,
            ),
          ),
        );

      case '/SecondPage':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: const SecondPage(
              title: 'SecondPage',
              color: Colors.redAccent,
            ),
          ),
        );

      case '/ThirdPage':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: const ThirdPage(
              title: 'ThirdPage',
              color: Colors.greenAccent,
            ),
          ),
        );

      default:
        return null;
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}
