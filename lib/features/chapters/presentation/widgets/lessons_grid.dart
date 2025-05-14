import 'package:flutter/material.dart';
import 'package:moza/features/lessons/presentation/screens/lesson_screen.dart';
import 'package:moza/features/topics/presentation/screens/topic_details.dart';
import 'package:moza/placeholders/coming_soon.dart';
import 'package:moza/features/topics/presentation/widgets/topic_tile.dart';

class LessonsGrid extends StatelessWidget {


  const LessonsGrid(
    {super.key, 
    });

   

  @override
  Widget build(BuildContext context) {
    final allLessons = [
      TopicTile(title: "Cadences 101", color: Color(0xFFE5EDFF), path: () => LessonScreen(),),
      TopicTile(title: "Cadences in context", color: Color(0xFFE5EDFF), path: () => ComingSoon(),),
      TopicTile(title: "Deceptive Cadences", color: Color(0xFFE5EDFF), path: () => ComingSoon(),),
      TopicTile(title: "Famous Cadences", color: Color(0xFFE5EDFF), path: () => ComingSoon(),),
    ];

    

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
          physics: NeverScrollableScrollPhysics(),
          children: allLessons,
        ),
        
      ],
    );
  }
}

