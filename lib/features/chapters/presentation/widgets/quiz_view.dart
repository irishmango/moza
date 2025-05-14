import 'package:flutter/material.dart';
import 'package:moza/features/chapters/presentation/widgets/quiz_list.dart';


class QuizView extends StatelessWidget {
  const QuizView({super.key});

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
          
          
          Expanded(child: QuizList())
        


        ],
      ),
    );
  }
}