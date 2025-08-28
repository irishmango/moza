// topics_grid.dart
import 'package:flutter/material.dart';
import 'package:moza/src/features/topics/domain/topic.dart';
import 'package:moza/src/features/topics/presentation/screens/topic_details.dart';
import 'package:moza/src/features/topics/presentation/widgets/topic_tile.dart';
import 'package:moza/src/models/database_repository.dart';

class TopicsGrid extends StatelessWidget {
  final int? limit;
  final bool scrollable;
  final List<Topic> topics;        
  final DatabaseRepository? db;   

  TopicsGrid({
    super.key,
    this.limit,
    this.scrollable = true,
    required this.topics,
    this.db,
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
          path: () => TopicDetails(topic: topic, db: db!), 
          color: colors[index % colors.length],
        );
      }).toList(),
    );
  }
}