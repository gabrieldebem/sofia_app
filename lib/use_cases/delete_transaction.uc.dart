import 'package:get/get.dart';
import 'package:sofia_app/clients/sofia.client.dart';
import 'package:sofia_app/models/transaction.dart';

class DeleteTransactionUC {
  final ISofiaClient _client = Get.find<ISofiaClient>();

  Future<void> call(Transaction transaction) async {
    await _client.deleteTransaction(transaction.id);
  }
}
