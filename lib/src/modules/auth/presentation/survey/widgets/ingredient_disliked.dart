import 'package:app/src/core/styles.dart';
import 'package:app/src/modules/auth/presentation/survey/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class IngredientDisliked extends StatefulWidget {
  final List<String> answers;
  IngredientDisliked({this.answers});
  @override
  _IngredientDislikedState createState() => _IngredientDislikedState();
}

class _IngredientDislikedState extends State<IngredientDisliked> {
  List<String> get answers => widget.answers;
  final controller = Modular.get<SurveyController>();
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 20,
      children: answers.map(
        (element) {
          return Observer(
            builder: (_) {
              final _selected = controller.ingredientDisliked.contains(element);
              return ChoiceChip(
                selectedColor: Colors.white,
                backgroundColor: Color(0xff9a9a9a),
                pressElevation: 0,
                labelPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                            color: _selected
                                ? AppTheme.primaryColor
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      _selected ? Icons.check : Icons.add_circle,
                      size: 18,
                      color: _selected ? AppTheme.primaryColor : Colors.white,
                    ),
                  ],
                ),
                selected: _selected,
                onSelected: (selected) {
                  controller.selectIngredientDisliked(selected, element);
                },
              );
            },
          );
        },
      ).toList(),
    );
  }
}
