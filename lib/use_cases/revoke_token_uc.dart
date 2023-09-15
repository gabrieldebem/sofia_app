import 'package:get/get.dart';
import 'package:sofia_app/bindings/routes.dart';
import 'package:sofia_app/services/storage.service.dart';

class RevokeTokenUC {
  final IStorageService _storage = StorageService();

  Future<void> execute() async {
    await _storage.delete('token');
    Get.toNamed(Routes.login);
  }
}
