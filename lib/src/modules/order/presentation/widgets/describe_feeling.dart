import 'package:app/src/modules/order/presentation/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DescribeFeeling extends StatefulWidget {
  @override
  _DescribeFeelingState createState() => _DescribeFeelingState();
}

class _DescribeFeelingState extends State<DescribeFeeling> {
  final controller = Modular.get<OrderController>();
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => controller.order.userFeeling = value,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: 'Descripe your feeling here ...',
      ),
      minLines: 5,
      maxLines: 10,
    );
  }
}
