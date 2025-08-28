import 'package:flutter/material.dart';
import 'package:moza/src/features/lessons/domain/lesson.dart';
import 'package:moza/src/features/lessons/presentation/screens/lesson_title_screen.dart';
import 'package:moza/src/features/topics/presentation/widgets/topic_tile.dart';
import 'package:moza/src/models/database_repository.dart';

class LessonsGrid extends StatelessWidget {
  final List<Lesson> lessons;
  final DatabaseRepository db;

  const LessonsGrid({
    required this.lessons,
    required this.db,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: lessons.length,
      padding: const EdgeInsets.only(bottom: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final lesson = lessons[index];

        return TopicTile(
          title: lesson.title,
          color: const Color(0xFFE5EDFF),
          path: () => LessonTitleScreen(

          ),
        );
      },
    );
  }
}