// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Survey _$SurveyFromJson(Map<String, dynamic> json) {
  return Survey(
    cuisineType:
        (json['cuisineType'] as List)?.map((e) => e as String)?.toList(),
    dietType: (json['dietType'] as List)?.map((e) => e as String)?.toList(),
    eatingHabits:
        (json['eatingHabits'] as List)?.map((e) => e as String)?.toList(),
    ingredient: (json['ingredient'] as List)?.map((e) => e as String)?.toList(),
    allergies: (json['allergies'] as List)?.map((e) => e as String)?.toList(),
    taste: (json['taste'] as List)?.map((e) => e as String)?.toList(),
    budget: json['budget'] as int,
    tasteDegree: (json['tasteDegree'] as num)?.toDouble(),
    moodAndChoiceOfFood: (json['moodAndChoiceOfFood'] as num)?.toDouble(),
    questions: (json['questions'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$SurveyToJson(Survey instance) => <String, dynamic>{
      'cuisineType': instance.cuisineType,
      'dietType': instance.dietType,
      'eatingHabits': instance.eatingHabits,
      'ingredient': instance.ingredient,
      'allergies': instance.allergies,
      'taste': instance.taste,
      'budget': instance.budget,
      'tasteDegree': instance.tasteDegree,
      'moodAndChoiceOfFood': instance.moodAndChoiceOfFood,
      'questions': instance.questions,
    };