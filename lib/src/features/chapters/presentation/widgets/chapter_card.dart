import 'package:flutter/material.dart';
import 'package:moza/src/features/chapters/domain/chapter.dart';
import 'package:moza/src/shared/learn_path_provider.dart';
import 'package:moza/src/shared/open_card_button.dart';
import 'package:moza/theme.dart';
import 'package:provider/provider.dart';

class ChapterCard extends StatelessWidget {
  final Chapter chapter;
  final Color color;
  final Color buttonColor;
  final Widget path;
  final VoidCallback method;

  const ChapterCard({
    required this.chapter,
    required this.color,
    required this.buttonColor,
    required this.path,
    required this.method,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 244,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(50),
            offset: const Offset(0, 4),
            spreadRadius: 0,
            blurRadius: 4,
          ),
          BoxShadow(
            color: const Color.fromARGB(255, 84, 83, 83).withAlpha(50),
            offset: const Offset(0, -1),
            spreadRadius: 0,
            blurRadius: 4,
          ),
        ],
        color: color,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    chapter.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                OpenCardButton(
                  color: buttonColor,
                  onPressed: () {
                    // SAVE the tapped chapter title
                    context.read<LearnPath>().setChapterTitle(chapter.title);

                    // your existing behavior
                    method();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => path),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              "${chapter.lessons.length} Lessons",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: AppColors.textColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              chapter.description,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic,
                fontSize: 16,
                color: AppColors.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}