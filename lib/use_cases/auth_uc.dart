import 'package:sofia_app/clients/sofia.client.dart';
import 'package:sofia_app/services/storage.service.dart';

class AuthUC {
  final IStorageService _storageService = StorageService();
  final SofiaClient _client = SofiaClient();

  Future<void> execute(String username, String password) async {
    var response = await _client.auth(
      username: username,
      password: password,
    );

    await _storageService.set('token', response.data['access_token']);
  }
}