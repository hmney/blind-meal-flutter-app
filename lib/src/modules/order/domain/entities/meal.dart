import 'package:json_annotation/json_annotation.dart';

part 'meal.g.dart';

@JsonSerializable()
class Meal {
  @JsonKey(name: 'uid')
  final String id;
  @JsonKey(name: 'title')
  final String name;
  @JsonKey(name: 'components')
  final List<String> ingredients;
  final String description;
  final String image;
  @JsonKey(name: 'original_price')
  final double price;

  Meal({
    this.id,
    this.name,
    this.ingredients,
    this.description,
    this.image,
    this.price,
  });

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);

  Map<String, dynamic> toJson() => _$MealToJson(this);
}
