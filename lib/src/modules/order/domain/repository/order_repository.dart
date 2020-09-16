import 'package:app/src/modules/order/domain/entities/meal.dart';
import 'package:app/src/modules/order/domain/entities/order.dart';

abstract class OrderRepository {
  Future<void> createNewOrder(Order order);
  Future<List<Meal>> getRecommendedMeals(Order order);
}
