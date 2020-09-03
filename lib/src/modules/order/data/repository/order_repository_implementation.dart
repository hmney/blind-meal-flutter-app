import 'package:app/src/modules/order/domain/entities/order.dart';
import 'package:app/src/modules/order/domain/repository/order_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrderRepositoryImplementation extends OrderRepository {
  final firestore = Firestore.instance;
  final analytics = Modular.get<FirebaseAnalytics>();
  CollectionReference get _orderCollection => firestore.collection('orders');

  @override
  Future<void> createNewOrder(Order order) async {
    order.orderId = _orderCollection.document().documentID;
    await _orderCollection.document(order.orderId).setData(order.toJson());
  }
}
