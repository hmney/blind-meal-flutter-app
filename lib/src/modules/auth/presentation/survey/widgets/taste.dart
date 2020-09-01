import 'package:app/src/core/styles.dart';
import 'package:app/src/modules/auth/presentation/survey/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Taste extends StatefulWidget {
  final List<String> answers;
  Taste({this.answers});
  @override
  _TasteState createState() => _TasteState();
}

class _TasteState extends State<Taste> {
  List<String> get answers => widget.answers;
  final controller = Modular.get<SurveyController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...answers
            .map(
              (element) => Observer(
                builder: (_) => Column(
                  children: [
                    RadioListTile(
                      title: Text(
                        element,
                        style: TextStyle(fontSize: 18),
                      ),
                      value: element,
                      groupValue: controller.taste,
                      activeColor: AppTheme.primaryColor,
                      onChanged: controller.selectTaste,
                    ),
                    Visibility(
                      visible: controller.taste == element,
                      child: Slider(
                        min: 1,
                        max: 5,
                        value: controller.tasteDegree,
                        onChanged: controller.setTasteDegree,
                        activeColor: AppTheme.primaryColor,
                        inactiveColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
        SizedBox(height: 40),
        Container(
          child: Text(
            'How much your mood affect your choice of food ?',
            style: TextStyle(
              fontSize: 16,
              color: AppTheme.primaryColor,
            ),
          ),
        ),
        SizedBox(height: 10),
        Observer(
          builder: (_) => Slider(
            min: 1,
            max: 5,
            value: controller.moodAndChoiceOfFood,
            onChanged: controller.setMoodAndChoiceOfFood,
            activeColor: AppTheme.primaryColor,
            inactiveColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
