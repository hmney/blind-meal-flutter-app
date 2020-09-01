import 'package:app/src/common/buttons/survey_button.dart';
import 'package:app/src/core/styles.dart';
import 'package:app/src/modules/auth/module.dart';
import 'package:app/src/modules/auth/presentation/controller.dart';
import 'package:app/src/modules/auth/presentation/survey/controller.dart';
import 'package:app/src/modules/auth/presentation/survey/widgets/questions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SurveyScreen extends StatefulWidget {
  @override
  _SurveyScreenState createState() => _SurveyScreenState();
}

class _SurveyScreenState extends ModularState<SurveyScreen, SurveyController> {
  final String _title = 'Hello.';
  final String _subtitle =
      "Welcome to your unique food experience. Ordering food has never been easier, enjoy your time and live the dream. Before we go forward you need to reply to some questions, it will take from you just 5 minutes.";
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 150, 30, 85),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _title,
                style: TextStyle(
                  color: AppTheme.primaryColor,
                  fontFamily: 'Roboto',
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                _subtitle,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Spacer(),
              SurveyButton(
                onPressed: () async {
                  await AuthModule.toStartSurvey();
                },
                style: BUTTON_STYLE.READY,
              ),
              SizedBox(height: 10),
              SurveyButton(
                onPressed: () async {
                  await Modular.get<AuthController>()
                      .addEvent(AuthEvent.goHome());
                },
                style: BUTTON_STYLE.NOT_NOW,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StartSurvey extends StatefulWidget {
  @override
  _StartSurveyState createState() => _StartSurveyState();
}

class _StartSurveyState extends State<StartSurvey> {
  final _controller = Modular.get<SurveyController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: PageView.custom(
          controller: _controller.pageController,
          onPageChanged: _controller.onChangePageIndex,
          physics: NeverScrollableScrollPhysics(),
          childrenDelegate: SliverChildBuilderDelegate(
            (context, index) {
              final key =
                  _controller.surveyQuestions.questions.keys.elementAt(index);
              final value = _controller.surveyQuestions.questions[key];
              return Questions(
                questionType: key,
                question: value,
                answers: _controller.surveyQuestions.getAnswers(key),
              );
            },
            childCount: _controller.maxPageIndex,
          ),
        ),
      ),
    );
  }
}
