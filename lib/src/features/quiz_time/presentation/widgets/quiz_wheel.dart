import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class QuizWheel extends StatefulWidget {
  final StreamController<int> controller;
  final List<String> topics;

  const QuizWheel({
    super.key,
    required this.controller,
    required this.topics,
  });

  @override
  State<QuizWheel> createState() => _QuizWheelState();
}

class _QuizWheelState extends State<QuizWheel> {
  void _navigateToQuiz(String topic) {
    
    // add navigation later. Dont touch until you figure out how to stop spinning when opening quiztimescreen page!!!
    
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 600,
      child: FortuneWheel(
        selected: widget.controller.stream,
        items: widget.topics.isEmpty 
            ? [FortuneItem(child: Text("No topics selected"))] 
            : widget.topics.map((topic) {
                int index = widget.topics.indexOf(topic);
                return FortuneItem(
                  child: GestureDetector(
                    onTap: () => _navigateToQuiz(topic),
                    child: Text(
                      topic,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  style: FortuneItemStyle(
                    color: index.isEven ? Colors.orange : Colors.green,
                    borderColor: Colors.white,
                    borderWidth: 2,
                  ),
                );
              }).toList(),
        indicators: <FortuneIndicator>[
          FortuneIndicator(
            alignment: Alignment.topCenter,
            child: TriangleIndicator(
              color: Colors.purple,
            ),
          ),
        ],
      ),
    );
  }
}