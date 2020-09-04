import 'package:app/src/core/styles.dart';
import 'package:flutter/material.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
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
                Text(
                  '140 AED',
                  style: TextStyle(
                    fontSize: 18,
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
                    Icon(
                      Icons.remove_circle_outline,
                      color: AppTheme.primaryColor,
                    ),
                    SizedBox(width: 10),
                    Text(
                      '1',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.add_circle,
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
