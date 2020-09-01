import 'package:app/src/core/styles.dart';
import 'package:app/src/modules/auth/presentation/survey/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EatingHabits extends StatefulWidget {
  final List<String> answers;
  EatingHabits({this.answers});
  @override
  _EatingHabitsState createState() => _EatingHabitsState();
}

class _EatingHabitsState extends State<EatingHabits> {
  List<String> get answers => widget.answers;
  FocusNode _focusNode;
  final controller = Modular.get<SurveyController>();

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: answers
          .map(
            (element) => Observer(
              builder: (_) => RadioListTile(
                  title: element != 'Other'
                      ? Text(
                          element,
                          style: TextStyle(fontSize: 18),
                        )
                      : Container(
                          height: 35,
                          child: TextField(
                            focusNode: _focusNode,
                            onTap: () => controller.selectEatingHabits(element),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: element,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 10,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: AppTheme.primaryColor),
                              ),
                            ),
                          ),
                        ),
                  value: element,
                  groupValue: controller.eatingHabits,
                  activeColor: AppTheme.primaryColor,
                  onChanged: (value) {
                    if (value == 'Other')
                      _focusNode.requestFocus();
                    else
                      _focusNode.unfocus();
                    controller.selectEatingHabits(value);
                  }),
            ),
          )
          .toList(),
    );
  }
}
