import 'package:get/get.dart';
import 'package:sofia_app/clients/sofia.client.dart';

class SignupUC {
  final ISofiaClient _client = Get.find<ISofiaClient>();

  Future<void> call(
      String name, String email, String phone, String password) async {
    await _client.signup(
      name: name,
      email: email,
      phone: phone,
      password: password,
    );
  }
}
