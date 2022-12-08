import 'package:flutter/material.dart';

import '../screens/home_page.dart';
import '../screens/second_page.dart';
import '../screens/thrid_page.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const HomePage(
            title: 'HomePage',
            color: Colors.blueAccent,
          ),
        );

      case '/SecondPage':
        return MaterialPageRoute(
          builder: (_) => const SecondPage(
            title: 'SecondPage',
            color: Colors.redAccent,
          ),
        );

      case '/ThirdPage':
        return MaterialPageRoute(
          builder: (_) => const ThirdPage(
            title: 'ThirdPage',
            color: Colors.greenAccent,
          ),
        );

      default:
        return null;
    }
  }
}
