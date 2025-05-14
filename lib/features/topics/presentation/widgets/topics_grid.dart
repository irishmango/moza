import 'package:flutter/material.dart';
import 'package:moza/features/topics/presentation/screens/topic_details.dart';
import 'package:moza/placeholders/coming_soon.dart';
import 'package:moza/features/topics/presentation/widgets/topic_tile.dart';

class TopicsGrid extends StatelessWidget {
  final int? limit;
  final bool scrollable;

  const TopicsGrid(
    {super.key, 
    this.limit,
    this.scrollable = true
    });

   

  @override
  Widget build(BuildContext context) {
    final allTopics = [
      TopicTile(title: "Harmony & Chord Theory", color: Color(0xFFE5EDFF), path: () => TopicDetails(),),
      TopicTile(title: "Ear Training", color: Color(0xFFF8765D), path: () => ComingSoon(),),
      TopicTile(title: "Cadences", color: Color(0xFFF9AC4F), path: () => ComingSoon(),),
      TopicTile(title: "Music 101", color: Color(0xFF3C79D0), path: () => ComingSoon(),),
      TopicTile(title: "Bach Chorales", color: Color(0xFF5CB573), path: () => ComingSoon(),),
      TopicTile(title: "Ear Training", color: const Color.fromARGB(255, 200, 177, 146), path: () => ComingSoon(),),
      TopicTile(title: "Chords", color: Colors.teal, path: () => ComingSoon(),),
      TopicTile(title: "Music 101", color: Colors.deepPurple, path: () => ComingSoon(),),
      TopicTile(title: "Cadences", color: Colors.blueAccent, path: () => ComingSoon(),),
      TopicTile(title: "Ear Training", color: const Color.fromARGB(255, 200, 177, 146), path: () => ComingSoon(),),
      TopicTile(title: "Chords", color: Colors.teal, path: () => ComingSoon(),),
      TopicTile(title: "Music 101", color: Colors.deepPurple, path: () => ComingSoon(),),
    ];

    final topicsToDisplay = limit != null ? allTopics.take(limit!).toList() : allTopics;

    return Column(
      children: [
        // heading?
        
        SizedBox(height: 4,),
        
        // topics grid
        GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          padding: EdgeInsets.only(bottom: 8),
          shrinkWrap: true,
          physics: scrollable ? const BouncingScrollPhysics() : const NeverScrollableScrollPhysics(),
          children: topicsToDisplay,
        ),
        
      ],
    );
  }
}

