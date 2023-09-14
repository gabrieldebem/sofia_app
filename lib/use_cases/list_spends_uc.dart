import 'package:sofia_app/clients/sofia.client.dart';
import 'package:sofia_app/models/spend.dart';

class ListSpendsUC {
  final SofiaClient _client = SofiaClient();

  Future<List<Spend>> execute() async {
    var response = await _client.listSpends();

    return (response.data as List)
        .map((spend) => Spend.fromJson(spend))
        .toList();
  }
}
