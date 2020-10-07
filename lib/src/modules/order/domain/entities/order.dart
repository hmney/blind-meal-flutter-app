import 'package:app/src/modules/maps/domain/entities/delivery_location.dart';
import 'package:app/src/modules/order/domain/entities/meal.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';
part 'order.g.dart';

@JsonSerializable()
class Order extends _Order with _$Order {
  String userId;

  @JsonKey(
      fromJson: _mealsFromJson,
      toJson: _mealsToJson,
      includeIfNull: true,
      nullable: true)
  List<Meal> mealsSuggested;

  @JsonKey(
    fromJson: _deliveryLocationFromJson,
    toJson: _deliveryLocationToJson,
    includeIfNull: true,
    nullable: true,
  )
  DeliveryLocation deliveryLocation;

  DateTime orderCreationTime;

  Order({
    this.userId,
    this.mealsSuggested,
    this.orderCreationTime,
    this.deliveryLocation,
    String userFeeling,
    double levelofHungriness,
    int mealBudget,
    BLIND_MEAL_EXPERIENCE blindMealExperience,
    Meal mealSelected,
    int mealsNumber,
  }) : super(
          userFeeling: userFeeling,
          levelofHungriness: levelofHungriness,
          mealBudget: mealBudget,
          blindMealExperience: blindMealExperience,
          mealSelected: mealSelected,
          mealsNumber: mealsNumber,
        );

  factory Order.createNewOrder(String userId) => Order(
        userId: userId,
        mealsSuggested: [],
        orderCreationTime: DateTime.now().toUtc(),
        userFeeling: '',
        levelofHungriness: 3,
        mealBudget: 0,
        deliveryLocation: null,
        blindMealExperience: BLIND_MEAL_EXPERIENCE.NONE,
        mealSelected: null,
        mealsNumber: 1,
      );

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);

  static List<Map> _mealsToJson(List<Meal> meals) =>
      meals?.map((meal) => meal.toJson())?.toList();
  static List<Meal> _mealsFromJson(jsonArray) =>
      jsonArray.map((json) => Meal.fromJson(json)).toList();

  static DeliveryLocation _deliveryLocationFromJson(json) =>
      DeliveryLocation.fromJson(json);

  static Map<String, dynamic> _deliveryLocationToJson(
          DeliveryLocation deliveryLocationDetails) =>
      deliveryLocationDetails.toJson();
}

abstract class _Order with Store {
  @observable
  String userFeeling;

  @observable
  double levelofHungriness;

  @action
  void setLevelofHungriness(double value) => levelofHungriness = value;

  @observable
  int mealBudget;

  @action
  void incBudget() => mealBudget++;

  @action
  void decBudget() => (mealBudget > 0) ? mealBudget-- : mealBudget;

  @observable
  BLIND_MEAL_EXPERIENCE blindMealExperience;

  @action
  void setBlindMealExperience(BLIND_MEAL_EXPERIENCE value) =>
      blindMealExperience = value;

  @observable
  @JsonKey(
      fromJson: _mealFromJson,
      toJson: _mealToJson,
      includeIfNull: true,
      nullable: true)
  Meal mealSelected;

  @action
  void setSelectedMeal(Meal value) => mealSelected = value;

  @observable
  int mealsNumber;

  @action
  void incMealsNumber() => mealsNumber++;

  @action
  void decMealsNumber() => mealsNumber - 1 > 0 ? mealsNumber-- : mealsNumber;

  _Order({
    this.userFeeling,
    this.levelofHungriness,
    this.mealBudget,
    this.blindMealExperience,
    this.mealSelected,
    this.mealsNumber,
  });

  static _mealFromJson(json) => Meal.fromJson(json);
  static _mealToJson(Meal meal) => meal?.toJson();
}

enum BLIND_MEAL_EXPERIENCE {
  NONE,
  COMPLETELY_BLIND,
  GET_SUGGESTIONS,
}
