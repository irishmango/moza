import 'package:flutter/material.dart';
import 'package:moza/src/features/quiz/presentation/widgets/progress_bar.dart';

class HeadingWithProgressBar extends StatelessWidget {
  final int currentIndex;
  final int total;

  const HeadingWithProgressBar({
    required this.currentIndex,
    required this.total,
    super.key,
  });

  void _showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text("Exit Quiz"),
          content: const Text("Are you sure you want to exit the quiz? Your progress will not be saved."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text("Stay"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
                Navigator.pop(context);
              },
              child: const Text(
                "Exit",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () => _showExitDialog(context),
              icon: const Icon(Icons.close, size: 40),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: ProgressBar(
            currentIndex: currentIndex,
            total: total,
          ),
        ),
        const Expanded(flex: 1, child: SizedBox()),
      ],
    );
  }
}