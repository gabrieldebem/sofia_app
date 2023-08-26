import 'package:dio/dio.dart';
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

    return AuthResponse.fromJson(response.data);
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

    return UserResponse.fromJson(response.data);
  }

  Future<UserResponse> getUser() async {
    var response = await client.getUser();

    return UserResponse.fromJson(response.data);
  }
}
