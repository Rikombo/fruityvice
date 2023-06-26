import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fruits_response.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: false)
class FruitsResponse extends Equatable {
  final String name;
  final String family;
  final String order;
  final String genus;
  final int id;

  // @JsonKey('media_type')
  // final String mediaType;

  const FruitsResponse({
    required this.name,
    required this.family,
    required this.order,
    required this.genus,
    required this.id,
  });

  factory FruitsResponse.fromJson(Map<String, dynamic> json) =>
      _$FruitsResponseFromJson(json);

  @override
  List<Object?> get props => [
        name,
        family,
        order,
        genus,
        id,
      ];
}

@JsonSerializable(explicitToJson: true, createToJson: false)
class FruitNutritionsResponse extends Equatable {
  final int calories;
  final double fat;
  final double sugar;
  final double carbohydrates;
  final double protein;
  final FruitNutritionsResponse nutritions;

  const FruitNutritionsResponse({
    required this.calories,
    required this.fat,
    required this.sugar,
    required this.carbohydrates,
    required this.protein,
    required this.nutritions,
  });

  factory FruitNutritionsResponse.fromJson(Map<String, dynamic> json) =>
      _$FruitNutritionsResponseFromJson(json);

  @override
  List<Object?> get props => [
        calories,
        fat,
        sugar,
        carbohydrates,
        protein,
        nutritions,
      ];
}
