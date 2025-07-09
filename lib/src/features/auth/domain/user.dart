import 'package:moza/src/features/quiz/domain/quiz_result.dart';

class User {
  final String id;                 
  final String firstName;
  final String lastName;
  final int age;
  final String email;
  int xp;                          

  List<String> bookmarkedLessonIds;  
  List<String> completedLessonIds;   
  List<String> completedQuizIds;
  List<String> achievments;   

  Map<String, QuizResult> quizResults; 

  DateTime createdAt;
  DateTime lastActiveAt;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.email,
    this.xp = 0,
    this.achievments = const [],
    this.bookmarkedLessonIds = const [],
    this.completedLessonIds = const [],
    this.completedQuizIds = const [],
    this.quizResults = const {},
    DateTime? createdAt,
    DateTime? lastActiveAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        lastActiveAt = lastActiveAt ?? DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
      'email': email,
      'xp': xp,

    };
  }

}