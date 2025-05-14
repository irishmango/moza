import 'package:flutter/material.dart';
import 'package:moza/features/chapters/presentation/screens/chapter_screen.dart';
import 'package:moza/features/chapters/presentation/widgets/chapter_card.dart';
import 'package:moza/placeholders/coming_soon.dart';
import 'package:moza/shared/custom_scaffold.dart';
import 'package:moza/shared/screen_header.dart';
import 'package:moza/theme.dart';


class TopicChapters extends StatelessWidget {
  const TopicChapters({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body:  SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
              child: Column(
                children: [
                  ScreenHeader(
                    title: "Topics Chapters", 
                    ),
                  SizedBox(height: 8,),
                  Column(
                    spacing: 8,
                    children: [
                    ChapterCard(color: AppColors.appLightBlue, buttonColor: AppColors.appLightBlueAccent, title: "Chord Construction\n& Recognition", duration: "1 Hr 15 Mins", lessonAmount: "8 Lessons", description: "Description", path: ChapterScreen()),
                    ChapterCard(color: AppColors.appBlue, buttonColor: AppColors.appBlueAccent, title: "Chord Construction\n& Recognition", duration: "1 Hr 15 Mins", lessonAmount: "8 Lessons", description: "Description", path: ComingSoon()),
                    ChapterCard(color: AppColors.appOrange, buttonColor: AppColors.appOrangeAccent, title: "Chord Construction\n& Recognition", duration: "1 Hr 15 Mins", lessonAmount: "8 Lessons", description: "Description", path: ComingSoon()),
                     ],
                  )
                ],
                    ),
            )
          ),
    );
  }
}