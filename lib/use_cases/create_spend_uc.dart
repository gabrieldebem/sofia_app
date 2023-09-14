import 'package:sofia_app/clients/sofia.client.dart';
import 'package:sofia_app/enums/spend_type.dart';
import 'package:sofia_app/models/spend.dart';

class CreateSpendUC {
  final SofiaClient _client = SofiaClient();

  Future<Spend> execute({
    required double amount,
    required String category,
    required DateTime date,
    required String type,
    String? description,
  }) async {
    final response = await _client.createSpend(
        amount: amount,
        description: description,
        category: category,
        date: date,
        type: SpendType.values.firstWhere(
          (e) => e.toString() == 'SpendType.$type',
        ));

    return Spend.fromJson(response.data);
  }
}
