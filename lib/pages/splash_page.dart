import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sofia_app/controllers/splash.controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashController _splashController = SplashController();

  @override
  void initState() {
    super.initState();

    Future.wait([
      _splashController.init(),
      Future.delayed(const Duration(seconds: 3)),
    ]).then((value) {
      Get.toNamed(value[0]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Theme.of(context).colorScheme.primary,
          alignment: Alignment.center,
          child: CircularProgressIndicator(
            color: Theme.of(context).colorScheme.onPrimary,
          )),
    );
  }
}
