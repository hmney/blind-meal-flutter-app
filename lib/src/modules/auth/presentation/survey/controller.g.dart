// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SurveyController on _SurveyController, Store {
  Computed<bool> _$selectionAllergiesVisiblityComputed;

  @override
  bool get selectionAllergiesVisiblity =>
      (_$selectionAllergiesVisiblityComputed ??= Computed<bool>(
              () => super.selectionAllergiesVisiblity,
              name: '_SurveyController.selectionAllergiesVisiblity'))
          .value;

  final _$pageIndexAtom = Atom(name: '_SurveyController.pageIndex');

  @override
  int get pageIndex {
    _$pageIndexAtom.reportRead();
    return super.pageIndex;
  }

  @override
  set pageIndex(int value) {
    _$pageIndexAtom.reportWrite(value, super.pageIndex, () {
      super.pageIndex = value;
    });
  }

  final _$cuisineTypeAtom = Atom(name: '_SurveyController.cuisineType');

  @override
  ObservableList<String> get cuisineType {
    _$cuisineTypeAtom.reportRead();
    return super.cuisineType;
  }

  @override
  set cuisineType(ObservableList<String> value) {
    _$cuisineTypeAtom.reportWrite(value, super.cuisineType, () {
      super.cuisineType = value;
    });
  }

  final _$dietTypeAtom = Atom(name: '_SurveyController.dietType');

  @override
  ObservableList<String> get dietType {
    _$dietTypeAtom.reportRead();
    return super.dietType;
  }

  @override
  set dietType(ObservableList<String> value) {
    _$dietTypeAtom.reportWrite(value, super.dietType, () {
      super.dietType = value;
    });
  }

  final _$eatingHabitsAtom = Atom(name: '_SurveyController.eatingHabits');

  @override
  String get eatingHabits {
    _$eatingHabitsAtom.reportRead();
    return super.eatingHabits;
  }

  @override
  set eatingHabits(String value) {
    _$eatingHabitsAtom.reportWrite(value, super.eatingHabits, () {
      super.eatingHabits = value;
    });
  }

  final _$ingredientLikedAtom = Atom(name: '_SurveyController.ingredientLiked');

  @override
  ObservableList<String> get ingredientLiked {
    _$ingredientLikedAtom.reportRead();
    return super.ingredientLiked;
  }

  @override
  set ingredientLiked(ObservableList<String> value) {
    _$ingredientLikedAtom.reportWrite(value, super.ingredientLiked, () {
      super.ingredientLiked = value;
    });
  }

  final _$ingredientDislikedAtom =
      Atom(name: '_SurveyController.ingredientDisliked');

  @override
  ObservableList<String> get ingredientDisliked {
    _$ingredientDislikedAtom.reportRead();
    return super.ingredientDisliked;
  }

  @override
  set ingredientDisliked(ObservableList<String> value) {
    _$ingredientDislikedAtom.reportWrite(value, super.ingredientDisliked, () {
      super.ingredientDisliked = value;
    });
  }

  final _$checkAllergyAtom = Atom(name: '_SurveyController.checkAllergy');

  @override
  String get checkAllergy {
    _$checkAllergyAtom.reportRead();
    return super.checkAllergy;
  }

  @override
  set checkAllergy(String value) {
    _$checkAllergyAtom.reportWrite(value, super.checkAllergy, () {
      super.checkAllergy = value;
    });
  }

  final _$allergiesAtom = Atom(name: '_SurveyController.allergies');

  @override
  ObservableList<String> get allergies {
    _$allergiesAtom.reportRead();
    return super.allergies;
  }

  @override
  set allergies(ObservableList<String> value) {
    _$allergiesAtom.reportWrite(value, super.allergies, () {
      super.allergies = value;
    });
  }

  final _$tasteAtom = Atom(name: '_SurveyController.taste');

  @override
  String get taste {
    _$tasteAtom.reportRead();
    return super.taste;
  }

  @override
  set taste(String value) {
    _$tasteAtom.reportWrite(value, super.taste, () {
      super.taste = value;
    });
  }

  final _$tasteDegreeAtom = Atom(name: '_SurveyController.tasteDegree');

  @override
  double get tasteDegree {
    _$tasteDegreeAtom.reportRead();
    return super.tasteDegree;
  }

  @override
  set tasteDegree(double value) {
    _$tasteDegreeAtom.reportWrite(value, super.tasteDegree, () {
      super.tasteDegree = value;
    });
  }

  final _$moodAndChoiceOfFoodAtom =
      Atom(name: '_SurveyController.moodAndChoiceOfFood');

  @override
  double get moodAndChoiceOfFood {
    _$moodAndChoiceOfFoodAtom.reportRead();
    return super.moodAndChoiceOfFood;
  }

  @override
  set moodAndChoiceOfFood(double value) {
    _$moodAndChoiceOfFoodAtom.reportWrite(value, super.moodAndChoiceOfFood, () {
      super.moodAndChoiceOfFood = value;
    });
  }

  final _$_SurveyControllerActionController =
      ActionController(name: '_SurveyController');

  @override
  void onChangePageIndex(int index) {
    final _$actionInfo = _$_SurveyControllerActionController.startAction(
        name: '_SurveyController.onChangePageIndex');
    try {
      return super.onChangePageIndex(index);
    } finally {
      _$_SurveyControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectCuisineType(String value) {
    final _$actionInfo = _$_SurveyControllerActionController.startAction(
        name: '_SurveyController.selectCuisineType');
    try {
      return super.selectCuisineType(value);
    } finally {
      _$_SurveyControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectDietType(String value) {
    final _$actionInfo = _$_SurveyControllerActionController.startAction(
        name: '_SurveyController.selectDietType');
    try {
      return super.selectDietType(value);
    } finally {
      _$_SurveyControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectEatingHabits(String value) {
    final _$actionInfo = _$_SurveyControllerActionController.startAction(
        name: '_SurveyController.selectEatingHabits');
    try {
      return super.selectEatingHabits(value);
    } finally {
      _$_SurveyControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectIngredientLiked(bool selected, String value) {
    final _$actionInfo = _$_SurveyControllerActionController.startAction(
        name: '_SurveyController.selectIngredientLiked');
    try {
      return super.selectIngredientLiked(selected, value);
    } finally {
      _$_SurveyControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectIngredientDisliked(bool selected, String value) {
    final _$actionInfo = _$_SurveyControllerActionController.startAction(
        name: '_SurveyController.selectIngredientDisliked');
    try {
      return super.selectIngredientDisliked(selected, value);
    } finally {
      _$_SurveyControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAllergy(String value) {
    final _$actionInfo = _$_SurveyControllerActionController.startAction(
        name: '_SurveyController.setAllergy');
    try {
      return super.setAllergy(value);
    } finally {
      _$_SurveyControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectAllergies(bool selected, String value) {
    final _$actionInfo = _$_SurveyControllerActionController.startAction(
        name: '_SurveyController.selectAllergies');
    try {
      return super.selectAllergies(selected, value);
    } finally {
      _$_SurveyControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectTaste(String value) {
    final _$actionInfo = _$_SurveyControllerActionController.startAction(
        name: '_SurveyController.selectTaste');
    try {
      return super.selectTaste(value);
    } finally {
      _$_SurveyControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTasteDegree(double value) {
    final _$actionInfo = _$_SurveyControllerActionController.startAction(
        name: '_SurveyController.setTasteDegree');
    try {
      return super.setTasteDegree(value);
    } finally {
      _$_SurveyControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMoodAndChoiceOfFood(double value) {
    final _$actionInfo = _$_SurveyControllerActionController.startAction(
        name: '_SurveyController.setMoodAndChoiceOfFood');
    try {
      return super.setMoodAndChoiceOfFood(value);
    } finally {
      _$_SurveyControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pageIndex: ${pageIndex},
cuisineType: ${cuisineType},
dietType: ${dietType},
eatingHabits: ${eatingHabits},
ingredientLiked: ${ingredientLiked},
ingredientDisliked: ${ingredientDisliked},
checkAllergy: ${checkAllergy},
allergies: ${allergies},
taste: ${taste},
tasteDegree: ${tasteDegree},
moodAndChoiceOfFood: ${moodAndChoiceOfFood},
selectionAllergiesVisiblity: ${selectionAllergiesVisiblity}
    ''';
  }
}
