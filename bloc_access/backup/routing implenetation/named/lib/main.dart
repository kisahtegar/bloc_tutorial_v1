// BlocConsumer gabungan dari:
// BlocBuilder dan BlocListener

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/cubit/counter_cubit.dart';
import 'presentation/screens/home_page.dart';
import 'presentation/screens/second_page.dart';
import 'presentation/screens/thrid_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit _counterCubit = CounterCubit();

  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter_bloc Demo',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => BlocProvider.value(
              value: _counterCubit,
              child: const HomePage(
                title: "HomePage",
                color: Colors.blueAccent,
              ),
            ),
        '/SecondPage': (context) => BlocProvider.value(
              value: _counterCubit,
              child: const SecondPage(
                title: 'SecondPage',
                color: Colors.redAccent,
              ),
            ),
        '/ThirdPage': (context) => BlocProvider.value(
              value: _counterCubit,
              child: const ThirdPage(
                title: 'ThirdPage',
                color: Colors.greenAccent,
              ),
            ),
      },
    );
  }
}
