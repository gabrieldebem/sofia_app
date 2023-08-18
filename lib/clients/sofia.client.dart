import 'package:dio/dio.dart';
import 'package:sofia_app/clients/client_interface.dart';

class SofiaClient extends IClient {
  Future<Response> auth({
    required String username,
    required String password,
  }) async {
    return await client().post(
      '/users/auth',
      data: {
        'username': username,
        'password': password,
      },
    );
  }

  Future<Response> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    return await client().post(
      '/users',
      data: {
        'name': name,
        'email': email,
        'password': password,
      },
    );
  }
}
