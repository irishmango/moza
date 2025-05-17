class QuizResult {
  final String userId;
  final String quizId;
  final int score; 
  final Duration timeTaken;
  final DateTime dateTaken;

  QuizResult({
    required this.userId,
    required this.quizId,
    required this.score,
    required this.timeTaken,
    required this.dateTaken,
  });

  @override
  String toString() {
    return 'QuizResult(userId: $userId, quizId: $quizId, score: $score, timeTaken: ${timeTaken.inSeconds}s, dateTaken: $dateTaken)';
  }
}