import 'package:app/src/common/buttons/button.dart';
import 'package:app/src/core/styles.dart';
import 'package:app/src/modules/order/domain/entities/order.dart';
import 'package:app/src/modules/order/presentation/controller.dart';
import 'package:app/src/modules/order/presentation/widgets/blindmeal_experience.dart';
import 'package:app/src/modules/order/presentation/widgets/budget_meal.dart';
import 'package:app/src/modules/order/presentation/widgets/checkout.dart';
import 'package:app/src/modules/order/presentation/widgets/delivery_location.dart';
import 'package:app/src/modules/order/presentation/widgets/describe_feeling.dart';
import 'package:app/src/modules/order/presentation/widgets/level_hungriness.dart';
import 'package:app/src/modules/order/presentation/widgets/select_meal.dart';
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
    "Set delivery location",
    "Which blind meal experience you want ?",
    "Select a meal from sugesstions",
    "Checkout",
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
        return DeliveryLocationWidget();
      case 4:
        return TypeofBlindMealExperience();
      case 5:
        return SelectMeal();
      case 6:
        return Checkout();
      default:
        return SizedBox();
    }
  }

  bool checkIfOrderQuestionAnswered(int index) {
    switch (index) {
      case 0:
        return controller.order.userFeeling.isNotEmpty;
      case 1:
        return true;
      case 2:
        return controller.order.mealBudget > 0;
      case 3:
        return controller.order.deliveryLocation != null;
      case 4:
        return controller.order.blindMealExperience !=
            BLIND_MEAL_EXPERIENCE.NONE;
      case 5:
        return true;
      // return controller.orderDetails.mealSelected != null;
      case 6:
        return true;
      default:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppTheme.backgroundColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
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
                          percent: (controller.pageIndex + 1) /
                              orderQuestions.length,
                          backgroundColor: Colors.white,
                          progressColor: AppTheme.primaryColor,
                        ),
                      ),
                      SizedBox(height: 30),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {
                            if (controller.pageIndex > 0) {
                              if (controller.pageIndex == 6) {
                                controller.order.mealsNumber = 1;
                              }
                              if (controller.pageIndex == 6 &&
                                  controller.order.blindMealExperience ==
                                      BLIND_MEAL_EXPERIENCE.COMPLETELY_BLIND) {
                                controller.pageController.animateToPage(4,
                                    duration: Duration(milliseconds: 10),
                                    curve: Curves.easeIn);
                              } else {
                                controller.pageController.previousPage(
                                    duration: Duration(milliseconds: 10),
                                    curve: Curves.easeIn);
                              }
                            } else
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
                      Button(
                        onPressed: () async {
                          FocusScope.of(context).unfocus();
                          if (!checkIfOrderQuestionAnswered(index)) {
                            BotToast.showText(text: 'Please selecte a choice');
                          } else {
                            if (controller.pageIndex + 1 ==
                                orderQuestions.length) {
                              BotToast.showLoading();
                              controller.createNewOrderToFirebase();
                              Modular.to.pop();
                              BotToast.closeAllLoading();
                            } else {
                              if (controller.pageIndex == 4) {
                                controller.order.mealsSuggested =
                                    await controller.getRecommendedMeals();
                                controller.order.setSelectedMeal(
                                    controller.order.mealsSuggested?.first);
                              }
                              if (controller.pageIndex == 4 &&
                                  controller.order.blindMealExperience ==
                                      BLIND_MEAL_EXPERIENCE.COMPLETELY_BLIND) {
                                controller.pageController.animateToPage(6,
                                    duration: Duration(milliseconds: 10),
                                    curve: Curves.easeIn);
                              } else {
                                controller.pageController.nextPage(
                                    duration: Duration(milliseconds: 10),
                                    curve: Curves.easeIn);
                              }
                            }
                          }
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
      ),
    );
  }
}
