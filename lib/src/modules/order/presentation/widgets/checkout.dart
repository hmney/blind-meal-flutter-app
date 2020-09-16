import 'package:app/src/core/styles.dart';
import 'package:app/src/modules/order/presentation/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final controller = Modular.get<OrderController>();

  String paymentMethod = 'Cash';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Amount',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                Observer(
                  builder: (_) => Text(
                    '${(int.parse(controller.mealSelected.price) * controller.mealsNumber)} AED',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            Column(
              children: [
                Text(
                  'Number of Meals',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => controller.decMealsNumber(),
                      icon: Icon(Icons.remove_circle_outline),
                      color: AppTheme.primaryColor,
                    ),
                    SizedBox(width: 10),
                    Observer(
                      builder: (_) => Text(
                        controller.mealsNumber.toString(),
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    IconButton(
                      onPressed: () => controller.incMealsNumber(),
                      icon: Icon(Icons.add_circle),
                      color: AppTheme.primaryColor,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
        Divider(),
        RadioListTile<String>(
          activeColor: AppTheme.primaryColor,
          value: 'Cash',
          groupValue: paymentMethod,
          onChanged: (value) {
            setState(() {
              paymentMethod = 'Cash';
            });
          },
          title: Text(
            'Cash',
            style: TextStyle(color: Colors.black),
          ),
        ),
        Divider(),
        RadioListTile<String>(
          activeColor: AppTheme.primaryColor,
          value: 'Card',
          groupValue: paymentMethod,
          onChanged: (value) {
            setState(() {
              paymentMethod = 'Card';
            });
          },
          title: Row(
            children: [
              Text(
                'Add credit or debit card',
                style: TextStyle(color: Colors.black),
              ),
              Spacer(),
              Text(
                'Settings',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              )
            ],
          ),
        ),
        Divider(),
        Container(
          child: Text(
            'ADD PROMO CODE',
            style: TextStyle(
              color: AppTheme.primaryColor,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
