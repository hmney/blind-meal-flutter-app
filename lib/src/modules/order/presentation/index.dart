import 'package:app/src/common/buttons/survey_button.dart';
import 'package:app/src/core/styles.dart';
import 'package:app/src/modules/order/presentation/controller.dart';
import 'package:app/src/modules/order/presentation/widgets/blindmeal_experience.dart';
import 'package:app/src/modules/order/presentation/widgets/budget_meal.dart';
import 'package:app/src/modules/order/presentation/widgets/describe_feeling.dart';
import 'package:app/src/modules/order/presentation/widgets/level_hungriness.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends ModularState<OrderScreen, OrderController> {
  List<String> orderQuestions = [
    "How do you feel ?",
    "What's your level of hungriness ?",
    "What's your budget for this meal ?",
    "Which blind meal experience you want ?"
  ];

  Widget createBodyofOrderQuestion(int index) {
    switch (index) {
      case 0:
        return DescribeFeeling();
      case 1:
        return LevelofHungriness();
      case 2:
        return BudgetofMeal();
      case 3:
        return TypeofBlindMealExperience();
      default:
        return SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: PageView.custom(
          controller: controller.pageController,
          onPageChanged: controller.onChangePageIndex,
          physics: NeverScrollableScrollPhysics(),
          childrenDelegate: SliverChildBuilderDelegate(
            (context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: LinearPercentIndicator(
                        padding: EdgeInsets.zero,
                        lineHeight: 4.0,
                        percent:
                            (controller.pageIndex + 1) / orderQuestions.length,
                        backgroundColor: Colors.white,
                        progressColor: AppTheme.primaryColor,
                      ),
                    ),
                    SizedBox(height: 30),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          if (controller.pageIndex > 0)
                            controller.pageController.previousPage(
                                duration: Duration(milliseconds: 10),
                                curve: Curves.easeIn);
                          else
                            Modular.to.pop();
                        },
                        child: Icon(Icons.arrow_back),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              orderQuestions[index],
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Georgia',
                                fontWeight: FontWeight.bold,
                                fontSize: 26,
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              width: 30,
                              child: Divider(
                                thickness: 4,
                                color: AppTheme.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    createBodyofOrderQuestion(index),
                    Expanded(child: SizedBox(height: 20)),
                    SurveyButton(
                      onPressed: () async {
                        // if (true) {
                        //   BotToast.showText(
                        //       text: 'Please selecte a choice');
                        // } else {
                        if (controller.pageIndex + 1 == orderQuestions.length) {
                          BotToast.showLoading();
                          BotToast.closeAllLoading();
                        } else
                          controller.pageController.nextPage(
                              duration: Duration(milliseconds: 10),
                              curve: Curves.easeIn);
                        // }
                      },
                      style: controller.pageIndex + 1 == orderQuestions.length
                          ? BUTTON_STYLE.DONE
                          : BUTTON_STYLE.CONTINUE,
                    ),
                  ],
                ),
              );
            },
            childCount: orderQuestions.length,
          ),
        ),
      ),
    );
  }
}
