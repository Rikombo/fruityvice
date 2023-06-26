import 'package:fruttyvice/fruits_repository.dart';
import 'package:fruttyvice/fruits_response.dart';

class JsonFruitsRepository implements FruitsRepository {
  final Map<String, dynamic> _json;

  JsonFruitsRepository(this._json);

  @override
  Future<List<String>> getFruits() async {
    final items = _json['items'] as List<dynamic>;
    final names = items.map(
      (item) => FruitsResponse.fromJson(item).name,
    );
    return names.toList();
  }

  @override
  Future<FruitsResponse> getFruit(String name) {
    // TODO: implement getFruit
    throw UnimplementedError();
  }
}
