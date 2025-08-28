import 'package:flutter/material.dart';
import 'package:moza/src/features/topics/domain/topic.dart';

class TopicMainCard extends StatelessWidget {
  final Topic topic;

  const TopicMainCard({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(50),
            offset: Offset(0, 4),
            spreadRadius: 0,
            blurRadius: 4,
          )
        ],
        gradient: const LinearGradient(
          colors: [Color(0xFF58B270), Color.fromARGB(255, 126, 213, 149)],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          spacing: 12,
          children: [
            // Title Row
            Row(
              children: [
                Expanded(
                  child: Text(
                    topic.title,
                    style: const TextStyle(
                      height: 1,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  topic.description,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                  ),
                ),
              ),

            Row(
              children: [
                Text("• Complete this course to get ${topic.availableXP}", style: TextStyle(fontWeight: FontWeight.w600)),
              ],
            ),

            // Duration Info
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 132,
                  height: 44,
                  // padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(150),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      _calculateTotalDuration(),
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

String _calculateTotalDuration() {
  int totalMinutes = 0;

  for (var chapter in topic.chapters) {
    totalMinutes += chapter.lessons.length * 15; 
  }

  int hours = totalMinutes ~/ 60;
  int minutes = totalMinutes % 60;

  return "$hours Hrs $minutes Mins";
}
}