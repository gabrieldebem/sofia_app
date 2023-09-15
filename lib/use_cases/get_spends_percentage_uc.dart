import 'package:sofia_app/clients/sofia.client.dart';
import 'package:sofia_app/models/percentage.dart';

class GetSpendsPercentageUC {
  final SofiaClient _sofiaClient = SofiaClient();

  Future<List<Percentage>> execute(DateTime initialDate, DateTime finalDate) async {
    final response = await _sofiaClient.getSpendPercentage(
      initialDate: initialDate,
      finalDate: finalDate,
    );

    return (response.data as List)
        .map((percentage) => Percentage.fromJson(percentage))
        .toList();
  }
}
