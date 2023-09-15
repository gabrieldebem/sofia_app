import 'package:get/get.dart';
import 'package:sofia_app/components/create_spend_dialog.dart';
import 'package:sofia_app/pages/guest_page.dart';
import 'package:sofia_app/pages/home_page.dart';
import 'package:sofia_app/pages/login_page.dart';
import 'package:sofia_app/pages/profile_page.dart';
import 'package:sofia_app/pages/signup_page.dart';
import 'package:sofia_app/pages/splash_page.dart';
import 'package:sofia_app/pages/summary_page.dart';

class Routes {
  static const String splash = '/splash';
  static const String guest = '/guest';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String error = '/error';
  static const String home = '/home';
  static const String createSpend = '/spend';
  static const String profile = '/profile';
  static const String summary = '/summary';

  static const String initialRoute = Routes.splash;

  static final pages = <GetPage>[
    GetPage(
      name: Routes.splash,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: Routes.guest,
      page: () => const GuestPage(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: Routes.signup,
      page: () => const SignupPage(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
    ),
    GetPage(
      name: Routes.createSpend,
      page: () => const CreateSpendDialog(),
    ),
    GetPage(
      name: Routes.profile,
      page: () => ProfilePage(),
    ),
    GetPage(
      name: Routes.summary,
      page: () => const SummaryPage(),
    ),
  ];
}
