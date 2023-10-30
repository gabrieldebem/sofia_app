import 'package:get/get.dart';
import 'package:sofia_app/clients/sofia.client.dart';
import 'package:sofia_app/controllers/create_spend.controller.dart';
import 'package:sofia_app/controllers/home.controller.dart';
import 'package:sofia_app/controllers/login.controller.dart';
import 'package:sofia_app/controllers/signup.controller.dart';
import 'package:sofia_app/controllers/summary.controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<ISofiaClient>(SofiaClient(), permanent: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: false);
    Get.lazyPut<CreateSpendController>(() => CreateSpendController());
    Get.put(LoginController());
    Get.put(SignupController());
    Get.lazyPut(() => SummaryController());
  }
}
