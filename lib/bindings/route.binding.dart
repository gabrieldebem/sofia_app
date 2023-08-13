import 'package:flutter/material.dart';
import 'package:sofia_app/pages/home_page.dart';
import 'package:sofia_app/pages/login_page.dart';
import 'package:sofia_app/pages/signup_page.dart';

class RouteBinding {
    static const String home = '/';
    static const String login = '/login';
    static const String signup = '/signup';

    static Map<String, Widget Function(BuildContext)> routes() {
        return {
            RouteBinding.home: (context) => HomePage(),
            RouteBinding.login: (context) => const LoginPage(),
            RouteBinding.signup: (context) => const SignupPage(),
        };
    }
}
