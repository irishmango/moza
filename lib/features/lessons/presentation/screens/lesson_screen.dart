import 'package:flutter/material.dart';
import 'package:moza/shared/custom_scaffold.dart';
import 'package:moza/shared/custom_scaffold_quiz.dart';
import 'package:moza/shared/screen_header.dart';

class LessonScreen extends StatelessWidget {
  const LessonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(child:
      Padding(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          ScreenHeader(title: "Lesson"),
          const SizedBox(height: 16),

          Container(
            child: Text("Text Text Text Text"),
          )
        ],
      ),)),
    );
  }
}