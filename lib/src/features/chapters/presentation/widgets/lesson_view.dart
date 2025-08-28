import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // 👈 add this
import 'package:moza/src/features/chapters/presentation/widgets/lessons_grid.dart';
import 'package:moza/src/features/lessons/domain/lesson.dart';
import 'package:moza/src/models/database_repository.dart';

class LessonView extends StatelessWidget {
  final List<Lesson> lessons;

  const LessonView({
    required this.lessons,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final db = context.read<DatabaseRepository>(); 

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                "Lessons",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          LessonsGrid(lessons: lessons), 
        ],
      ),
    );
  }
}