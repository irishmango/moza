import 'package:moza/src/features/lessons/domain/lesson.dart';
import 'package:moza/src/features/quiz/domain/quiz.dart';
import 'package:moza/src/features/quiz/domain/quiz_result.dart';
import 'package:moza/src/features/topics/domain/topic.dart';
import 'package:moza/src/features/chapters/domain/chapter.dart';

abstract class DatabaseRepository {

  /// Get all topics
  List<Topic> getAllTopics();

  /// Get chapters within a specific topic
  List<Chapter> getChapters(String topicId);

  /// Get lessons within a specific chapter
  List<Lesson> getLessons(String chapterId);

  /// Get quizzes within a specific chapter
  List<Quiz> getQuizzes(String chapterId);

  /// Get content for a specific lesson
  List<LessonContent> getLessonContent(String lessonId);

  /// Get all quizzes (across all topics/chapters)
  List<Quiz> getAllQuizzes();

  /// Save quiz results
  void saveQuizResult(QuizResult result);

  /// Get quiz results for a specific user
  List<QuizResult> getUserQuizResults(String userId);
}