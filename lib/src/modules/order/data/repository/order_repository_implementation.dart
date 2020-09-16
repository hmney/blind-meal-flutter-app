import 'dart:convert';

import 'package:app/src/modules/order/domain/entities/meal.dart';
import 'package:app/src/modules/order/domain/entities/order.dart';
import 'package:app/src/modules/order/domain/repository/order_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrderRepositoryImplementation extends OrderRepository {
  final firestore = Firestore.instance;
  final analytics = Modular.get<FirebaseAnalytics>();
  CollectionReference get _orderCollection => firestore.collection('orders');
  final url = 'http://51.210.249.13/query';
  final dio = Dio();
  @override
  Future<void> createNewOrder(Order order) async {
    order.orderId = _orderCollection.document().documentID;
    await _orderCollection.document(order.orderId).setData(order.toJson());
  }

  @override
  Future<List<Meal>> getRecommendedMeals(Order order) async {
    try {
      final response = await dio.post(
        url,
        data: order.toJson(),
      );
      if (response.statusCode == 200) {
        return [for (var element in response.data) Meal.fromJson(element)];
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
