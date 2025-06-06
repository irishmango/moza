import 'package:flutter/material.dart';
import 'package:moza/src/features/chapters/domain/chapter.dart';
import 'package:moza/src/features/chapters/presentation/screens/chapter_screen.dart';
import 'package:moza/src/features/chapters/presentation/widgets/chapter_card.dart';
import 'package:moza/src/features/topics/domain/topic.dart';
import 'package:moza/src/features/topics/presentation/widgets/topic_main_card.dart';
import 'package:moza/src/models/database_repository.dart';
import 'package:moza/src/shared/custom_scaffold.dart';
import 'package:moza/src/shared/header_expand.dart';
import 'package:moza/src/shared/screen_header.dart';
import 'package:moza/theme.dart';

class TopicDetails extends StatefulWidget {
  final Topic topic;
  final DatabaseRepository db;

  const TopicDetails({super.key, required this.topic, required this.db});

  @override
  State<TopicDetails> createState() => _TopicDetailsState();
}

class _TopicDetailsState extends State<TopicDetails> {
  bool isExpanded = false;
  late Future<List<Chapter>> _chaptersFuture;

  void toggleExpand() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  void initState() {
    super.initState();
    _chaptersFuture = widget.db.getChapters(widget.topic.id);
  }

  final List<Color> colors = [
    AppColors.appLightBlue,
    AppColors.appBlue,
    AppColors.appOrange,
  ];

  final List<Color> buttonColors = [
    AppColors.appLightBlueAccent,
    AppColors.appBlueAccent,
    AppColors.appOrangeAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Chapter>>(
      future: _chaptersFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No chapters found.'));
        }

        final chapters = snapshot.data!;

        const double baseHeight = 220;
        const double spacing = 30;
        double expandedHeight =
            (baseHeight * chapters.length) + (spacing * (chapters.length - 1));

        return CustomScaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ScreenHeader(title: widget.topic.title),
                    const SizedBox(height: 16),
                    TopicMainCard(topic: widget.topic),
                    const SizedBox(height: 16),
                    HeaderExpand(
                      title: "Chapters",
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
                                chapter: chapters[i],
                                method: toggleExpand,
                                color: colors[i % colors.length],
                                buttonColor:
                                    buttonColors[i % buttonColors.length],
                                path: ChapterScreen(
                                  db: widget.db,
                                  chapter: chapters[i],
                                ),
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
      },
    );
  }
}