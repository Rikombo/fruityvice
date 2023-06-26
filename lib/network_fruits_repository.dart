import 'package:fruttyvice/fruits_api_client.dart';
import 'package:fruttyvice/fruits_response.dart';

import 'fruits_repository.dart';

class NetworkFruitsRepository implements FruitsRepository {
  final FruitsApiClient _fruitsApiClient;

  NetworkFruitsRepository(this._fruitsApiClient);

  @override
  Future<List<String>> getFruits() async {
    final fruits = await _fruitsApiClient.getAllFruits();
    return fruits.map((fruit) => fruit.name).toList();
  }

  @override
  Future<FruitsResponse> getFruit(String name) async {
    final fruit = await _fruitsApiClient.getFruit(name);
    return fruit;
  }
}
