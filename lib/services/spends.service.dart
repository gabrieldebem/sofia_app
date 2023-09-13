import 'package:get/get.dart';
import 'package:sofia_app/clients/sofia.client.dart';
import 'package:sofia_app/enums/spend_type.dart';
import 'package:sofia_app/models/spend.dart';

class SpendService {
  final SofiaClient _sofiaClient = SofiaClient();

  Future<List<Spend>> listSpends() async {
    final response = await _sofiaClient.listSpends();

    return (response.data as List)
        .map((spend) => Spend.fromJson(spend))
        .toList();
  }

  Future<Spend> createSpend({
    required double amount,
    required String category,
    required DateTime date,
    required String type,
    String? description,
  }) async {
    try {
      final response = await _sofiaClient.createSpend(
          amount: amount,
          description: description,
          category: category,
          date: date,
          type: SpendType.values.firstWhere(
            (e) => e.toString() == 'SpendType.$type',
          ));

      return Spend.fromJson(response.data);
    } catch (e) {
      e.printError();
      rethrow;
    }
  }
}
