// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) {
  return Order(
    orderId: json['orderId'] as String,
    userId: json['userId'] as String,
    feeling: json['feeling'] as String,
    hungrinessLevel: (json['hungrinessLevel'] as num)?.toDouble(),
    mealBudget: json['mealBudget'] as int,
    experienceType: json['experienceType'] as String,
  );
}

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'orderId': instance.orderId,
      'userId': instance.userId,
      'feeling': instance.feeling,
      'hungrinessLevel': instance.hungrinessLevel,
      'mealBudget': instance.mealBudget,
      'experienceType': instance.experienceType,
    };
