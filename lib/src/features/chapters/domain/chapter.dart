
import 'package:moza/src/features/lessons/domain/lesson.dart';
import 'package:moza/src/features/quiz/domain/quiz.dart';

class Chapter {
  final String id;
  final String title;
  final String description;
  final List<Lesson> lessons;
  final List<Quiz> quizzes;

  Chapter({
    required this.id,
    required this.title,
    required this.description,
    required this.lessons,
    required this.quizzes,
  });
}