import 'package:get/get.dart';
import 'package:sofia_app/clients/sofia.client.dart';

class ChangeEmailUC {
  final ISofiaClient _client = Get.find<ISofiaClient>();

  Future<void> call(String email) async {
    await _client.changeUserEmail(email);
  }
}
