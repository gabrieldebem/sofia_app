import 'package:dio/dio.dart';
import 'package:sofia_app/services/storage.service.dart';
import 'package:sofia_app/use_cases/revoke_token_uc.dart';

abstract class BaseClient {
  final IStorageService _storage = StorageService();
  String url = 'http://api.sofiaapp.com.br';

  Future<Dio> client({
    Map<String, dynamic>? headers,
  }) async {
    String token = await getToken() ?? '';

    var client = Dio(
      BaseOptions(
        baseUrl: url,
        headers: {...?headers, "Authorization": "Bearer $token"},
        contentType: 'application/json',
      ),
    );

    client.interceptors.add(InterceptorsWrapper(
      onError: (error, handler) {
        if (error.response?.statusCode == 401) {
          var uc = RevokeTokenUC();
          uc.execute();
        }
        return handler.next(error);
      },
    ));

    return client;
  }

  Future<String?> getToken() async {
    return _storage.get('token');
  }
}
