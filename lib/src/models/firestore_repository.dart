import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moza/src/features/auth/domain/app_user.dart';
import 'package:moza/src/features/chapters/domain/chapter.dart';
import 'package:moza/src/features/lessons/domain/lesson.dart';
import 'package:moza/src/features/quiz/domain/quiz.dart';
import 'package:moza/src/features/quiz/domain/quiz_result.dart';
import 'package:moza/src/features/topics/domain/topic.dart';
import 'package:moza/src/models/database_repository.dart';

class FirestoreRepository implements DatabaseRepository {
  @override
  Future<void> addUser(AppUser user) {
    // TODO: implement addUser
    throw UnimplementedError();
  }

  @override
  Future<List<Quiz>> getAllQuizzes() {
    // TODO: implement getAllQuizzes
    throw UnimplementedError();
  }

  @override
  Future<List<Topic>> getAllTopics() {
    // TODO: implement getAllTopics
    throw UnimplementedError();
  }

  @override
  Future<List<Chapter>> getChapters(String topicId) {
    // TODO: implement getChapters
    throw UnimplementedError();
  }

  @override
  Future<List<LessonContent>> getLessonContent(String lessonId) {
    // TODO: implement getLessonContent
    throw UnimplementedError();
  }

  @override
  Future<List<Lesson>> getLessons(String chapterId) {
    // TODO: implement getLessons
    throw UnimplementedError();
  }

  @override
  Future<Quiz> getQuiz(String quizId) {
    // TODO: implement getQuiz
    throw UnimplementedError();
  }

  @override
  Future<List<Quiz>> getQuizzes(String chapterId) {
    // TODO: implement getQuizzes
    throw UnimplementedError();
  }

  @override
  Future<List<QuizResult>> getUserQuizResults(String userId) {
    // TODO: implement getUserQuizResults
    throw UnimplementedError();
  }

  @override
  Future<void> saveQuizResult(QuizResult result) {
    // TODO: implement saveQuizResult
    throw UnimplementedError();
  }

}