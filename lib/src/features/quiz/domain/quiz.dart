class Quiz {
  final String id;
  final String title;
  final List<Question> questions;

  Quiz({
    required this.id,
    required this.title,
    required this.questions,
  });
}


class Question {
  final String question;
  final List<String> options;
  final String? imagePath;
  final int correctAnswerIndex;

  Question({
    required this.question,
    required this.options,
    this.imagePath,
    required this.correctAnswerIndex,
  });
}

