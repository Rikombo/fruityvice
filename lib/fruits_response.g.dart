// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fruits_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FruitsResponse _$FruitsResponseFromJson(Map<String, dynamic> json) =>
    FruitsResponse(
      name: json['name'] as String,
      family: json['family'] as String,
      order: json['order'] as String,
      genus: json['genus'] as String,
      id: json['id'] as int,
    );

FruitNutritionsResponse _$FruitNutritionsResponseFromJson(
        Map<String, dynamic> json) =>
    FruitNutritionsResponse(
      calories: json['calories'] as int,
      fat: (json['fat'] as num).toDouble(),
      sugar: (json['sugar'] as num).toDouble(),
      carbohydrates: (json['carbohydrates'] as num).toDouble(),
      protein: (json['protein'] as num).toDouble(),
      nutritions: FruitNutritionsResponse.fromJson(
          json['nutritions'] as Map<String, dynamic>),
    );
