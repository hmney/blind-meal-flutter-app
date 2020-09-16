import 'package:app/src/modules/auth/domain/repository/auth_repository.dart';
import 'package:app/src/modules/order/domain/entities/meal.dart';
import 'package:app/src/modules/order/domain/entities/order.dart';
import 'package:app/src/modules/order/domain/repository/order_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'controller.g.dart';

class OrderController = _OrderController with _$OrderController;

abstract class _OrderController with Store {
  final authRepository = Modular.get<AuthRepository>();
  final orderRepository = Modular.get<OrderRepository>();
  final pageController = PageController();
  final feelingTextController = TextEditingController();
  @observable
  int pageIndex = 0;

  @action
  void onChangePageIndex(int index) {
    pageIndex = index;
  }

  @observable
  int budget = 0;

  @action
  void incBudget() => budget++;

  @action
  void decBudget() => (budget > 0) ? budget-- : budget;

  @observable
  double levelofHungriness = 2;

  @action
  void setLevelofHungriness(double value) => levelofHungriness = value;

  @observable
  BLIND_MEAL_EXPERIENCE blindMealExperience = BLIND_MEAL_EXPERIENCE.NONE;

  @action
  void setBlindMealExperience(BLIND_MEAL_EXPERIENCE value) =>
      blindMealExperience = value;

  void createNewOrderToFirebase() async {
    var currentUser = await authRepository.getCurrentUser();
    var order = Order.createNewOrder(
      '',
      currentUser.uid,
      feelingTextController.text,
      levelofHungriness / 5,
      budget,
      blindMealExperience == BLIND_MEAL_EXPERIENCE.COMPLETELY_BLIND
          ? 'COMPLETELY BLIND'
          : 'GET SUGGESTIONS',
    );
    await orderRepository.createNewOrder(order);
  }

  @observable
  Meal mealSelected;

  @action
  void setMealSelected(Meal value) => mealSelected = value;

  @observable
  ObservableList<Meal> meals = ObservableList<Meal>();

  Future<List<Meal>> getRecommendedMeals() async {
    var currentUser = await authRepository.getCurrentUser();
    var order = Order.createNewOrder(
      '',
      currentUser.uid,
      feelingTextController.text,
      levelofHungriness / 5,
      budget,
      blindMealExperience == BLIND_MEAL_EXPERIENCE.COMPLETELY_BLIND
          ? 'COMPLETELY_BLIND'
          : 'GET_SUGGESTIONS',
    );
    return await orderRepository.getRecommendedMeals(order);
  }

  @observable
  int mealsNumber = 1;

  @action
  void incMealsNumber() => mealsNumber++;

  @action
  void decMealsNumber() => mealsNumber - 1 > 0 ? mealsNumber-- : mealsNumber;
}

enum BLIND_MEAL_EXPERIENCE {
  NONE,
  COMPLETELY_BLIND,
  GET_SUGGESTIONS,
}
