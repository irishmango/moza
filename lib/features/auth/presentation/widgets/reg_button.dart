import 'package:flutter/material.dart';
import 'package:moza/theme.dart';

class RegButton extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback? onPressed;

  const RegButton({
    super.key,
    required this.isEnabled,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: isEnabled ? AppColors.appOrange : AppColors.appOrange.withAlpha(127),
      ),
      child: TextButton(
        onPressed: isEnabled ? onPressed : null,
        child: const Icon(
          Icons.arrow_forward_outlined,
          color: Colors.white,
        ),
      ),
    );
  }
}