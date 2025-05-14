import 'package:flutter/material.dart';
import 'package:moza/features/chapters/presentation/widgets/lessons_grid.dart';


class LessonView extends StatelessWidget {
  const LessonView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          // heading
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Lessons", style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          LessonsGrid()

        


        ],
      ),
    );
  }
}