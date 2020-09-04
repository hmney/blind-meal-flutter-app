// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OrderController on _OrderController, Store {
  final _$pageIndexAtom = Atom(name: '_OrderController.pageIndex');

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

  final _$budgetAtom = Atom(name: '_OrderController.budget');

  @override
  int get budget {
    _$budgetAtom.reportRead();
    return super.budget;
  }

  @override
  set budget(int value) {
    _$budgetAtom.reportWrite(value, super.budget, () {
      super.budget = value;
    });
  }

  final _$levelofHungrinessAtom =
      Atom(name: '_OrderController.levelofHungriness');

  @override
  double get levelofHungriness {
    _$levelofHungrinessAtom.reportRead();
    return super.levelofHungriness;
  }

  @override
  set levelofHungriness(double value) {
    _$levelofHungrinessAtom.reportWrite(value, super.levelofHungriness, () {
      super.levelofHungriness = value;
    });
  }

  final _$blindMealExperienceAtom =
      Atom(name: '_OrderController.blindMealExperience');

  @override
  BLIND_MEAL_EXPERIENCE get blindMealExperience {
    _$blindMealExperienceAtom.reportRead();
    return super.blindMealExperience;
  }

  @override
  set blindMealExperience(BLIND_MEAL_EXPERIENCE value) {
    _$blindMealExperienceAtom.reportWrite(value, super.blindMealExperience, () {
      super.blindMealExperience = value;
    });
  }

  final _$mealSelectedAtom = Atom(name: '_OrderController.mealSelected');

  @override
  String get mealSelected {
    _$mealSelectedAtom.reportRead();
    return super.mealSelected;
  }

  @override
  set mealSelected(String value) {
    _$mealSelectedAtom.reportWrite(value, super.mealSelected, () {
      super.mealSelected = value;
    });
  }

  final _$_OrderControllerActionController =
      ActionController(name: '_OrderController');

  @override
  void onChangePageIndex(int index) {
    final _$actionInfo = _$_OrderControllerActionController.startAction(
        name: '_OrderController.onChangePageIndex');
    try {
      return super.onChangePageIndex(index);
    } finally {
      _$_OrderControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void incBudget() {
    final _$actionInfo = _$_OrderControllerActionController.startAction(
        name: '_OrderController.incBudget');
    try {
      return super.incBudget();
    } finally {
      _$_OrderControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decBudget() {
    final _$actionInfo = _$_OrderControllerActionController.startAction(
        name: '_OrderController.decBudget');
    try {
      return super.decBudget();
    } finally {
      _$_OrderControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLevelofHungriness(double value) {
    final _$actionInfo = _$_OrderControllerActionController.startAction(
        name: '_OrderController.setLevelofHungriness');
    try {
      return super.setLevelofHungriness(value);
    } finally {
      _$_OrderControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBlindMealExperience(BLIND_MEAL_EXPERIENCE value) {
    final _$actionInfo = _$_OrderControllerActionController.startAction(
        name: '_OrderController.setBlindMealExperience');
    try {
      return super.setBlindMealExperience(value);
    } finally {
      _$_OrderControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMealSelected(String value) {
    final _$actionInfo = _$_OrderControllerActionController.startAction(
        name: '_OrderController.setMealSelected');
    try {
      return super.setMealSelected(value);
    } finally {
      _$_OrderControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pageIndex: ${pageIndex},
budget: ${budget},
levelofHungriness: ${levelofHungriness},
blindMealExperience: ${blindMealExperience},
mealSelected: ${mealSelected}
    ''';
  }
}
