import 'package:flutter/material.dart';
import 'package:moza/src/features/lessons/domain/lesson.dart';
import 'package:moza/src/shared/custom_scaffold.dart';
import 'package:moza/src/shared/screen_header.dart';
import 'package:moza/theme.dart';

class LessonScreen extends StatelessWidget {
  final Lesson lesson;

  LessonScreen({
    required this.lesson,
    super.key});


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
                    itemCount: lesson.content.length,
                    itemBuilder: (context, index) {
                      return _buildContent(lesson.content[index]);
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