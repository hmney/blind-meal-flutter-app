import 'dart:ui';

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
    padding: EdgeInsets.symmetric(horizontal: 20.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 3,
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
                  fit: BoxFit.scaleDown,
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
  );
}

// This a widget to implement the image scale animation,
// and blurred background effect
class AnimatedDialog extends StatefulWidget {
  const AnimatedDialog({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  State<StatefulWidget> createState() => AnimatedDialogState();
}

class AnimatedDialogState extends State<AnimatedDialog> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> opacityAnimation;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.easeOutExpo);
    opacityAnimation = Tween<double>(begin: 0.0, end: 0.6).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOutExpo));

    controller.addListener(() => setState(() {}));
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(opacityAnimation.value),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Center(
          child: FadeTransition(
            opacity: scaleAnimation,
            child: ScaleTransition(
              scale: scaleAnimation,
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
