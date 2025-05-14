import 'package:flutter/material.dart';
import 'package:moza/shared/general_background.dart';
import 'package:moza/shared/quiz_background.dart';

class CustomScaffoldQuiz extends StatelessWidget {
  final Widget? body;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;

  const CustomScaffoldQuiz({
    super.key,
    this.body,
    this.appBar,
    this.floatingActionButton,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      body: Stack(
        children: [
          const QuizBackground(),
          if (body != null) body!,
        ],
      ),
    );
  }
}