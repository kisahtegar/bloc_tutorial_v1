// BlocConsumer gabungan dari:
// BlocBuilder dan BlocListener

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/cubit/counter_cubit.dart';
import 'presentation/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter_bloc Demo',
      debugShowCheckedModeBanner: false,
      home: BlocProvider<CounterCubit>(
        create: (context) => CounterCubit(),
        child: const HomePage(
          title: "hello",
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}
