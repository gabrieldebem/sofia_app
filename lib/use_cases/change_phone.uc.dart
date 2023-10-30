import 'package:get/get.dart';
import 'package:sofia_app/clients/sofia.client.dart';

class ChangePhoneUC {
  final ISofiaClient _client = Get.find<ISofiaClient>();

  Future<void> call(String phone) async {
    await _client.changeUserPhone(phone);
  }
}
