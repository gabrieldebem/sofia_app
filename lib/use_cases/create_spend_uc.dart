import 'package:get/get.dart';
import 'package:sofia_app/clients/sofia.client.dart';
import 'package:sofia_app/models/transaction.dart';

class CreateSpendUC {
  final ISofiaClient _client = Get.find<ISofiaClient>();

  Future<Transaction> call({
    required double amount,
    required String category,
    required DateTime date,
    String? description,
  }) async {
    final response = await _client.createSpend(
        amount: amount,
        description: description,
        category: category,
        date: date,
        );

    return Transaction.fromJson(response.data);
  }
}
