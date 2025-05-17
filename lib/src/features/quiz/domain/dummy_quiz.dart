

class Question {
  final String question;
  final String? imagePath;
  final List<String> options;
  final int correctIndex;
  

  Question({required this.question, this.imagePath, required this.options, required this.correctIndex});

}

List<Question> quiz = [
  Question(question: "What kind of chord is this?", imagePath: 'assets/img/chord_example_1.png', options: ["Major", "Dominant", "Dominant 7th", "Diminished", ], correctIndex: 2),
  Question(question: "What interval is added to a major triad to form a dominant 7th chord?", options: ["Major 7th", "Minor 7th", "Perfect 5th", "Diminished 7th"], correctIndex: 1),
  Question(question: "Which of the following is built entirely from minor thirds?", options: ["Major 7th", "Diminished 7th", "Minor 7th", "Dominant 7th"], correctIndex: 1),
  Question(question: "What is the third of an E minor chord in root position?", options: ["C", "D#", "G", "G#"], correctIndex: 2)
];