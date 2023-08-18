import 'package:flutter/material.dart';
import 'package:sofia_app/bindings/route.binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lime),
        useMaterial3: true,
      ),
      initialRoute: RouteBinding.guest,
      routes: RouteBinding.routes(),
    );
  }
}
