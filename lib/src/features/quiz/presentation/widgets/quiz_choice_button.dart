import 'package:flutter/material.dart';
import 'package:moza/theme.dart';


class QuizChoiceButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isSelected;
  final bool isAnswered;
  final bool isCorrect;

  const QuizChoiceButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isSelected = false,
    this.isAnswered = false,
    this.isCorrect = false,
  });

  @override
  Widget build(BuildContext context) {
    Color defaultBorder = Color.fromRGBO(117, 117, 117, 1);
    Color selectedColor = AppColors.appBlue;
    Color correctColor = Color.fromRGBO(67, 141, 87, 1);
    Color incorrectColor = Color.fromRGBO(220, 78, 65, 1);

    // Background color 
    Color backgroundColor = Colors.transparent;
    if (isAnswered) {
      if (isCorrect) {
        backgroundColor = correctColor;
      } else if (isSelected) {
        backgroundColor = incorrectColor;
      }
    } else if (isSelected) {
      backgroundColor = selectedColor;
    }

    // Border color 
    Color borderColor = defaultBorder;
    if (isAnswered) {
      if (isCorrect) {
        borderColor = correctColor;
      } else if (isSelected) {
        borderColor = incorrectColor;
      }
    } else if (isSelected) {
      borderColor = selectedColor;
    }

    // Text color 
    Color textColor = Colors.black;
    if (isAnswered) {
      if (isCorrect || isSelected) {
        textColor = Colors.white;
      } else {
        textColor = Colors.black;
      }
    } else if (isSelected) {
      textColor = Colors.white;
    }

    return Container(
      width: 320,
      height: 60,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(24),
        border: Border(
          left: BorderSide(color: borderColor, width: 1),
          top: BorderSide(color: borderColor, width: 1),
          right: BorderSide(color: borderColor, width: 1),
          bottom: BorderSide(color: borderColor, width: 4),
        ),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}