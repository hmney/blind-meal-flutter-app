import 'package:app/src/modules/auth/presentation/controller.dart';
import 'package:app/src/modules/order/domain/entities/meal.dart';
import 'package:app/src/modules/order/domain/entities/order.dart';
import 'package:app/src/modules/order/domain/repository/order_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'controller.g.dart';

class OrderController = _OrderController with _$OrderController;

abstract class _OrderController with Store {
  final authController = Modular.get<AuthController>();
  final orderRepository = Modular.get<OrderRepository>();
  final pageController = PageController();
  final formKey = GlobalKey<FormState>();

  @observable
  TextEditingController deliveryLocationAddress = TextEditingController();

  @action
  void setDeliveryLocationAddress(String value) =>
      deliveryLocationAddress.text = value;

  _OrderController() {
    initializeOrder();
  }

  @observable
  int pageIndex = 0;

  @action
  void onChangePageIndex(int index) {
    pageIndex = index;
  }

  Order order;

  void initializeOrder() {
    order = Order.createNewOrder(authController.currentUser.id);
  }

  void createNewOrderToFirebase() async {
    await orderRepository.createNewOrder(order);
  }

  Future<List<Meal>> getRecommendedMeals() async {
    return await orderRepository.getRecommendedMeals(order);
  }
}
