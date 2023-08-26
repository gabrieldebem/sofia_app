import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sofia_app/services/spends.service.dart';
import 'package:sofia_app/services/users.service.dart';
import 'package:sofia_app/view_models/spend_response.dart';
import 'package:sofia_app/view_models/user_response.dart';

class HomeController {
  final UserService _userService = Get.put(UserService());
  final SpendService _spendService = Get.put(SpendService());

  final Rx<UserResponse> _user = UserResponse().obs;
  final RxList<SpendResponse> _spends = <SpendResponse>[].obs;

  UserResponse get user => _user.value;
  List<SpendResponse> get spends => _spends;

  set user(UserResponse? value) => _user.value = value!;
  set spends(List<SpendResponse> value) => _spends.value = value;

  Future<void> fetchUser(BuildContext context) async {
    try {
      user = await _userService.getUser();
    } catch (e) {
      Navigator.pushNamed(context, '/login');
    }
  }

  Future<void> fetchSpends() async {
    spends = await _spendService.listTransactions();
  }
}
