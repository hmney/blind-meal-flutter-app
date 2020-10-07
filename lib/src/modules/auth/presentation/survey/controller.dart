import 'package:app/src/modules/auth/domain/entities/survey.dart';
import 'package:app/src/modules/auth/domain/repository/auth_repository.dart';
import 'package:app/src/modules/auth/domain/repository/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class SurveyController = _SurveyController with _$SurveyController;

abstract class _SurveyController with Store {
  final userRepository = Modular.get<UserRepository>();
  final authRepository = Modular.get<AuthRepository>();
  PageController pageController = PageController();
  Survey surveyQuestions;
  int maxPageIndex;
  _SurveyController() {
    init();
  }

  void init() async {
    surveyQuestions = Survey.fromJson(
        (await Firestore.instance.collection('survey').getDocuments())
            .documents[0]
            .data);
    maxPageIndex = surveyQuestions.questions.length;
    surveyQuestions.questions = sortQuestionsMap(surveyQuestions.questions);
  }

  Map<String, String> sortQuestionsMap(Map<String, String> map) {
    List<String> questionsOrder = [
      'cuisineType',
      'dietType',
      'eatingHabits',
      'ingredientLiked',
      'ingredientDisliked',
      'allergies',
      'taste',
      'budget',
    ];
    return Map.fromIterable(
      questionsOrder,
      key: (element) => element,
      value: (element) => map[element],
    );
  }

  @observable
  int pageIndex = 0;

  @action
  void onChangePageIndex(int index) {
    pageIndex = index;
  }

  Survey surveyAnswers = Survey.empty();

  @observable
  ObservableList<String> cuisineType = ObservableList();

  @action
  void selectCuisineType(String value) {
    if (cuisineType.contains(value))
      cuisineType.remove(value);
    else
      cuisineType.add(value);
  }

  bool checkIfCuisineTypeIsSelected() {
    return cuisineType.length != 0;
  }

  @observable
  ObservableList<String> dietType = ObservableList();

  @action
  void selectDietType(String value) {
    if (dietType.contains(value))
      dietType.remove(value);
    else
      dietType.add(value);
  }

  bool checkIfDietTypeIsSelected() {
    return dietType.length != 0;
  }

  @observable
  String eatingHabits;

  @action
  void selectEatingHabits(String value) {
    eatingHabits = value;
  }

  bool checkIfEatingHabitsIsSelected() {
    return eatingHabits != null && eatingHabits.isNotEmpty;
  }

  @observable
  ObservableList<String> ingredientLiked = ObservableList();

  @action
  void selectIngredientLiked(bool selected, String value) {
    if (selected)
      ingredientLiked.add(value);
    else
      ingredientLiked.remove(value);
  }

  bool checkIfIngredientLikedIsSelected() {
    return ingredientLiked.length != 0;
  }

  @observable
  ObservableList<String> ingredientDisliked = ObservableList();

  @action
  void selectIngredientDisliked(bool selected, String value) {
    if (selected)
      ingredientDisliked.add(value);
    else
      ingredientDisliked.remove(value);
  }

  bool checkIfIngredientDislikedIsSelected() {
    return ingredientDisliked.length != 0;
  }

  @observable
  String checkAllergy = 'No';

  @action
  void setAllergy(String value) => checkAllergy = value;

  @computed
  bool get selectionAllergiesVisiblity => (checkAllergy == 'No') ? false : true;

  @observable
  ObservableList<String> allergies = ObservableList();

  @action
  void selectAllergies(bool selected, String value) {
    if (selected)
      allergies.add(value);
    else
      allergies.remove(value);
  }

  bool checkIfAllergiesIsSelected() {
    return checkAllergy == 'No' ||
        (checkAllergy != 'No' && allergies.length != 0);
  }

  @observable
  String taste = 'Sweet';

  @action
  void selectTaste(String value) {
    taste = value;
    tasteDegree = 2.5;
  }

  @observable
  double tasteDegree = 2.5;

  @action
  void setTasteDegree(double value) => tasteDegree = value;

  @observable
  double moodAndChoiceOfFood = 2.5;

  @action
  void setMoodAndChoiceOfFood(double value) => moodAndChoiceOfFood = value;

  void createNewSurveyToFirebase() async {
    var currentUser = await authRepository.getCurrentUser();
    var survey = Survey.createNewSurvey(
      cuisineType,
      dietType,
      eatingHabits,
      ingredientLiked,
      ingredientDisliked,
      allergies,
      taste,
      tasteDegree / 5,
      moodAndChoiceOfFood / 5,
    );
    await userRepository.createNewSurveyForUserInFirebase(
        currentUser.uid, survey);
  }
}
