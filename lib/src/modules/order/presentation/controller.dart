import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'controller.g.dart';

class OrderController = _OrderController with _$OrderController;

abstract class _OrderController with Store {
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
}
