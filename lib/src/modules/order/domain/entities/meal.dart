import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'meal.g.dart';

@JsonSerializable()
class Meal extends Equatable {
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

  @override
  List<Object> get props => [id, name, ingredients, description, image, price];
  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);

  Map<String, dynamic> toJson() => _$MealToJson(this);

  @override
  bool get stringify => true;
}
