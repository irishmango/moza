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


Future<void> migrateLessonBlocks(String lessonId) async {
  final db = FirebaseFirestore.instance;
  final lessonRef = db.collection('lessons').doc(lessonId);

  final snap = await lessonRef.get();
  if (!snap.exists) return;
  final data = snap.data() as Map<String, dynamic>;
  final List blocks = (data['blocks'] as List?) ?? [];

  if (blocks.isEmpty) {
    print("No blocks to migrate for $lessonId");
    return;
  }

  final batch = db.batch();

  for (var i = 0; i < blocks.length; i++) {
    final block = Map<String, dynamic>.from(blocks[i] as Map);
    block['index'] = i; // ensure ordering
    final id = i.toString().padLeft(3, '0'); // 000,001,002...
    final blockRef = lessonRef.collection('blocks').doc(id);
    batch.set(blockRef, block);
  }

  // remove old blocks array (optional)
  batch.update(lessonRef, {'blocks': FieldValue.delete()});

  await batch.commit();
  print("Migrated ${blocks.length} blocks to subcollection for $lessonId");
}

}