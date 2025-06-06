import 'package:flutter/material.dart';
import 'package:moza/src/features/chapters/presentation/widgets/lessons_grid.dart';
import 'package:moza/src/features/lessons/domain/lesson.dart';
import 'package:moza/src/models/database_repository.dart';

class LessonView extends StatelessWidget {
  final List<Lesson> lessons;
  final DatabaseRepository db;

  const LessonView({
    required this.lessons,
    required this.db,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Lessons",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          LessonsGrid(lessons: lessons, db: db),
        ],
      ),
    );
  }
}