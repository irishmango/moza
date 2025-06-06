import 'package:flutter/material.dart';
import 'package:moza/src/features/topics/domain/topic.dart';
import 'package:moza/src/features/topics/presentation/screens/topic_details.dart';
import 'package:moza/src/features/topics/presentation/widgets/topic_tile.dart';
import 'package:moza/src/models/database_repository.dart';

class TopicsGrid extends StatelessWidget {
  final int? limit;
  final bool scrollable;
  final DatabaseRepository db;

  TopicsGrid(
    {super.key, 
    this.limit,
    this.scrollable = true,
    required this.db,
    });

  final List<Color> colors = [
  const Color(0xFFE5EDFF), 
  const Color(0xFFF8765D), 
  const Color(0xFFF9AC4F), 
  const Color(0xFF3C79D0), 
  const Color(0xFF5CB573), 
  const Color.fromARGB(255, 200, 177, 146), 
  Colors.teal,
  Colors.deepPurple,
  Colors.blueAccent,
];

   

  @override
Widget build(BuildContext context) {
  return FutureBuilder<List<Topic>>(
    future: db.getAllTopics(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return Center(child: Text('Error: ${snapshot.error}'));
      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
        return const Center(child: Text('No topics found.'));
      }

      final topics = snapshot.data!;
      final topicsToDisplay = limit != null ? topics.take(limit!).toList() : topics;

      return GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        padding: const EdgeInsets.only(bottom: 8),
        shrinkWrap: true,
        physics: scrollable
            ? const BouncingScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        children: topicsToDisplay.asMap().entries.map((entry) {
          int index = entry.key;
          var topic = entry.value;

          return TopicTile(
            title: topic.title,
            path: () => TopicDetails(topic: topic, db: db),
            color: colors[index % colors.length],
          );
        }).toList(),
      );
    },
  );
}
}

