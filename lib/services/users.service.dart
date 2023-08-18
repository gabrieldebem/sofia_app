import 'dart:convert';

import 'package:get/get.dart';
import 'package:sofia_app/clients/sofia.client.dart';
import 'package:sofia_app/view_models/auth_response.dart';
import 'package:sofia_app/view_models/user_response.dart';

class UserService {
  SofiaClient client = Get.put(SofiaClient());

  Future<AuthResponse> auth(String username, String password) async {
    var response = await client.auth(
      username: username,
      password: password,
    );

    var decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;
    return AuthResponse.fromJson(decodedResponse);
  }

  Future<UserResponse> signup(
    String name,
    String email,
    String password,
  ) async {
    var response = await client.signup(
      name: name,
      email: email,
      password: password,
    );

    var decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode != 200) {
      throw Exception(
          decodedResponse['message'] ?? 'Houve uma falha ao criar sua conta.');
    }

    return UserResponse.fromJson(decodedResponse);
  }
}
