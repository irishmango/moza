import 'package:flutter/material.dart';
import 'package:moza/features/chapters/presentation/widgets/lessons_grid.dart';
import 'package:moza/features/topics/presentation/widgets/topic_tile.dart';
import 'package:moza/placeholders/coming_soon.dart';
import 'package:moza/shared/header_expand.dart';
import 'package:moza/theme.dart';

class LessonView extends StatelessWidget {
  const LessonView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          // heading
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Lessons", style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          
          // lessons available
          LessonsGrid()

        


        ],
      ),
    );
  }
}