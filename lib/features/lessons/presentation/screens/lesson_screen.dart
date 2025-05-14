import 'package:flutter/material.dart';
import 'package:moza/features/lessons/domain/lesson_content.dart';
import 'package:moza/shared/custom_scaffold.dart';
import 'package:moza/shared/screen_header.dart';
import 'package:moza/theme.dart';

class LessonScreen extends StatelessWidget {
  LessonScreen({super.key});

  final List<LessonContent> lessonContent = [
    LessonContent(type: "text", data: "Welcome to the lesson on intervals."),
    LessonContent(type: "image", data: "assets/img/chord_example_1.png"),
    LessonContent(type: "text", data: "Intervals are the building blocks of chords."),
  ];

  Widget _buildContent(LessonContent content) {
    switch (content.type) {
      case "text":
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            content.data,
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
        );
      case "image":
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Image.asset(content.data),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ScreenHeader(title: "Lesson"),
              const SizedBox(height: 16),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.appOrange.withAlpha(50), 
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListView.builder(
                    itemCount: lessonContent.length,
                    itemBuilder: (context, index) {
                      return _buildContent(lessonContent[index]);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}