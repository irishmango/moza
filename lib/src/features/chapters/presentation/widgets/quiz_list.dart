import 'package:flutter/material.dart';
import 'package:moza/src/features/quiz/domain/quiz.dart';
import 'package:moza/src/features/quiz/presentation/screens/quiz_screen.dart';
import 'package:moza/theme.dart';
import 'package:moza/src/models/database_repository.dart';

class QuizList extends StatelessWidget {
  final List<Quiz> quizzes;
  final String topicId;
  final String chapterId;

  const QuizList({
    required this.quizzes,
    required this.topicId,
    required this.chapterId,
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
          child: QuizTile(
            quiz: quiz,
            topicId: topicId,
            chapterId: chapterId,
          ),
        );
      },
    );
  }
}

class QuizTile extends StatelessWidget {
  final Quiz quiz;
  final String topicId;
  final String chapterId;
  const QuizTile({super.key, required this.quiz, required this.topicId, required this.chapterId});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => QuizScreen(
              topicId: topicId,
              chapterId: chapterId,
              quizId: quiz.id,
            ),
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