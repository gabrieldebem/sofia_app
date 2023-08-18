import 'package:http/http.dart' as http;
import 'package:sofia_app/clients/client_interface.dart';

class SofiaClient extends IClient {
  Future<http.Response> auth({
    required String username,
    required String password,
  }) async {
    return await client.post(
      resolveUrl('users/auth'),
      body: {
        'username': username,
        'password': password,
      },
    );
  }

  Future<http.Response> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    return await client.post(
      resolveUrl('users'),
      body: {
        'name': name,
        'email': email,
        'password': password,
      },
    );
  }
}
