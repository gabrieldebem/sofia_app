import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sofia_app/bindings/initial_bindings.dart';
import 'package:sofia_app/bindings/routes.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sofia App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      initialRoute: Routes.initialRoute,
      getPages: Routes.pages,
      initialBinding: InitialBindings(),
    );
  }
}
