import 'package:flutter/material.dart';
import 'package:moza/theme.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key});

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
        // First Container: Icon
        Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                _showExitDialog(context);
              },
              icon: const Icon(Icons.close, size: 40),
            ),
          ),
        ),

        // Second Container: Progress Bar
        Expanded(
          flex: 4,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 240,
                height: 16,
                decoration: BoxDecoration(
                  color: AppColors.appOrange.withAlpha(85),
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 50,
                  height: 16,
                  decoration: BoxDecoration(
                    color: AppColors.appOrange,
                    borderRadius: BorderRadius.circular(22),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Third Container: Empty 
        const Expanded(
          flex: 1,
          child: SizedBox(),
        ),
      ],
    );
  }
}