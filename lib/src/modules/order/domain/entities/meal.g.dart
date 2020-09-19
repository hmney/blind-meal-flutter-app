// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meal _$MealFromJson(Map<String, dynamic> json) {
  return Meal(
    id: json['uid'] as String,
    name: json['title'] as String,
    ingredients:
        (json['components'] as List)?.map((e) => e as String)?.toList(),
    description: json['description'] as String,
    image: json['image'] as String,
    price: (json['original_price'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$MealToJson(Meal instance) => <String, dynamic>{
      'uid': instance.id,
      'title': instance.name,
      'components': instance.ingredients,
      'description': instance.description,
      'image': instance.image,
      'original_price': instance.price,
    };
