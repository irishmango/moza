import 'package:flutter/material.dart';
import 'package:moza/features/chapters/presentation/screens/chapter_screen.dart';
import 'package:moza/features/quiz/presentation/screens/quiz_screen.dart';
import 'package:moza/features/quiz/presentation/widgets/quiz_main_button.dart';
import 'package:moza/shared/custom_scaffold_quiz.dart';
import 'package:moza/theme.dart';

class QuizResultsScreen extends StatelessWidget {
  final int result;
  final int total;

  const QuizResultsScreen({
    required this.result,
    required this.total,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldQuiz(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 20,
          children: [Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 350,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.appWhite.withAlpha(50),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: AppColors.appBlueAccent.withAlpha(50),
                width: 2
              )
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 16,
              children: [
                Center(
                  child: Text(
                    "Finished!",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.appGreen,
                    ),
                  ),
                ),
                SizedBox(height: 24,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text("Result:", 
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),),
                  Text("$result / $total",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),)
                ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Time:",
                      style: TextStyle(fontSize: 16)),
                    const Text(
                      "6:17",
                      style: TextStyle(fontSize: 16)), 
                      ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "XP Points:",
                      style: TextStyle(fontSize: 16)),
                    const Text(
                      "32",
                      style: TextStyle(fontSize: 16)), 
                      ],
                ),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: [
              QuizMainButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => QuizScreen()),
                    (route) => false, 
                  );
                  },
                  hasChecked: false,
                  text: "Restart Quiz",
              ),
              QuizMainButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const ChapterScreen()),
                    (route) => false,
                  );
                },
                hasChecked: false,
                  text: "Finish",
              ),
            ],
          )
          ]
        ),
      ),
    );
  }
}