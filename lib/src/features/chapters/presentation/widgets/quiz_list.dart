import 'package:flutter/material.dart';
import 'package:moza/src/features/quiz/domain/quiz.dart';
import 'package:moza/src/features/quiz/presentation/screens/quiz_screen.dart';
import 'package:moza/theme.dart';

class QuizList extends StatelessWidget {
  final List<Quiz> quizzes;

  const QuizList({
    required this.quizzes,
    super.key, 
    });

   

  @override
  Widget build(BuildContext context) {

    return
        // topics grid
        ListView.builder(
          // physics: NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 8),
          itemCount: quizzes.length,
          itemBuilder: (context, index) {
            final quiz = quizzes[index];

            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: QuizTile(quiz: quiz),
            );
          },
    );
  }
}


class QuizTile extends StatelessWidget {
  final Quiz quiz;

  const QuizTile({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => QuizScreen(quiz: quiz,),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(25),
              offset: const Offset(0, 4),
              blurRadius: 4,
            ),
          ],
          color: AppColors.appGreenAccent,
        ),
        child: Center(
          child: Text(
            quiz.title,
            style: TextStyle(
              color: AppColors.appWhite,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
