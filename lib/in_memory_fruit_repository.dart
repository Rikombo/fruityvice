import 'package:fruttyvice/fruits_repository.dart';
import 'package:fruttyvice/fruits_response.dart';

class InMemoryFruitsRepository implements FruitsRepository {
  @override
  Future<List<String>> getFruits() async {
    return ['apple', 'banana', 'orange'];
  }

  @override
  Future<FruitsResponse> getFruit(String name) async {
    throw UnimplementedError();
  }
}
