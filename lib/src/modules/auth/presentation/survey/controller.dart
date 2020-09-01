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
      'ingredient',
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
  ObservableList<String> ingredient = ObservableList();

  @action
  void selectIngredient(bool selected, String value) {
    if (selected)
      ingredient.add(value);
    else
      ingredient.remove(value);
  }

  bool checkIfIngredientIsSelected() {
    return ingredient.length != 0;
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

  @observable
  int budget = 0;

  @action
  void incBudget() => budget++;

  @action
  void decBudget() => (budget > 0) ? budget-- : budget;

  void createNewSurveyToFirebase() async {
    var currentUser = await authRepository.getCurrentUser();
    var survey = Survey.createNewSurvey(
      cuisineType,
      dietType,
      eatingHabits,
      ingredient,
      allergies,
      taste,
      budget,
      tasteDegree,
      moodAndChoiceOfFood,
    );
    await userRepository.createNewSurveyToFirebase(currentUser.uid, survey);
  }
}
