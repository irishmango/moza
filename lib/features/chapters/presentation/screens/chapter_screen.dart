import 'package:flutter/material.dart';
import 'package:moza/features/chapters/presentation/widgets/chapter_title_card.dart';
import 'package:moza/features/chapters/presentation/widgets/lesson_view.dart';
import 'package:moza/features/chapters/presentation/widgets/quiz_view.dart';
import 'package:moza/features/chapters/presentation/widgets/toggle_switch.dart';
import 'package:moza/shared/custom_scaffold.dart';
import 'package:moza/shared/screen_header.dart';
import 'package:moza/features/chapters/presentation/widgets/toggle_switch.dart';

class ChapterScreen extends StatefulWidget {
  const ChapterScreen({super.key});

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
    return CustomScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              ScreenHeader(title: "Chapter 1"),
              const SizedBox(height: 16),
      
              // Title Card
              const ChapterTitleCard(),
              const SizedBox(height: 32),
      
              // Toggle Switch
              ToggleSwitch(
                onChanged: _onModeChanged,
              ),
      
              const SizedBox(height: 24),
      
              // View mode
              Expanded(
                child: _selectedMode == Mode.lesson 
                  ? const LessonView() 
                  : const QuizView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}