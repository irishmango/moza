import 'package:flutter/material.dart';
import 'package:moza/src/features/lessons/presentation/screens/lesson_screen.dart';

import 'package:moza/src/shared/custom_scaffold.dart';
import 'package:moza/theme.dart';


class LessonTitleScreen extends StatelessWidget {
  const LessonTitleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Container(
          color: AppColors.appOrange,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 62),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 12,
                    children: [
                      const Text(
                        'Intervals',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                  const Divider(   
                    color: Colors.white70,
                    thickness: 2,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      const Text(
                        'Interval Classes',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                  const Text(
                    'Reading time: 3 min',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                    ],
                  ),
                  const Divider(   
                    color: Colors.white70,
                    thickness: 2,
                  ),
                  ],
                  ),
                  const SizedBox(height: 100),
                  // First interval icon row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _IntervalIconPattern([1, 3]),
                      const SizedBox(width: 32),
                      _IntervalIconPattern([2, 4]),
                    ],
                  ),
                  const SizedBox(height: 32),
                  // Second interval icon row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _IntervalIconPattern([2, 1, 3]),
                      const SizedBox(width: 32),
                      _IntervalIconPattern([1, 4, 2]),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.white),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        ),
                        child: const Text('Home'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to lesson content screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LessonScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: AppColors.appOrange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        ),
                        child: const Icon(Icons.arrow_forward),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ),
      );
  }
}

class _IntervalIconPattern extends StatelessWidget {
  final List<int> heights;
  const _IntervalIconPattern(this.heights);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: heights.map((h) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Container(
          width: 10,
          height: 20.0 * h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      )).toList(),
    );
  }
}