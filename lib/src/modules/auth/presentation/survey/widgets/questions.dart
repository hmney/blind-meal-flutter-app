import 'package:app/src/common/buttons/survey_button.dart';
import 'package:app/src/core/styles.dart';
import 'package:app/src/modules/auth/presentation/controller.dart';
import 'package:app/src/modules/auth/presentation/survey/controller.dart';
import 'package:app/src/modules/auth/presentation/survey/widgets/allergies.dart';
import 'package:app/src/modules/auth/presentation/survey/widgets/cuisine_type.dart';
import 'package:app/src/modules/auth/presentation/survey/widgets/diet_type.dart';
import 'package:app/src/modules/auth/presentation/survey/widgets/eating_habits.dart';
import 'package:app/src/modules/auth/presentation/survey/widgets/ingredient_disliked.dart';
import 'package:app/src/modules/auth/presentation/survey/widgets/ingredient_liked.dart';
import 'package:app/src/modules/auth/presentation/survey/widgets/taste.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Questions extends StatefulWidget {
  final String questionType;
  final String question;
  final List<String> answers;
  Questions({this.questionType, this.question, this.answers});
  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  String get questionType => widget.questionType;
  String get question => widget.question;
  List<String> get answers => widget.answers;
  final controller = Modular.get<SurveyController>();
  final userController = Modular.get<AuthController>();

  Widget createBodyofQuestion(String questionType, List<String> answers) {
    switch (questionType) {
      case 'cuisineType':
        return CuisineType(answers: answers);
      case 'dietType':
        return DietType(answers: answers);
      case 'eatingHabits':
        return EatingHabits(answers: answers);
      case 'ingredientLiked':
        return IngredientLiked(answers: answers);
      case 'ingredientDisliked':
        return IngredientDisliked(answers: answers);
      case 'allergies':
        return Allergies(answers: answers);
      case 'taste':
        return Taste(answers: answers);

      default:
        return SizedBox();
    }
  }

  bool checkIfQuestionAnswered(String questionType) {
    switch (questionType) {
      case 'cuisineType':
        return controller.checkIfCuisineTypeIsSelected();
      case 'dietType':
        return controller.checkIfDietTypeIsSelected();
      case 'eatingHabits':
        return controller.checkIfEatingHabitsIsSelected();
      case 'ingredientLiked':
        return controller.checkIfIngredientLikedIsSelected();
      case 'ingredientDisliked':
        return controller.checkIfIngredientDislikedIsSelected();
      case 'allergies':
        return controller.checkIfAllergiesIsSelected();
      case 'taste':
        return true;
      default:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) => SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraint.maxHeight),
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: LinearPercentIndicator(
                      padding: EdgeInsets.zero,
                      lineHeight: 4.0,
                      percent:
                          (controller.pageIndex + 1) / controller.maxPageIndex,
                      backgroundColor: Colors.white,
                      progressColor: AppTheme.primaryColor,
                    ),
                  ),
                  SizedBox(height: 30),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            question,
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
                        ]),
                  ),
                  createBodyofQuestion(questionType, answers),
                  Expanded(child: SizedBox(height: 20)),
                  SurveyButton(
                    onPressed: () async {
                      FocusScope.of(context).unfocus();
                      if (!checkIfQuestionAnswered(questionType)) {
                        BotToast.showText(text: 'Please selecte a choice');
                      } else {
                        if (controller.pageIndex + 1 ==
                            controller.maxPageIndex) {
                          BotToast.showLoading();
                          controller.createNewSurveyToFirebase();
                          userController.currentUser.isSurveyFilled = true;
                          Modular.to.popUntil((r) => r.isFirst);
                          await Modular.get<AuthController>()
                              .addEvent(AuthEvent.goHome());
                          BotToast.closeAllLoading();
                        } else
                          controller.pageController.nextPage(
                              duration: Duration(milliseconds: 10),
                              curve: Curves.easeIn);
                      }
                    },
                    style: controller.pageIndex + 1 == controller.maxPageIndex
                        ? BUTTON_STYLE.DONE
                        : BUTTON_STYLE.CONTINUE,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
