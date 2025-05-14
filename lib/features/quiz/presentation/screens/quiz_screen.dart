import 'package:flutter/material.dart';
import 'package:moza/features/quiz/domain/dummy_quiz.dart';
import 'package:moza/features/quiz/presentation/widgets/progress_bar.dart';
import 'package:moza/shared/custom_scaffold_quiz.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int? selectedIndex;
  bool isAnswered = false;
  bool hasChecked = false;
  int result = 0;

  @override
  Widget build(BuildContext context) {
    final currentQuestion = quiz[currentQuestionIndex];
    
    return CustomScaffoldQuiz(
      body: SafeArea(
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            ProgressBar(),
            SizedBox(height: 16,),

            Container(
              decoration: BoxDecoration(
                border: Border.all()
              ),
              child: Column(
                children: [
                      SizedBox(height: 60,),
                      Text(currentQuestion.question, style: TextStyle(fontSize: 20),),
                      SizedBox(height: 54,),
                      if (currentQuestion.imagePath != null) 
                      SizedBox(height: 114, width: 200, child: Image.asset(currentQuestion.imagePath!), 
                      ),
                    ],
              ),
            ),


          ],
        ),
        )),
    );
  }
}