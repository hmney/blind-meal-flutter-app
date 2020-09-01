import 'package:app/src/core/styles.dart';
import 'package:app/src/modules/auth/presentation/survey/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DietType extends StatefulWidget {
  final List<String> answers;
  DietType({this.answers});
  @override
  _DietTypeState createState() => _DietTypeState();
}

class _DietTypeState extends State<DietType> {
  List<String> get answers => widget.answers;
  final controller = Modular.get<SurveyController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 55,
        crossAxisSpacing: 55,
        children: answers
            .map(
              (element) => Observer(
                builder: (_) => GestureDetector(
                  onTap: () => controller.selectDietType(element),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppTheme.primaryColor,
                            width: 4,
                            style: controller.dietType.contains(element)
                                ? BorderStyle.solid
                                : BorderStyle.none,
                          ),
                          image: DecorationImage(
                            image:
                                AssetImage("assets/images/diets/$element.jpg"),
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
