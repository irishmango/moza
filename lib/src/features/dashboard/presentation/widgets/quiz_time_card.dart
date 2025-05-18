import 'package:flutter/material.dart';
import 'package:moza/src/features/quiz_time/presentation/screens/quiz_time_screen.dart';

class QuizTimeCard extends StatelessWidget {
  const QuizTimeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
              builder: (context) => QuizTimeScreen()));
            },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(28)),
          color: const Color.fromARGB(255, 194, 119, 245),
          boxShadow: [BoxShadow(
                color: Colors.black.withValues(alpha: 0.4),
                offset: Offset(0, 4),
                spreadRadius: 0,
                blurRadius: 4,
              )
          ]
        ),
        width: double.infinity,
        height: 171,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
          child: Stack(
            children: [
              Positioned(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Quiz Time!", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                    Text("Test your knowledge!", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600))
                  ],
                ),
              ),
              Positioned(
                bottom: 16,
                right: 8,
                
                  
                  child: Image.asset('assets/img/quiz_wheel_mini.png', width: 124,))
       
              
            ],
          )
              
        )
      ),
    );
}
}

