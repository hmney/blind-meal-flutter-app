import 'package:app/src/core/styles.dart';
import 'package:app/src/modules/order/presentation/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LevelofHungriness extends StatefulWidget {
  @override
  _LevelofHungrinessState createState() => _LevelofHungrinessState();
}

class _LevelofHungrinessState extends State<LevelofHungriness> {
  final controller = Modular.get<OrderController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Slider(
        min: 1,
        max: 5,
        divisions: 5,
        value: controller.order.levelofHungriness,
        onChanged: controller.order.setLevelofHungriness,
        activeColor: AppTheme.primaryColor,
        inactiveColor: Colors.white,
      ),
    );
  }
}
