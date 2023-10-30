import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:sofia_app/clients/client_interface.dart';

abstract class ISofiaClient extends BaseClient {
  Future<Response> auth({
    required String username,
    required String password,
  });

  Future<Response> createSpend({
    required double amount,
    String? description,
    required String category,
    required DateTime date,
  });

  Future<Response> getUser();

  Future<Response> listSpends();

  Future<Response> signup({
    required String name,
    required String email,
    required String phone,
    required String password,
  });

  Future<Response> getSpendPercentage({
    required DateTime initialDate,
    required DateTime finalDate,
  });

  Future<Response> deleteTransaction(String id);

  Future<Response> changeUserEmail(String email);

  Future<Response> changeUserPassword(String password);

  Future<Response> changeUserPhone(String phone);
}

class SofiaClient extends ISofiaClient {
  @override
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

  @override
  Future<Response> createSpend({
    required double amount,
    String? description,
    required String category,
    required DateTime date,
  }) async {
    Dio client = await this.client();

    return await client.post(
      '/transactions',
      data: {
        'amount': amount,
        'description': description,
        'category': category,
        'date': date.toIso8601String(),
      },
    );
  }

  @override
  Future<Response> getUser() async {
    Dio client = await this.client();

    return await client.get(
      '/users/me',
    );
  }

  @override
  Future<Response> listSpends() async {
    Dio client = await this.client();

    return await client.get(
      '/transactions',
    );
  }

  @override
  Future<Response> signup({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    Dio client = await this.client();
    return await client.post(
      '/users',
      data: {
        'name': name,
        'email': email,
        'phone': phone,
        'password': password,
      },
    );
  }

  @override
  Future<Response> getSpendPercentage({
    required DateTime initialDate,
    required DateTime finalDate,
  }) async {
    initialDate = DateFormat("yyyy-MM-dd").parse(initialDate.toString());
    finalDate = DateFormat("yyyy-MM-dd").parse(finalDate.toString());

    Dio client = await this.client();

    return await client
        .get("/transactions/spends/amount?from=$initialDate&to=$finalDate");
  }

  @override
  Future<Response> deleteTransaction(String id) async {
    Dio client = await this.client();

    return await client.delete("/transactions/$id");
  }

  @override
  Future<Response> changeUserEmail(String email) async {
    Dio client = await this.client();

    return await client.put(
      "/users/email",
      data: {
        'email': email,
      },
    );
  }

  @override
  Future<Response> changeUserPassword(String password) async {
    Dio client = await this.client();

    return await client.put(
      "/users/password",
      data: {
        'password': password,
      },
    );
  }

  @override
  Future<Response> changeUserPhone(String phone) async {
    Dio client = await this.client();

    return await client.put(
      "/users/phone",
      data: {
        'phone': phone,
      },
    );
  }
}
