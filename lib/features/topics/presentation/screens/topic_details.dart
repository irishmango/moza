import 'package:flutter/material.dart';
import 'package:moza/features/chapters/presentation/screens/topic_chapters.dart';
import 'package:moza/features/chapters/presentation/widgets/chapter_card.dart';
import 'package:moza/features/topics/presentation/widgets/topic_main_card.dart';
import 'package:moza/placeholders/coming_soon.dart';
import 'package:moza/shared/custom_scaffold.dart';
import 'package:moza/shared/header_expand.dart';
import 'package:moza/shared/screen_header.dart';

class TopicDetails extends StatelessWidget {
  const TopicDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                ScreenHeader(title: "Topics Details",),
        
                const SizedBox(height: 16),
        
                TopicMainCard(),
        
                const SizedBox(height: 16),
        
                Column(
                  children: [
                    HeaderExpand(title: "Chapters", path: TopicChapters()),
                    const SizedBox(height: 16),
        
                    SizedBox(
                          height: 600,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                right: 0,
                                child: ChapterCard(color: Color(0xFFE5EDFF), buttonColor: Color(0xFFBED2FF), title: "Chord Construction\n& Recognition", duration: "1 Hr 15 Mins", lessonAmount: "8 Lessons", description: "Description", path: ComingSoon())),
                              Positioned(
                                left: 0,
                                right: 0,
                                top: 140,
                                child: ChapterCard(color: Color(0xFF3C79D0), buttonColor: Color(0xFF0056D1), title: "Chord Construction\n& Recognition", duration: "1 Hr 15 Mins", lessonAmount: "8 Lessons", description: "Description", path: ComingSoon())),
                              Positioned(
                                left: 0,
                                right: 0,
                                top: 280,
                                child: ChapterCard(color: Color(0xFFF9AC4F), buttonColor: Color(0xFFFF8D00), title: "Chord Construction\n& Recognition", duration: "1 Hr 15 Mins", lessonAmount: "8 Lessons", description: "Description", path: ComingSoon()))
                            ]
                          ),
                        )
                    
                  ],
                )
              ],
            ),
          )),
      )
      );
  }
}