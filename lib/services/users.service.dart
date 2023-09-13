import 'package:get/get.dart';
import 'package:sofia_app/clients/sofia.client.dart';
import 'package:sofia_app/models/auth_response.dart';
import 'package:sofia_app/models/user.dart';

class UserService {
  SofiaClient client = Get.put(SofiaClient());

  Future<AuthResponse> auth(String username, String password) async {
    var response = await client.auth(
      username: username,
      password: password,
    );

    return AuthResponse.fromJson(response.data);
  }

  Future<User> signup(
    String name,
    String email,
    String password,
  ) async {
    var response = await client.signup(
      name: name,
      email: email,
      password: password,
    );

    return User.fromJson(response.data);
  }

  Future<User> getUser() async {
    var response = await client.getUser();

    return User.fromJson(response.data);
  }
}
