import 'package:flutter/material.dart';
import 'package:moza/src/features/chapters/presentation/widgets/quiz_list.dart';
import 'package:moza/src/features/quiz/domain/quiz.dart';
import 'package:moza/src/models/database_repository.dart';


class QuizView extends StatelessWidget {
  final List<Quiz> quizzes;
  final String topicId;
  final String chapterId;

  const QuizView({
    required this.quizzes,
    required this.topicId,
    required this.chapterId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                "Quizzes",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Expanded(child: QuizList(
            quizzes: quizzes,
            topicId: topicId,
            chapterId: chapterId,
          )),
        ],
      ),
    );
  }
}