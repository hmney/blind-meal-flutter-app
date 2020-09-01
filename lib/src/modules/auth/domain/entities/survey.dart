import 'package:json_annotation/json_annotation.dart';
part 'survey.g.dart';

@JsonSerializable()
class Survey {
  List<String> cuisineType;
  List<String> dietType;
  List<String> eatingHabits;
  List<String> ingredient;
  List<String> allergies;
  List<String> taste;
  int budget;
  double tasteDegree;
  double moodAndChoiceOfFood;
  Map<String, String> questions;

  Survey({
    this.cuisineType,
    this.dietType,
    this.eatingHabits,
    this.ingredient,
    this.allergies,
    this.taste,
    this.budget,
    this.tasteDegree,
    this.moodAndChoiceOfFood,
    this.questions,
  });

  Survey.empty() {
    cuisineType = [];
    dietType = [];
    eatingHabits = [];
    ingredient = [];
    allergies = [];
    taste = [];
    budget = 0;
    tasteDegree = 0;
    moodAndChoiceOfFood = 0;
  }

  factory Survey.createNewSurvey(
    List<String> cuisineType,
    List<String> dietType,
    String eatingHabits,
    List<String> ingredient,
    List<String> allergies,
    String taste,
    int budget,
    double tasteDegree,
    double moodAndChoiceOfFood,
  ) =>
      Survey(
        cuisineType: cuisineType,
        dietType: dietType,
        eatingHabits: [eatingHabits],
        ingredient: ingredient,
        allergies: allergies,
        taste: [taste],
        budget: budget,
        tasteDegree: tasteDegree,
        moodAndChoiceOfFood: moodAndChoiceOfFood,
      );

  factory Survey.fromJson(Map<String, dynamic> json) => _$SurveyFromJson(json);
  Map<String, dynamic> toJson() => _$SurveyToJson(this);

  List<String> getAnswers(String question) {
    switch (question) {
      case 'cuisineType':
        return this.cuisineType;
      case 'dietType':
        return this.dietType;
      case 'eatingHabits':
        return this.eatingHabits;
      case 'ingredient':
        return this.ingredient;
      case 'allergies':
        return this.allergies;
      case 'taste':
        return this.taste;
      default:
        return null;
    }
  }

  String toString() {
    return "cuisineType: ${this.cuisineType.toString()}, dietType: ${this.dietType.toString()}, eatingHabits: ${this.eatingHabits.toString()}, ingredient: ${this.ingredient.toString()}, allergies: ${this.allergies.toString()}, taste: ${this.taste.toString()}, tasteDegree: ${tasteDegree.toString()}, moodAndChoiceOfFood: ${moodAndChoiceOfFood.toString()}, questions: ${this.questions.toString()}";
  }
}
