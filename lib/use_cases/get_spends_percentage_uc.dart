import 'package:get/get.dart';
import 'package:sofia_app/clients/sofia.client.dart';
import 'package:sofia_app/models/percentage.dart';

class GetSpendsPercentageUC {
  final ISofiaClient _client = Get.find<ISofiaClient>();

  Future<List<Percentage>> call(DateTime initialDate, DateTime finalDate) async {
    final response = await _client.getSpendPercentage(
      initialDate: initialDate,
      finalDate: finalDate,
    );

    return (response.data as List)
        .map((percentage) => Percentage.fromJson(percentage))
        .toList();
  }
}
