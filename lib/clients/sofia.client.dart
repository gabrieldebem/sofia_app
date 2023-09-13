import 'package:dio/dio.dart';
import 'package:sofia_app/clients/client_interface.dart';
import 'package:sofia_app/enums/spend_type.dart';

class SofiaClient extends BaseClient {
  Future<Response> auth({
    required String username,
    required String password,
  }) async {
    Dio client = await this.client();
    return await client.post(
      '/users/auth',
      data: {
        'username': username,
        'password': password,
      },
    );
  }

  Future<Response> createSpend({
    required double amount,
    String? description,
    required String category,
    required DateTime date,
    required SpendType type,
  }) async {
    Dio client = await this.client();

    return await client.post(
      '/spends',
      data: {
        'amount': amount,
        'description': description,
        'category': category.trim().toLowerCase().replaceAll(' ', '_'),
        'date': date.toIso8601String(),
        'type': type.name,
      },
    );
  }

  Future<Response> getUser() async {
    Dio client = await this.client();

    return await client.get(
      '/users/me',
    );
  }

  Future<Response> listSpends() async {
    Dio client = await this.client();

    return await client.get(
      '/spends',
    );
  }

  Future<Response> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    Dio client = await this.client();
    return await client.post(
      '/users',
      data: {
        'name': name,
        'email': email,
        'password': password,
      },
    );
  }
}
