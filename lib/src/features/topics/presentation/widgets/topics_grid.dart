// lib/src/features/topics/presentation/widgets/topics_grid.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // 👈 add
import 'package:moza/src/models/database_repository.dart'; // 👈 add
import 'package:moza/src/features/topics/domain/topic.dart';
import 'package:moza/src/features/topics/presentation/screens/topic_details.dart';
import 'package:moza/src/features/topics/presentation/widgets/topic_tile.dart';

class TopicsGrid extends StatelessWidget {
  final int? limit;
  final bool scrollable;
  final List<Topic> topics;

  TopicsGrid({
    super.key,
    this.limit,
    this.scrollable = true,
    required this.topics,
  });

  final List<Color> colors = [
    Color(0xFFE5EDFF),
    Color(0xFFF8765D),
    Color(0xFFF9AC4F),
    Color(0xFF3C79D0),
    Color(0xFF5CB573),
    Color.fromARGB(255, 200, 177, 146),
    Colors.teal,
    Colors.deepPurple,
    Colors.blueAccent,
  ];

  @override
  Widget build(BuildContext context) {
    final items = limit != null ? topics.take(limit!).toList() : topics;
    final db = context.read<DatabaseRepository>(); 

    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      padding: const EdgeInsets.only(bottom: 8),
      shrinkWrap: true,
      physics: scrollable
          ? const BouncingScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      children: items.asMap().entries.map((entry) {
        final index = entry.key;
        final topic = entry.value;

        return TopicTile(
          title: topic.title,
          color: colors[index % colors.length],
          path: () => TopicDetails(topic: topic),
          onTap: () async {
            // Check for content
            try {
              final chapters = await db.getChapters(topic.id);
              final hasContent = chapters.isNotEmpty; 

              if (!hasContent) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Content coming soon for this topic!'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
                return; 
              }

              // navigate if content exists
              if (context.mounted) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => TopicDetails(topic: topic)),
                );
              }
            } catch (e) {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Could not load topic: $e'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              }
            }
          },
        );
      }).toList(),
    );
  }
}