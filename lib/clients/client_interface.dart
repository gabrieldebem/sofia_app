import 'package:dio/dio.dart';
import 'package:sofia_app/services/storage.service.dart';
import 'package:sofia_app/use_cases/revoke_token_uc.dart';

abstract class BaseClient {
  final IStorageService _storage = StorageService();
  String url = 'https://l0me52wcld.execute-api.us-east-1.amazonaws.com/dev';

  Future<Dio> client({
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    String token = await getToken() ?? '';
    var client = Dio(
      BaseOptions(
        baseUrl: url,
        headers: {...?headers, 'Authorization': 'Bearer $token'},
        queryParameters: queryParameters,
        contentType: 'application/json',
      ),
    );

    client.interceptors.add(InterceptorsWrapper(
      onError: (error, handler) async {
        if (error.response?.statusCode == 401) {
          await RevokeTokenUC().execute();
        }
      },
    ));

    return client;
  }

  Future<String?> getToken() async {
    return _storage.get('token');
  }
}
