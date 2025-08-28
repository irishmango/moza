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

  final _db = FirebaseFirestore.instance;

  @override
  Future<List<Topic>> getAllTopics() async {
    final snap = await _db.collection('topics').orderBy('title').get();
    return snap.docs.map((d) {
      return Topic(
        id: d.id,
        title: (d.data()['title'] ?? '').toString(),
        chapters: const [],
        availableXP: (d.data()['availableXP'] ?? 0).toString(),
      );
    }).toList();
  }

  @override
  Future<List<Chapter>> getChapters(String topicId) async {
    final ref = _db.collection('topics').doc(topicId).collection('chapters');
    final snap = await ref.orderBy('title').get();
    return snap.docs.map((d) {
      return Chapter(
        id: d.id,
        title: (d.data()['title'] ?? '').toString(),
        description: (d.data()['description'] ?? '').toString(),
        lessons: const [], 
        quizzes: const [], 
      );
    }).toList();
  }

  @override
  Future<List<Lesson>> getLessons(String topicId, String chapterId) async {
    final ref = _db.collection('topics')
      .doc(topicId)
      .collection('chapters')
      .doc(chapterId)
      .collection('lessons'); 

    final snap = await ref.orderBy('title').get();
    return snap.docs.map((d) {
      return Lesson(
        id: d.id,
        title: (d.data()['title'] ?? '').toString(),
        slug:  (d.data()['slug']  ?? '').toString(),
        content: [],
        // etc...
      );
    }).toList();
  }


  @override
  Future<List<LessonContent>> getLessonContent(String lessonId) {
    // TODO: implement getLessonContent
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