import 'package:flutter/material.dart';
import 'package:moza/features/quiz/presentation/screens/quiz_screen.dart';
import 'package:moza/features/topics/presentation/screens/topic_details.dart';
import 'package:moza/placeholders/coming_soon.dart';
import 'package:moza/features/topics/presentation/widgets/topic_tile.dart';
import 'package:moza/theme.dart';

class QuizList extends StatelessWidget {

  const QuizList(
    {super.key, 
    });

   

  @override
  Widget build(BuildContext context) {
    final allQuizzes = [
      QuizTile(title: "Cadences 101"),
      QuizTile(title: "Perfect or Plagal?"),
      QuizTile(title: "Cadences in context"),
      QuizTile(title: "Ultimate Cadence Quiz")
    ];


    return
        // topics grid
        ListView.builder(
          // physics: NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 8),
          itemCount: allQuizzes.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: allQuizzes[index],
            );
          },
    );
  }
}


class QuizTile extends StatelessWidget {
  final String title;

  const QuizTile({
    required this.title,
    super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (ctx) => QuizScreen()));
      },
          child: Container(
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              boxShadow: [BoxShadow(
              color: Colors.black.withValues(alpha: 0.5),
              offset: Offset(0, 4),
              spreadRadius: 0,
              blurRadius: 4,
            )
            ],
              color: AppColors.appGreenAccent,

            ),
            child: Center(
              child: 
              Text(title, style: TextStyle(color: AppColors.appWhite, fontWeight: FontWeight.w600),)),
          ),
        );
  }
}
