import 'package:flutter/material.dart';
import 'package:moza/features/chapters/presentation/screens/chapter_screen.dart';
import 'package:moza/features/chapters/presentation/screens/topic_chapters.dart';
import 'package:moza/features/chapters/presentation/widgets/chapter_card.dart';
import 'package:moza/features/topics/presentation/widgets/topic_main_card.dart';
import 'package:moza/shared/custom_scaffold.dart';
import 'package:moza/shared/header_expand.dart';
import 'package:moza/shared/screen_header.dart';

class TopicDetails extends StatefulWidget {
  const TopicDetails({super.key});

  @override
  State<TopicDetails> createState() => _TopicDetailsState();
}

class _TopicDetailsState extends State<TopicDetails> {
  bool isExpanded = false;

  void toggleExpand() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

@override
  void dispose() {
    isExpanded = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> chapters = [
      {
        "title": "Chord Construction\n& Recognition",
        "color": const Color(0xFFE5EDFF),
        "buttonColor": const Color(0xFFBED2FF),
        "duration": "1 Hr 15 Mins",
        "lessonAmount": "8 Lessons",
      },
      {
        "title": "Advanced Chords",
        "color": const Color(0xFF3C79D0),
        "buttonColor": const Color(0xFF0056D1),
        "duration": "1 Hr",
        "lessonAmount": "6 Lessons",
      },
      {
        "title": "Chord Analysis",
        "color": const Color(0xFFF9AC4F),
        "buttonColor": const Color(0xFFFF8D00),
        "duration": "45 Mins",
        "lessonAmount": "4 Lessons",
      },
    ];

    const double baseHeight = 220;
    const double spacing = 30;
    double expandedHeight = (baseHeight * chapters.length) + (spacing * (chapters.length - 1));

    return CustomScaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ScreenHeader(title: "Topics Details"),
                const SizedBox(height: 16),

                const TopicMainCard(),
                const SizedBox(height: 16),

                HeaderExpand(
                  title: "Chapters",
                  path: const TopicChapters(),
                  isExpanded: isExpanded,
                  toggleExpand: toggleExpand,
                ),
                const SizedBox(height: 16),

                SizedBox(
                  height: isExpanded ? expandedHeight : 420,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      for (int i = 0; i < chapters.length; i++)
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                          left: 0,
                          right: 0,
                          top: isExpanded 
                              ? (baseHeight + spacing) * i 
                              : 115.0 * i,
                          child: ChapterCard(
                            color: chapters[i]["color"],
                            buttonColor: chapters[i]["buttonColor"],
                            title: chapters[i]["title"],
                            duration: chapters[i]["duration"],
                            lessonAmount: chapters[i]["lessonAmount"],
                            description: "Description",
                            path: ChapterScreen(),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}