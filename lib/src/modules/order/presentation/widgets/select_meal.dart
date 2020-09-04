import 'package:app/src/core/styles.dart';
import 'package:app/src/modules/order/presentation/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SelectMeal extends StatefulWidget {
  @override
  _SelectMealState createState() => _SelectMealState();
}

class _SelectMealState extends State<SelectMeal> {
  List<String> recommendationFood = ["Burger", "Pizza", "Keto Salad", "Fish"];
  final controller = Modular.get<OrderController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 55,
        crossAxisSpacing: 55,
        children: recommendationFood
            .map(
              (element) => Observer(
                builder: (_) => GestureDetector(
                  onTap: () => controller.setMealSelected(element),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppTheme.primaryColor,
                            width: 4,
                            style: controller.mealSelected == element
                                ? BorderStyle.solid
                                : BorderStyle.none,
                          ),
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/images/recommendedFood/$element.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: <Color>[
                              Colors.black.withAlpha(0),
                              Colors.black12,
                              Colors.black45
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Container(
                          child: Text(
                            element,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Georgia',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
