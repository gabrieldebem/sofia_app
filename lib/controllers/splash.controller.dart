import 'package:sofia_app/bindings/routes.dart';
import 'package:sofia_app/services/storage.service.dart';

class SplashController {
  final IStorageService _storageService = StorageService();

  Future<String> init() async {
    String? token = await _storageService.get('token');

    return token != null ? Routes.home : Routes.guest;
  }
}
