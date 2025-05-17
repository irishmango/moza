import 'package:flutter/material.dart';
import 'package:moza/theme.dart';

class ProgressBar extends StatelessWidget {
  final int currentIndex;
  final int total;

  const ProgressBar({
    required this.currentIndex,
    required this.total,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double progress = (currentIndex + 1) / total;
    return Container(
      width: 240,
      height: 16,
      decoration: BoxDecoration(
        color: AppColors.appOrange.withAlpha(85),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Stack(
        children: [
          Container(
            width: 240 * progress,
            height: 16,
            decoration: BoxDecoration(
              color: AppColors.appOrange,
              borderRadius: BorderRadius.circular(22),
            ),
          ),
        ],
      ),
    );
  }
}