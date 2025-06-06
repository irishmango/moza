import 'package:flutter/material.dart';
import 'package:moza/src/features/lessons/domain/lesson.dart';
import 'package:moza/src/shared/custom_scaffold.dart';
import 'package:moza/src/shared/screen_header.dart';
import 'package:moza/theme.dart';
import 'package:moza/src/models/database_repository.dart';

class LessonScreen extends StatefulWidget {
  final String lessonId;
  final DatabaseRepository db;

  const LessonScreen({
    required this.lessonId,
    required this.db,
    super.key,
  });

  @override
  _LessonScreenState createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  late Future<List<LessonContent>> _lessonContentFuture;

  @override
  void initState() {
    super.initState();
    _lessonContentFuture = widget.db.getLessonContent(widget.lessonId);
  }

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
    return FutureBuilder<List<LessonContent>>(
      future: _lessonContentFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No content found.'));
        }

        final lessonContent = snapshot.data!;

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
      },
    );
  }
}