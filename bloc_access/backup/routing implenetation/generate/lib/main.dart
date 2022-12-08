// BlocConsumer gabungan dari:
// BlocBuilder dan BlocListener

import 'package:flutter/material.dart';

import 'presentation/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();

  @override
  void dispose() {
    _appRouter.dispose();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter_bloc Demo',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: _appRouter.onGenerateRoute,
    );
  }
}
