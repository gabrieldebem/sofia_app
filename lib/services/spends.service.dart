import 'package:sofia_app/clients/sofia.client.dart';
import 'package:sofia_app/view_models/spend_response.dart';

class SpendService {
  final SofiaClient _sofiaClient = SofiaClient();

  Future<List<SpendResponse>> listTransactions() async {
    final response = await _sofiaClient.listSpends();

    return (response.data as List)
        .map((spend) => SpendResponse.fromJson(spend))
        .toList();
  }
}
