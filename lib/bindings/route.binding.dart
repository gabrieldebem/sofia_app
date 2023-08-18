import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sofia_app/pages/error_page.dart';
import 'package:sofia_app/pages/guest_page.dart';
import 'package:sofia_app/pages/login_page.dart';
import 'package:sofia_app/pages/signup_page.dart';

class RouteBinding {
    static const String guest = '/';
    static const String login = '/login';
    static const String signup = '/signup';
    static const String error = '/error';

    static Map<String, Widget Function(BuildContext)> routes() {
        return {
            RouteBinding.guest: (context) => const GuestPage(),
            RouteBinding.login: (context) => const LoginPage(),
            RouteBinding.signup: (context) => const SignupPage(),
        };
    }

    static Route<dynamic> generateRoute(RouteSettings settings) {
        switch (settings.name) {
            case RouteBinding.error:
                return MaterialPageRoute(
                    builder: (context) => ErrorPage(exception: settings.arguments as DioException),
                );
            default:
                return MaterialPageRoute(
                    builder: (context) => ErrorPage(exception: settings.arguments as DioException),
                );
        }
    }
}
