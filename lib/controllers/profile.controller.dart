import 'package:get/get.dart';
import 'package:sofia_app/use_cases/change_email.uc.dart';
import 'package:sofia_app/use_cases/change_phone.uc.dart';

class ProfileController extends GetxController {
  final ChangeEmailUC _changeEmailUC = Get.put(ChangeEmailUC());
  final ChangePhoneUC _changePhoneUC = Get.put(ChangePhoneUC());

  Future<void> changeEmail(String email) async {
    await _changeEmailUC(email);
  }

  Future<void> changePhone(String phone) async {
    await _changePhoneUC(phone);
  }
}
