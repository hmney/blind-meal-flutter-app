import 'package:json_annotation/json_annotation.dart';
part 'survey.g.dart';

@JsonSerializable()
class Survey {
  List<String> cuisineType;
  List<String> dietType;
  List<String> eatingHabits;
  List<String> ingredientLiked;
  List<String> ingredientDisliked;
  List<String> allergies;
  List<String> taste;
  double tasteDegree;
  double moodAndChoiceOfFood;
  Map<String, String> questions;

  Survey({
    this.cuisineType,
    this.dietType,
    this.eatingHabits,
    this.ingredientLiked,
    this.ingredientDisliked,
    this.allergies,
    this.taste,
    this.tasteDegree,
    this.moodAndChoiceOfFood,
    this.questions,
  });

  Survey.empty() {
    cuisineType = [];
    dietType = [];
    eatingHabits = [];
    ingredientLiked = [];
    ingredientDisliked = [];
    allergies = [];
    taste = [];
    tasteDegree = 0;
    moodAndChoiceOfFood = 0;
  }

  factory Survey.createNewSurvey(
    List<String> cuisineType,
    List<String> dietType,
    String eatingHabits,
    List<String> ingredientLiked,
    List<String> ingredientDisliked,
    List<String> allergies,
    String taste,
    double tasteDegree,
    double moodAndChoiceOfFood,
  ) =>
      Survey(
        cuisineType: cuisineType,
        dietType: dietType,
        eatingHabits: [eatingHabits],
        ingredientLiked: ingredientLiked,
        ingredientDisliked: ingredientDisliked,
        allergies: allergies,
        taste: [taste],
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
      case 'ingredientLiked':
        return this.ingredientDisliked;
      case 'ingredientDisliked':
        return this.ingredientDisliked;
      case 'allergies':
        return this.allergies;
      case 'taste':
        return this.taste;
      default:
        return null;
    }
  }

  String toString() {
    return "cuisineType: ${this.cuisineType.toString()}, dietType: ${this.dietType.toString()}, eatingHabits: ${this.eatingHabits.toString()}, ingredientLiked: ${this.ingredientLiked.toString()}, ingredientDisliked: ${this.ingredientDisliked.toString()}, allergies: ${this.allergies.toString()}, taste: ${this.taste.toString()}, tasteDegree: ${tasteDegree.toString()}, moodAndChoiceOfFood: ${moodAndChoiceOfFood.toString()}, questions: ${this.questions.toString()}";
  }
}
