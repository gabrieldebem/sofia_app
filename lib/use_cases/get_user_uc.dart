import 'package:get/get.dart';
import 'package:sofia_app/clients/sofia.client.dart';
import 'package:sofia_app/models/user.dart';

class GetUserUC {
  final ISofiaClient _client = Get.find<ISofiaClient>();

    Future<User> execute() async {
        var response = await _client.getUser();

        return User.fromJson(response.data);
    }
}
