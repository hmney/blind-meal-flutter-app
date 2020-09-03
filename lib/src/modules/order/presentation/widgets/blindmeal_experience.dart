import 'package:app/src/core/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app/src/modules/order/presentation/controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TypeofBlindMealExperience extends StatefulWidget {
  @override
  _TypeofBlindMealExperienceState createState() =>
      _TypeofBlindMealExperienceState();
}

class _TypeofBlindMealExperienceState extends State<TypeofBlindMealExperience> {
  final controller = Modular.get<OrderController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Observer(
          builder: (_) => GestureDetector(
            onTap: () => controller
                .setBlindMealExperience(BLIND_MEAL_EXPERIENCE.COMPLETELY_BLIND),
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                  color: AppTheme.primaryColor,
                  width: 2,
                  style: (controller.blindMealExperience ==
                          BLIND_MEAL_EXPERIENCE.COMPLETELY_BLIND)
                      ? BorderStyle.solid
                      : BorderStyle.none,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.16),
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/completely_blind.svg'),
                  SizedBox(height: 10),
                  Text(
                    'Blind meal',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 60),
        Observer(
          builder: (_) => GestureDetector(
            onTap: () => controller
                .setBlindMealExperience(BLIND_MEAL_EXPERIENCE.GET_SUGGESTIONS),
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                  color: AppTheme.primaryColor,
                  width: 2,
                  style: (controller.blindMealExperience ==
                          BLIND_MEAL_EXPERIENCE.GET_SUGGESTIONS)
                      ? BorderStyle.solid
                      : BorderStyle.none,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.16),
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/get_suggestions.svg'),
                  SizedBox(height: 10),
                  Text(
                    'Suggestions',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
