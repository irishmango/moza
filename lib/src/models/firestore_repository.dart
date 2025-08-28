import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moza/src/features/auth/domain/app_user.dart';
import 'package:moza/src/features/chapters/domain/chapter.dart';
import 'package:moza/src/features/lessons/domain/lesson.dart';
import 'package:moza/src/features/quiz/domain/quiz.dart';
import 'package:moza/src/features/quiz/domain/quiz_result.dart';
import 'package:moza/src/features/topics/domain/topic.dart';
import 'package:moza/src/models/database_repository.dart';

class FirestoreRepository implements DatabaseRepository {
  final _db = FirebaseFirestore.instance;

  @override
  Future<void> addUser(AppUser user) {
    // TODO: implement addUser
    throw UnimplementedError();
  }

  @override
  Future<List<Quiz>> getAllQuizzes() async {
    final snap = await _db.collection('quizzes').get();

    final quizzes = await Future.wait(snap.docs.map((quizDoc) async {
      final questionsSnap = await quizDoc.reference.collection('questions').get();
      final questions = questionsSnap.docs.map((qDoc) {
        final data = qDoc.data();
        return Question(
          question: (data['question'] ?? '').toString(),
          options: List<String>.from(data['options'] ?? []),
          imagePath: data['imagePath']?.toString(),
          correctAnswerIndex: (data['correctAnswerIndex'] ?? 0) as int,
        );
      }).toList();

      return Quiz(
        id: quizDoc.id,
        title: (quizDoc.data()['title'] ?? '').toString(),
        questions: questions,
      );
    }));

    return quizzes;
  }

  

  @override
  Future<List<Topic>> getAllTopics() async {
    final snap = await _db.collection('topics').orderBy('title').get();
    return snap.docs.map((d) {
      return Topic(
        id: d.id,
        title: (d.data()['title'] ?? '').toString(),
        description: (d.data()['description'] ?? '').toString(),
        chapters: const [],
        availableXP: (d.data()['availableXP'] ?? 0).toString(),
      );
    }).toList();
  }

  @override
  Future<List<Chapter>> getChapters(String topicId) async {
    final ref = _db.collection('topics').doc(topicId).collection('chapters');
    final snap = await ref.orderBy('title').get();

    // pre load lessons for each chapter so chapter.lessons.length in chaptercard is correct
    final chapters = await Future.wait(snap.docs.map((d) async {
      final data = d.data();

      // Fetch lessons for this chapter 
      final lessonsSnap = await d.reference.collection('lessons').orderBy('title').get();
      final lessons = lessonsSnap.docs.map((ld) {
        final ldata = ld.data();
        return Lesson(
          id: ld.id,
          title: (ldata['title'] ?? '').toString(),
          slug:  (ldata['slug']  ?? '').toString(),
          content: const [],
        );
      }).toList();

      return Chapter(
        id: d.id,
        title: (data['title'] ?? '').toString(),
        description: (data['description'] ?? '').toString(),
        lessons: lessons,
        quizzes: const [],
      );
    }));

    return chapters;
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
      );
    }).toList();
  }


  @override
  Future<List<LessonContent>> getLessonContent(String lessonId) {
    // TODO: implement getLessonContent
    throw UnimplementedError();
  }

  @override
Future<Quiz> getQuiz(String topicId, String chapterId, String quizId) async {
  print('[FirestoreRepository] getQuiz called with topicId=$topicId, chapterId=$chapterId, quizId=$quizId');
  final quizRef = _db
      .collection('topics').doc(topicId)
      .collection('chapters').doc(chapterId)
      .collection('quizzes').doc(quizId);

  final quizDoc = await quizRef.get();
  if (!quizDoc.exists) {
    throw StateError('Quiz not found at path: $topicId/$chapterId/$quizId');
  }

  final quizData = quizDoc.data() ?? <String, dynamic>{};

  // Load questions in author-defined order
  final qSnap = await quizRef.collection('questions').orderBy('order').get();

  final questions = qSnap.docs.map((d) {
    final data = d.data();

    // robust index parsing
    final raw = data['correctAnswerIndex'];
    final idx = raw is int ? raw : int.tryParse(raw?.toString() ?? '') ?? 0;

    // normalize options: accept List OR Map (option-1, option-2, …)
    final dynamic optionsField = data['options'];
    List<String> options;
    if (optionsField is Iterable) {
      options = List<String>.from(optionsField);
    } else if (optionsField is Map) {
      final entries = optionsField.entries.toList()
        ..sort((a, b) {
          int numFromKey(String k) =>
              int.tryParse(RegExp(r'\d+').firstMatch(k)?.group(0) ?? '') ?? 0;
          return numFromKey(a.key).compareTo(numFromKey(b.key));
        });
      options = entries.map((e) => e.value.toString()).toList();
    } else if (optionsField != null) {
      options = [optionsField.toString()];
    } else {
      options = const <String>[];
    }

    return Question(
      question: (data['question'] ?? '').toString(),
      options: options,
      imagePath: data['imagePath']?.toString(),
      correctAnswerIndex: idx,
    );
  }).toList();

  return Quiz(
    id: quizDoc.id,
    title: (quizData['title'] ?? '').toString(),
    questions: questions,
  );
}

@override
Future<List<Quiz>> getQuizzes(String topicId, String chapterId) async {
  print('[FirestoreRepository] getQuizzes called with topicId=$topicId, chapterId=$chapterId');
  final snap = await _db
      .collection('topics').doc(topicId)
      .collection('chapters').doc(chapterId)
      .collection('quizzes')
      .orderBy('title')
      .get();

  return snap.docs.map((d) {
    final data = d.data();
    return Quiz(
      id: d.id,
      title: (data['title'] ?? '').toString(),
      questions: const [], 
    );
  }).toList();
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

  @override
  Future<Chapter?> getChapterByTitle(String topicId, String chapterTitle) async {
    final ref = _db.collection('topics').doc(topicId).collection('chapters');
    final snap = await ref.where('title', isEqualTo: chapterTitle).limit(1).get();

    if (snap.docs.isEmpty) return null;

    final d = snap.docs.first;
    final data = d.data();

    final lessonsSnap = await d.reference.collection('lessons').orderBy('title').get();
    final lessons = lessonsSnap.docs.map((ld) {
      final ldata = ld.data();
      return Lesson(
        id: ld.id,
        title: (ldata['title'] ?? '').toString(),
        slug: (ldata['slug'] ?? '').toString(),
        content: const [],
      );
    }).toList();

    return Chapter(
      id: d.id,
      title: (data['title'] ?? '').toString(),
      description: (data['description'] ?? '').toString(),
      lessons: lessons,
      quizzes: const [],
    );
  }
}