import 'dart:ui';
import 'package:flutter/material.dart';

class GeneralBackground extends StatelessWidget {
  const GeneralBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image
        Positioned.fill(
          child: Image.asset(
            'assets/img/backgrounds/icon_background.png',
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