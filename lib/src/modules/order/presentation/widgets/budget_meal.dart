import 'dart:async';
import 'dart:math';
import 'package:app/src/core/styles.dart';
import 'package:app/src/modules/order/presentation/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BudgetofMeal extends StatefulWidget {
  @override
  _BudgetofMealState createState() => _BudgetofMealState();
}

class _BudgetofMealState extends State<BudgetofMeal> {
  final controller = Modular.get<OrderController>();
  Timer _timer1;
  Timer _timer2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => controller.order.incBudget(),
          onTapDown: (TapDownDetails details) {
            _timer1 = Timer.periodic(Duration(milliseconds: 50), (t) {
              controller.order.incBudget();
            });
          },
          onTapUp: (TapUpDetails details) {
            _timer1.cancel();
          },
          onTapCancel: () {
            _timer1.cancel();
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: ShapeDecoration(
              shape: CircleBorder(),
              color: AppTheme.primaryColor,
            ),
            child: Transform.rotate(
              angle: -90 * pi / 180,
              child: Icon(
                Icons.navigate_next,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        Container(
          height: 80,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: Center(
            child: Observer(
              builder: (_) => Text(
                '${controller.order.mealBudget} AED',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        GestureDetector(
          onTap: () => controller.order.decBudget(),
          onTapDown: (TapDownDetails details) {
            _timer2 = Timer.periodic(Duration(milliseconds: 50), (t) {
              controller.order.decBudget();
            });
          },
          onTapUp: (TapUpDetails details) {
            _timer2.cancel();
          },
          onTapCancel: () {
            _timer2.cancel();
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: ShapeDecoration(
              shape: CircleBorder(),
              color: AppTheme.primaryColor,
            ),
            child: Transform.rotate(
              angle: 90 * pi / 180,
              child: Icon(
                Icons.navigate_next,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
