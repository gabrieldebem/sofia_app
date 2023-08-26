import 'package:dio/dio.dart';
import 'package:sofia_app/services/storage.service.dart';

abstract class IClient {
  final IStorageService _storage = StorageService();
  String url = 'https://l0me52wcld.execute-api.us-east-1.amazonaws.com/dev';

  Dio client({
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) =>
      Dio(
        BaseOptions(
          baseUrl: url,
          headers: {
            ...?headers,
          },
          queryParameters: queryParameters,
          contentType: 'application/json',
        ),
      );

  Future<String?> getToken() async {
    return _storage.get('token');
  }
}
