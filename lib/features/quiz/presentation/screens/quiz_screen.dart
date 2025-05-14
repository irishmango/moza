import 'package:flutter/material.dart';
import 'package:moza/features/quiz/domain/dummy_quiz.dart';
import 'package:moza/features/quiz/presentation/screens/quiz_results_screen.dart';
import 'package:moza/features/quiz/presentation/widgets/heading_w_progress_bar.dart';
import 'package:moza/features/quiz/presentation/widgets/quiz_choice_button.dart';
import 'package:moza/features/quiz/presentation/widgets/quiz_main_button.dart';
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
              
              child: Column(
                children: [
                      SizedBox(height: 60,),
                      Text(currentQuestion.question, style: TextStyle(fontSize: 20),),
                      SizedBox(height: 54,),
                      if (currentQuestion.imagePath != null) 
                      SizedBox(height: 114, width: 200, child: Image.asset(currentQuestion.imagePath!), 
                      ),

                      SizedBox(height: 40,),
                      ...List.generate(currentQuestion.options.length, (index) {
                      final isSelected = selectedIndex == index;
                      final isCorrect = currentQuestion.correctIndex == index;
                      final answered = isAnswered;

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: QuizChoiceButton(
                          text: currentQuestion.options[index],
                          isSelected: isSelected,
                          isCorrect: isCorrect,
                          isAnswered: isAnswered,
                          onPressed: () {
                            if (!answered) {
                              setState(() {
                                selectedIndex = index;
                              });
                            }
                          }
                        ),
                      );
                    }),

                    SizedBox(height: 45),

                    QuizMainButton(
                      onPressed: selectedIndex == null && !hasChecked
                          ? null
                          : () {
                              setState(() {
                                if (!hasChecked) {
                                  hasChecked = true;
                                  isAnswered = true;
                                } else {
                                  if (selectedIndex == currentQuestion.correctIndex) {
                                    result++;
                                  }

                                  if (currentQuestionIndex < quiz.length - 1) {
                                    currentQuestionIndex++;
                                    selectedIndex = null;
                                    hasChecked = false;
                                    isAnswered = false;
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => QuizResultsScreen(
                                          result: result,
                                          total: quiz.length,
                                        ),
                                      ),
                                    );
                                  }
                                }
                              });
                            },
                      hasChecked: hasChecked,
                    )


                    ],
              ),
            ),


          ],
        ),
        )),
    );
  }
}