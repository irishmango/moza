import 'package:flutter/material.dart';
import 'package:moza/src/features/quiz/domain/quiz.dart';
import 'package:moza/src/features/quiz/presentation/screens/quiz_screen.dart';
import 'package:moza/theme.dart';
import 'package:moza/src/models/database_repository.dart';

class QuizList extends StatelessWidget {
  final List<Quiz> quizzes;
  final DatabaseRepository db; 

  const QuizList({
    required this.quizzes,
    required this.db,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 8),
      itemCount: quizzes.length,
      itemBuilder: (context, index) {
        final quiz = quizzes[index];

        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: QuizTile(quiz: quiz, db: db),
        );
      },
    );
  }
}

class QuizTile extends StatelessWidget {
  final Quiz quiz;
  final DatabaseRepository db;  

  const QuizTile({
    super.key,
    required this.quiz,
    required this.db,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => QuizScreen(quizId: quiz.id, db: db),
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