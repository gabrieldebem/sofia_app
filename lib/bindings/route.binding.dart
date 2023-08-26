import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sofia_app/pages/error_page.dart';
import 'package:sofia_app/pages/guest_page.dart';
import 'package:sofia_app/pages/home_page.dart';
import 'package:sofia_app/pages/login_page.dart';
import 'package:sofia_app/pages/signup_page.dart';
import 'package:sofia_app/pages/splash_page.dart';

class RouteBinding {
  static String initialRoute = '/splash';

  static const String slash = '/splash';
  static const String guest = '/guest';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String error = '/error';
  static const String home = '/home';
  static const String createSpend = '/spend';

  static Map<String, Widget Function(BuildContext)> routes() {
    return {
      RouteBinding.slash: (context) => const SplashPage(),
      RouteBinding.guest: (context) => const GuestPage(),
      RouteBinding.login: (context) => const LoginPage(),
      RouteBinding.signup: (context) => const SignupPage(),
      RouteBinding.home: (context) => const HomePage(),
    };
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteBinding.error:
        return MaterialPageRoute(
          builder: (context) =>
              ErrorPage(exception: settings.arguments as DioException),
        );
      default:
        return MaterialPageRoute(
          builder: (context) =>
              ErrorPage(exception: settings.arguments as DioException),
        );
    }
  }
}
