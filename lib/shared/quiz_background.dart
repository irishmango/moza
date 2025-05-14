import 'dart:ui';
import 'package:flutter/material.dart';

class QuizBackground extends StatelessWidget {
  const QuizBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image
        Positioned.fill(
          child: Image.asset(
            'assets/img/orange_wave_bg.png',
            fit: BoxFit.cover,
          ),
        ),

        // Blur Layer
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
            child: Container(
              color: Colors.white.withValues(alpha: 0.05),
            ),
          ),
        ),
      ],
    );
  }
}