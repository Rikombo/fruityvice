import 'package:fruttyvice/fruits_response.dart';

abstract class FruitsRepository {
  Future<List<String>> getFruits();

  Future<FruitsResponse> getFruit(String name);
}
