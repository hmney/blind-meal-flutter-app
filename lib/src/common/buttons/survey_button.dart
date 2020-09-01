import 'package:app/src/core/styles.dart';
import 'package:flutter/material.dart';

class SurveyButton extends StatefulWidget {
  final VoidCallback onPressed;
  final BUTTON_STYLE style;
  SurveyButton({
    @required this.onPressed,
    @required this.style,
  });
  @override
  _SurveyButtonState createState() => _SurveyButtonState();
}

class _SurveyButtonState extends State<SurveyButton> {
  VoidCallback get onPressed => widget.onPressed;
  BUTTON_STYLE get style => widget.style;

  Color _getButtonColor() {
    switch (style) {
      case BUTTON_STYLE.READY:
        return AppTheme.primaryColor;
      case BUTTON_STYLE.NOT_NOW:
        return AppTheme.backgroundColor;
      default:
        return Colors.white;
    }
  }

  String _getButtonText() {
    switch (style) {
      case BUTTON_STYLE.READY:
        return 'Ready';
      case BUTTON_STYLE.NOT_NOW:
        return 'Not now';
      case BUTTON_STYLE.CONTINUE:
        return 'Continue';
      case BUTTON_STYLE.DONE:
        return 'Done';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315,
      height: 50,
      child: RaisedButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          side: style == BUTTON_STYLE.NOT_NOW
              ? BorderSide(color: AppTheme.primaryColor, width: 1.5)
              : BorderSide.none,
          borderRadius: BorderRadius.circular(25.0),
        ),
        color: _getButtonColor(),
        elevation:
            (style == BUTTON_STYLE.CONTINUE || style == BUTTON_STYLE.DONE)
                ? 5
                : 0,
        child: Row(
          children: [
            Spacer(),
            Text(
              _getButtonText(),
              style: TextStyle(
                color: style == BUTTON_STYLE.READY
                    ? Colors.white
                    : AppTheme.primaryColor,
                fontFamily: 'Roboto',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            if (style == BUTTON_STYLE.CONTINUE)
              Icon(
                Icons.arrow_forward,
                size: 24,
                color: AppTheme.primaryColor,
              ),
          ],
        ),
      ),
    );
  }
}

enum BUTTON_STYLE {
  READY,
  NOT_NOW,
  CONTINUE,
  DONE,
}
