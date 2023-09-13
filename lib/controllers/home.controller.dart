import 'package:get/get.dart';
import 'package:sofia_app/bindings/routes.dart';
import 'package:sofia_app/services/spends.service.dart';
import 'package:sofia_app/services/users.service.dart';
import 'package:sofia_app/models/spend.dart';
import 'package:sofia_app/models/user.dart';

class HomeController extends GetxController {
  final UserService _userService = Get.put(UserService());
  final SpendService _spendService = Get.put(SpendService());

  final Rx<User> _user = User().obs;
  final RxList<Spend> _spends = <Spend>[].obs;

  User get user => _user.value;
  List<Spend> get spends => _spends;

  set user(User? value) => _user.value = value!;
  set spends(List<Spend> value) => _spends.value = value;

  @override
  void onInit() {
    fetchUser();
    fetchSpends();

    super.onInit();
  }

  Future<void> fetchUser() async {
    try {
      user = await _userService.getUser();
    } catch (e) {
      Get.toNamed(Routes.guest);
    }
  }

  Future<void> fetchSpends() async {
    spends = await _spendService.listSpends();
  }
}
