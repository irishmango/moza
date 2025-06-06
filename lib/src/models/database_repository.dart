import 'package:moza/src/features/lessons/domain/lesson.dart';
import 'package:moza/src/features/quiz/domain/quiz.dart';
import 'package:moza/src/features/quiz/domain/quiz_result.dart';
import 'package:moza/src/features/topics/domain/topic.dart';
import 'package:moza/src/features/chapters/domain/chapter.dart';

abstract class DatabaseRepository {

  /// Get all topics
  Future<List<Topic>> getAllTopics();

  /// Get chapters within a specific topic
  Future<List<Chapter>> getChapters(String topicId);

  /// Get lessons within a specific chapter
  Future<List<Lesson>> getLessons(String chapterId);

  /// Get quizzes within a specific chapter
  Future<List<Quiz>> getQuizzes(String chapterId);

  /// Get content for a specific lesson
  Future<List<LessonContent>> getLessonContent(String lessonId);

  /// Get all quizzes (across all topics/chapters)
  Future<List<Quiz>> getAllQuizzes();

  /// Get singular quiz
  Future<Quiz> getQuiz(String quizId);

  /// Save quiz results
  Future<void> saveQuizResult(QuizResult result);

  /// Get quiz results for a specific user
  Future<List<QuizResult>> getUserQuizResults(String userId);
}