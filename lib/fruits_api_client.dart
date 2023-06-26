import 'package:dio/dio.dart';
import 'package:fruttyvice/fruits_response.dart';

class FruitsApiClient {
  final Dio _dio;

  FruitsApiClient(this._dio);

  Future<List<FruitsResponse>> getAllFruits() async {
    final response = await _dio.get('fruit/all');
    final json = response.data as List<dynamic>;
    final fruits = json.map(
      (fruit) => FruitsResponse.fromJson(fruit),
    );
    return fruits.toList();
  }

  Future<FruitsResponse> getFruit(String name) async {
    final response = await _dio.get('fruit/$name');
    final json = response.data;
    final fruit = FruitsResponse.fromJson(json);
    return fruit;
  }
}
