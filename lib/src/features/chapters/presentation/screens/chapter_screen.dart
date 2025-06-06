import 'package:flutter/material.dart';
import 'package:moza/src/features/chapters/domain/chapter.dart';
import 'package:moza/src/features/chapters/presentation/widgets/chapter_title_card.dart';
import 'package:moza/src/features/chapters/presentation/widgets/lesson_view.dart';
import 'package:moza/src/features/chapters/presentation/widgets/quiz_view.dart';
import 'package:moza/src/features/chapters/presentation/widgets/toggle_switch.dart';
import 'package:moza/src/models/database_repository.dart';
import 'package:moza/src/shared/custom_scaffold.dart';
import 'package:moza/src/shared/screen_header.dart';


class ChapterScreen extends StatefulWidget {
  final DatabaseRepository db;
  final Chapter chapter;

  const ChapterScreen({
    required this.chapter,
    required this.db,
    super.key});

  @override
  State<ChapterScreen> createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
  Mode _selectedMode = Mode.lesson;

  void _onModeChanged(Mode mode) {
    setState(() {
      _selectedMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    final chapter = widget.chapter;
    final lessons = chapter.lessons;
    final quizzes = chapter.quizzes;
    return CustomScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              ScreenHeader(title: widget.chapter.title),
              const SizedBox(height: 16),
      
              // Title Card
              ChapterTitleCard(db: widget.db, chapter: chapter),
              const SizedBox(height: 32),
      
              // Toggle Switch
              ToggleSwitch(
                onChanged: _onModeChanged,
              ),
      
              const SizedBox(height: 24),
      
              // View mode
              Expanded(
                child: _selectedMode == Mode.lesson 
                  ? LessonView(lessons: lessons, db: widget.db,) 
                  : QuizView(quizzes: quizzes, db: widget.db,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}