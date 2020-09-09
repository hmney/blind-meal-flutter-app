import 'dart:ui';

import 'package:app/src/common/buttons/animated_dialog.dart';
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
  OverlayEntry _overlayPopup;

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
                builder: (context) => GestureDetector(
                  onTap: () => controller.setMealSelected(element),
                  onLongPress: () {
                    _overlayPopup = _createMealInfoPopUp(element);
                    Overlay.of(context).insert(_overlayPopup);
                  },
                  onLongPressEnd: (_) {
                    _overlayPopup?.remove();
                  },
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

  OverlayEntry _createMealInfoPopUp(String element) {
    return OverlayEntry(
      builder: (context) => AnimatedDialog(
        child: _createPopupContent(element),
      ),
    );
  }

  // Main popup content
  Widget _createPopupContent(String element) => Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Container(
              height: MediaQuery.of(context).size.height / 2,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                "assets/images/recommendedFood/$element.jpg"))),
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          padding: const EdgeInsets.only(bottom: 10.0, left: 20.0),
                          child: Text(
                            element,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Roboto',
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "DESCRIPTION",
                          style: TextStyle(
                            color: Colors.black87,
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
                          " sed do eiusmod tempor incididunt ut labore et dolore"
                          " magna aliqua. Ut enim ad minim veniam, quis nostrud"
                          " exercitation ullamco laboris nisi ut aliquip ex ea "
                          "commodo consequat. Duis aute irure dolor in "
                          "reprehenderit in voluptate velit esse cillum dolore",
                          style: TextStyle(
                            color: Colors.black54,
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 25,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              // TODO: verify why divider is not working, margin is used
                              separatorBuilder: (_,__) => const Divider(),
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return new Container(
                                  width: 60,
                                  margin: EdgeInsets.only(right: 4.0),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      border: Border.all(
                                        color: AppTheme.primaryColor,
                                        width: 1.0,
                                      )),
                                  child: Text(
                                    "Ingredient $index",
                                    style: TextStyle(
                                      color: AppTheme.primaryColor,
                                      fontFamily: 'Roboto',
                                      fontSize: 9,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  )
                ],
              )),
        ),
      );
}
