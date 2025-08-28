import 'package:flutter/material.dart';
import 'package:provider/provider.dart';                       // 👈 new
import 'package:moza/src/features/chapters/domain/chapter.dart';
import 'package:moza/src/features/chapters/presentation/widgets/chapter_title_card.dart';
import 'package:moza/src/features/chapters/presentation/widgets/lesson_view.dart';
import 'package:moza/src/features/chapters/presentation/widgets/quiz_view.dart';
import 'package:moza/src/features/chapters/presentation/widgets/toggle_switch.dart';
import 'package:moza/src/models/database_repository.dart';
import 'package:moza/src/shared/custom_scaffold.dart';
import 'package:moza/src/shared/screen_header.dart';
// add import for Lesson
import 'package:moza/src/features/lessons/domain/lesson.dart';

class ChapterScreen extends StatefulWidget {
  final Chapter chapter;
  final String topicId; 

  const ChapterScreen({
    required this.chapter,
    required this.topicId, 
    super.key,
  });

  @override
  State<ChapterScreen> createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
  Mode _selectedMode = Mode.lesson;

  void _onModeChanged(Mode mode) => setState(() => _selectedMode = mode);

  @override
  Widget build(BuildContext context) {
    final db = context.read<DatabaseRepository>();
    final chapter = widget.chapter;
    final quizzes = chapter.quizzes;

    return CustomScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              ScreenHeader(title: chapter.title),
              const SizedBox(height: 16),

              ChapterTitleCard(db: db, chapter: chapter),
              const SizedBox(height: 32),

              ToggleSwitch(onChanged: _onModeChanged),
              const SizedBox(height: 24),

               Expanded(
                child: _selectedMode == Mode.lesson
                    ? FutureBuilder<List<Lesson>>(
                        future: db.getLessons(widget.topicId, chapter.id),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator());
                          }
                          if (snapshot.hasError) {
                            return Center(child: Text('Failed to load lessons: ${snapshot.error}'));
                          }
                          final lessons = snapshot.data ?? const <Lesson>[];
                          if (lessons.isEmpty) {
                            return const Center(child: Text('No lessons yet.'));
                          }
                          return LessonView(lessons: lessons);
                        },
                      )
                    : QuizView(quizzes: quizzes, db: db),
              ),
            ],
          ),
        ),
      ),
    );
  }
}