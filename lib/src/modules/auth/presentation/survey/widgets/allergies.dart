import 'package:app/src/core/styles.dart';
import 'package:app/src/modules/auth/presentation/survey/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Allergies extends StatefulWidget {
  final List<String> answers;
  Allergies({this.answers});
  @override
  _AllergiesState createState() => _AllergiesState();
}

class _AllergiesState extends State<Allergies> {
  List<String> get answers => widget.answers;
  final controller = Modular.get<SurveyController>();
  final checkAllergies = ['Yes', 'Maybe', 'No'];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: checkAllergies
              .map(
                (element) => Observer(
                  builder: (_) => RadioListTile(
                    title: Text(
                      element,
                      style: TextStyle(fontSize: 18),
                    ),
                    value: element,
                    groupValue: controller.checkAllergy,
                    activeColor: AppTheme.primaryColor,
                    onChanged: controller.setAllergy,
                  ),
                ),
              )
              .toList(),
        ),
        Observer(
          builder: (_) => Visibility(
            visible: controller.selectionAllergiesVisiblity,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "What's kind of allergy ?",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: 50,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 5,
                      children: controller.allergies.map(
                        (element) {
                          return Observer(
                            builder: (_) {
                              final _selected =
                                  controller.allergies.contains(element);
                              return ChoiceChip(
                                selectedColor: AppTheme.primaryColor,
                                pressElevation: 0,
                                labelPadding:
                                    EdgeInsets.symmetric(horizontal: 5),
                                label: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Flexible(
                                      child: Container(
                                        child: Text(
                                          element,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Icon(
                                      Icons.cancel,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                                selected: _selected,
                                onSelected: (selected) {
                                  controller.selectAllergies(selected, element);
                                },
                              );
                            },
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 5,
                  children: controller.surveyQuestions.allergies.map(
                    (element) {
                      return Observer(builder: (_) {
                        final _selected =
                            controller.allergies.contains(element);
                        if (!_selected) {
                          return ChoiceChip(
                            backgroundColor: Color(0xff9a9a9a),
                            pressElevation: 0,
                            labelPadding: EdgeInsets.symmetric(horizontal: 5),
                            label: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Flexible(
                                  child: Container(
                                    child: Text(
                                      element,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Icon(
                                  Icons.add_circle,
                                  size: 18,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            selected: _selected,
                            onSelected: (selected) {
                              controller.selectAllergies(selected, element);
                            },
                          );
                        }
                        return SizedBox();
                      });
                    },
                  ).toList(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
