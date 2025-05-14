import 'package:flutter/material.dart';
import 'package:moza/theme.dart';

class QuizMainButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool hasChecked;
  final String text;

  const QuizMainButton({
    super.key,
    required this.onPressed,
    required this.hasChecked,
    this.text = "Check",
  });

  bool get isDisabled => onPressed == null;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      height: 60,
      decoration: BoxDecoration(
        color: isDisabled 
            ? AppColors.appBlue.withAlpha(127) 
            : hasChecked 
              ? AppColors.appWhite 
              : AppColors.appBlue,
        borderRadius: BorderRadius.circular(46),
        boxShadow: [
          BoxShadow(
            color: const Color(0x3F563307),
            blurRadius: 1.8,
            offset: const Offset(0, 1),
          )
        ],
      ),
      child: TextButton(
        onPressed: onPressed,
        child: hasChecked
            ? Icon(
                Icons.arrow_forward_sharp,
                size: 25,
                color: AppColors.appBlue,
              )
            : Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: isDisabled 
                      ? AppColors.appWhite.withAlpha(153) 
                      : AppColors.appWhite,
                ),
              ),
      ),
    );
  }
}