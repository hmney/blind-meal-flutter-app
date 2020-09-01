import 'package:app/src/core/styles.dart';
import 'package:app/src/modules/auth/presentation/survey/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CuisineType extends StatefulWidget {
  final List<String> answers;
  CuisineType({this.answers});
  @override
  _CuisineTypeState createState() => _CuisineTypeState();
}

class _CuisineTypeState extends State<CuisineType> {
  List<String> get answers => widget.answers;
  final controller = Modular.get<SurveyController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: answers.map((element) {
        return Observer(
          builder: (_) => GestureDetector(
            onTap: () => controller.selectCuisineType(element),
            child: Container(
              height: 65,
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  left: (controller.cuisineType.contains(element))
                      ? BorderSide(color: AppTheme.primaryColor, width: 5)
                      : BorderSide.none,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.16),
                    offset: Offset(3, 3),
                    blurRadius: 6,
                  )
                ],
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  element,
                  style: TextStyle(fontSize: 20, color: Color(0xff707070)),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
