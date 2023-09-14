import 'package:sofia_app/clients/sofia.client.dart';

class SignupUC {
    final SofiaClient _client = SofiaClient();

    Future<void> execute(String name, String email, String password) async {
        await _client.signup(
            name: name,
            email: email,
            password: password,
        );
    }
}
