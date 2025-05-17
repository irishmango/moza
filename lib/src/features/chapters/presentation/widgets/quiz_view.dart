import 'package:flutter/material.dart';
import 'package:moza/src/features/chapters/presentation/widgets/quiz_list.dart';
import 'package:moza/src/features/quiz/domain/quiz.dart';


class QuizView extends StatelessWidget {
  final List<Quiz> quizzes;

  const QuizView({
    required this.quizzes,
    super.key});

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
              Text("Quizzes", style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          
          
          Expanded(child: QuizList(quizzes: quizzes,))
        


        ],
      ),
    );
  }
}