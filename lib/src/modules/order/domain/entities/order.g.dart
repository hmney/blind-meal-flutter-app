// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) {
  return Order(
    userId: json['userId'] as String,
    mealsSuggested: Order._mealsFromJson(json['mealsSuggested']),
    orderCreationTime: json['orderCreationTime'] == null
        ? null
        : DateTime.parse(json['orderCreationTime'] as String),
    deliveryLocation: Order._deliveryLocationFromJson(json['deliveryLocation']),
    userFeeling: json['userFeeling'] as String,
    levelofHungriness: (json['levelofHungriness'] as num)?.toDouble(),
    mealBudget: json['mealBudget'] as int,
    blindMealExperience: _$enumDecodeNullable(
        _$BLIND_MEAL_EXPERIENCEEnumMap, json['blindMealExperience']),
    mealSelected: _Order._mealFromJson(json['mealSelected']),
    mealsNumber: json['mealsNumber'] as int,
  );
}

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'userFeeling': instance.userFeeling,
      'levelofHungriness': instance.levelofHungriness,
      'mealBudget': instance.mealBudget,
      'blindMealExperience':
          _$BLIND_MEAL_EXPERIENCEEnumMap[instance.blindMealExperience],
      'mealSelected': _Order._mealToJson(instance.mealSelected),
      'mealsNumber': instance.mealsNumber,
      'userId': instance.userId,
      'mealsSuggested': Order._mealsToJson(instance.mealsSuggested),
      'deliveryLocation':
          Order._deliveryLocationToJson(instance.deliveryLocation),
      'orderCreationTime': instance.orderCreationTime?.toIso8601String(),
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$BLIND_MEAL_EXPERIENCEEnumMap = {
  BLIND_MEAL_EXPERIENCE.NONE: 'NONE',
  BLIND_MEAL_EXPERIENCE.COMPLETELY_BLIND: 'COMPLETELY_BLIND',
  BLIND_MEAL_EXPERIENCE.GET_SUGGESTIONS: 'GET_SUGGESTIONS',
};

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Order on _Order, Store {
  final _$userFeelingAtom = Atom(name: '_Order.userFeeling');

  @override
  String get userFeeling {
    _$userFeelingAtom.reportRead();
    return super.userFeeling;
  }

  @override
  set userFeeling(String value) {
    _$userFeelingAtom.reportWrite(value, super.userFeeling, () {
      super.userFeeling = value;
    });
  }

  final _$levelofHungrinessAtom = Atom(name: '_Order.levelofHungriness');

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

  final _$mealBudgetAtom = Atom(name: '_Order.mealBudget');

  @override
  int get mealBudget {
    _$mealBudgetAtom.reportRead();
    return super.mealBudget;
  }

  @override
  set mealBudget(int value) {
    _$mealBudgetAtom.reportWrite(value, super.mealBudget, () {
      super.mealBudget = value;
    });
  }

  final _$blindMealExperienceAtom = Atom(name: '_Order.blindMealExperience');

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

  final _$mealSelectedAtom = Atom(name: '_Order.mealSelected');

  @override
  Meal get mealSelected {
    _$mealSelectedAtom.reportRead();
    return super.mealSelected;
  }

  @override
  set mealSelected(Meal value) {
    _$mealSelectedAtom.reportWrite(value, super.mealSelected, () {
      super.mealSelected = value;
    });
  }

  final _$mealsNumberAtom = Atom(name: '_Order.mealsNumber');

  @override
  int get mealsNumber {
    _$mealsNumberAtom.reportRead();
    return super.mealsNumber;
  }

  @override
  set mealsNumber(int value) {
    _$mealsNumberAtom.reportWrite(value, super.mealsNumber, () {
      super.mealsNumber = value;
    });
  }

  final _$_OrderActionController = ActionController(name: '_Order');

  @override
  void setLevelofHungriness(double value) {
    final _$actionInfo = _$_OrderActionController.startAction(
        name: '_Order.setLevelofHungriness');
    try {
      return super.setLevelofHungriness(value);
    } finally {
      _$_OrderActionController.endAction(_$actionInfo);
    }
  }

  @override
  void incBudget() {
    final _$actionInfo =
        _$_OrderActionController.startAction(name: '_Order.incBudget');
    try {
      return super.incBudget();
    } finally {
      _$_OrderActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decBudget() {
    final _$actionInfo =
        _$_OrderActionController.startAction(name: '_Order.decBudget');
    try {
      return super.decBudget();
    } finally {
      _$_OrderActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBlindMealExperience(BLIND_MEAL_EXPERIENCE value) {
    final _$actionInfo = _$_OrderActionController.startAction(
        name: '_Order.setBlindMealExperience');
    try {
      return super.setBlindMealExperience(value);
    } finally {
      _$_OrderActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedMeal(Meal value) {
    final _$actionInfo =
        _$_OrderActionController.startAction(name: '_Order.setSelectedMeal');
    try {
      return super.setSelectedMeal(value);
    } finally {
      _$_OrderActionController.endAction(_$actionInfo);
    }
  }

  @override
  void incMealsNumber() {
    final _$actionInfo =
        _$_OrderActionController.startAction(name: '_Order.incMealsNumber');
    try {
      return super.incMealsNumber();
    } finally {
      _$_OrderActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decMealsNumber() {
    final _$actionInfo =
        _$_OrderActionController.startAction(name: '_Order.decMealsNumber');
    try {
      return super.decMealsNumber();
    } finally {
      _$_OrderActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userFeeling: ${userFeeling},
levelofHungriness: ${levelofHungriness},
mealBudget: ${mealBudget},
blindMealExperience: ${blindMealExperience},
mealSelected: ${mealSelected},
mealsNumber: ${mealsNumber}
    ''';
  }
}
