import 'package:get/get.dart';
import 'package:sofia_app/clients/sofia.client.dart';
import 'package:sofia_app/models/transaction.dart';

class ListSpendsUC {
  final ISofiaClient _client = Get.find<ISofiaClient>();

  Future<List<Transaction>> execute() async {
    var response = await _client.listSpends();

    return (response.data as List)
        .map((spend) => Transaction.fromJson(spend))
        .toList();
  }
}
