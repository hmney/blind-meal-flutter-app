import 'package:app/src/modules/order/domain/entities/order.dart';

abstract class OrderRepository {
  Future<void> createNewOrder(Order order);
}
