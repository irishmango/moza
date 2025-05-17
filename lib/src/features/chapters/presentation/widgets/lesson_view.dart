import 'package:flutter/material.dart';
import 'package:moza/src/features/chapters/presentation/widgets/lessons_grid.dart';
import 'package:moza/src/features/lessons/domain/lesson.dart';


class LessonView extends StatelessWidget {
  final List<Lesson> lessons;
  
  const LessonView({
    required this.lessons,
    super.key});

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

          LessonsGrid(lessons: lessons,)

        


        ],
      ),
    );
  }
}