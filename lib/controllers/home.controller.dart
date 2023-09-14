import 'package:get/get.dart';
import 'package:sofia_app/bindings/routes.dart';
import 'package:sofia_app/models/spend.dart';
import 'package:sofia_app/models/user.dart';
import 'package:sofia_app/use_cases/get_user_uc.dart';
import 'package:sofia_app/use_cases/list_spends_uc.dart';

class HomeController extends GetxController {
  final GetUserUC _getUserUC = Get.put(GetUserUC());
  final ListSpendsUC _listSpendsUC = Get.put(ListSpendsUC());

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
      user = await _getUserUC.execute();
    } catch (e) {
      Get.toNamed(Routes.guest);
    }
  }

  Future<void> fetchSpends() async {
    spends = await _listSpendsUC.execute();
  }
}
