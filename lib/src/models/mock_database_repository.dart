import 'package:moza/src/features/chapters/domain/chapter.dart';
import 'package:moza/src/features/lessons/domain/lesson.dart';
import 'package:moza/src/features/quiz/domain/quiz.dart';
import 'package:moza/src/features/quiz/domain/quiz_result.dart';
import 'package:moza/src/features/topics/domain/topic.dart';
import 'package:moza/src/models/database_repository.dart';

class MockDatabaseRepository implements DatabaseRepository {

  List<QuizResult> quizResults = [];
  

  
  @override
  List<Topic> getAllTopics() => topics;

  @override
  List<Chapter> getChapters(String topicId) {
    return topics.firstWhere((t) => t.id == topicId, orElse: () => Topic(id: '', title: '', chapters: [])).chapters;
  }

  @override
  List<Lesson> getLessons(String chapterId) {
    for (Topic topic in topics) {
      for (Chapter chapter in topic.chapters) {
        if (chapter.id == chapterId) {
          return chapter.lessons;
        }
      }
    }
    return [];
  }

  @override
  List<Quiz> getQuizzes(String chapterId) {
    for (Topic topic in topics) {
      for (Chapter chapter in topic.chapters) {
        if (chapter.id == chapterId) {
          return chapter.quizzes;
        }
      }
    }
    return [];
  }

  @override
  List<LessonContent> getLessonContent(String lessonId) {
    for (Topic topic in topics) {
      for (Chapter chapter in topic.chapters) {
        for (Lesson lesson in chapter.lessons) {
          if (lesson.id == lessonId) {
            return lesson.content;
          }
        }
      }
    }
    return [];
  }

    @override
  List<Quiz> getAllQuizzes() {
    return topics
        .expand((topic) => topic.chapters)
        .expand((chapter) => chapter.quizzes)
        .toList();
  }

  @override
  void saveQuizResult(QuizResult result) {
    quizResults.add(result);
  }

  @override
  List<QuizResult> getUserQuizResults(String userId) {
    return quizResults.where((result) => result.userId == userId).toList();
  }






  List<Topic> topics = [
      Topic(
        id: "topic1",
        title: "Music Theory",
        chapters: [
          Chapter(
            id: "chapter1",
            title: "Chords",
            description: "Learn about chord construction and recognition through various exercises and examples.",
            lessons: [
              Lesson(
                id: "lesson1",
                title: "What is a Chord?",
                content: [
                  LessonContent(type: "text", data: "A chord is a group of notes played together.", order: 1),
                  LessonContent(type: "image", data: "assets/img/chord_example_1.png", order: 2),
                ],
              ),
              Lesson(
                id: "lesson2",
                title: "Chord Types",
                content: [
                  LessonContent(type: "text", data: "Major and minor chords.", order: 1),
                  LessonContent(type: "image", data: "assets/img/chord_example_1.png", order: 2),
                ],
              ),
            ],
            quizzes: [
              Quiz(
                id: "quiz1",
                title: "Chord Basics",
                questions: [
                  Question(
                    question: "What kind of chord is this?", 
                    imagePath: 'assets/img/chord_example_1.png',
                    options: ["Major", "Dominant", "Dominant 7th", "Diminished"], 
                    correctAnswerIndex: 2,
                  ),
                  Question(
                    question: "What interval is added to a major triad to form a dominant 7th chord?", 
                    options: ["Major 7th", "Minor 7th", "Perfect 5th", "Diminished 7th"], 
                    correctAnswerIndex: 1,
                  ),
                  Question(
                    question: "Which of the following is built entirely from minor thirds?", 
                    options: ["Major 7th", "Diminished 7th", "Minor 7th", "Dominant 7th"], 
                    correctAnswerIndex: 1,
                  ),
                  Question(
                    question: "What is the third of an E minor chord in root position?", 
                    options: ["C", "D#", "G", "G#"], 
                    correctAnswerIndex: 2,
                  ),
                ],
              ),
              Quiz(
                id: "quiz2",
                title: "Advanced Chords",
                questions: [
                  Question(question: "What is a diminished chord?", options: ["Bright", "Dark", "Happy", "Single note"], correctAnswerIndex: 1),
                ],
              ),
            ],
          ),
          Chapter(
            id: "chapter2",
            title: "Scales",
            description: "Explore the structure of major and minor scales and their uses in music theory",
            lessons: [
              Lesson(
                id: "lesson3",
                title: "Major Scales",
                content: [
                  LessonContent(type: "text", data: "Major scales consist of whole and half steps.", order: 1),
                ],
              ),
              Lesson(
                id: "lesson4",
                title: "Minor Scales",
                content: [
                  LessonContent(type: "text", data: "Minor scales have a darker sound.", order: 1),
                ],
              ),
            ],
            quizzes: [
              Quiz(
                id: "quiz3",
                title: "Scales Quiz",
                questions: [
                  Question(question: "What is a major scale?", options: ["Chord", "Series of notes", "Rest", "Rhythm"], correctAnswerIndex: 1),
                ],
              ),
            ],
          ),
          Chapter(
            id: "chapter3",
            title: "Cadences",
            description: "Explore the world of cadences",
            lessons: [
              Lesson(
                id: "lesson3",
                title: "Perfect Cadences",
                content: [
                  LessonContent(type: "text", data: "Explore perfect cadences.", order: 1),
                ],
              ),
              Lesson(
                id: "lesson4",
                title: "Imperfect Cadences",
                content: [
                  LessonContent(type: "text", data: "Explore imperfect cadences", order: 1),
                ],
              ),
            ],
            quizzes: [
              Quiz(
                id: "quiz3",
                title: "Do you know your cadences?",
                questions: [
                  Question(question: "What is a major scale?", options: ["Chord", "Series of notes", "Rest", "Rhythm"], correctAnswerIndex: 1),
                ],
              ),
            ],
          ),
        ],
      ),

      Topic(
        id: "topic2",
        title: "Rhythm and Time",
        chapters: [
          Chapter(
            id: "chapter1",
            title: "Note Values",
            description: "Understand how different not values work together to create rhythms",
            lessons: [
              Lesson(
                id: "lesson1",
                title: "Whole Notes",
                content: [
                  LessonContent(type: "text", data: "Whole notes last for 4 beats.", order: 1),
                ],
              ),
            ],
            quizzes: [
              Quiz(
                id: "quiz1",
                title: "Note Values Quiz",
                questions: [
                  Question(question: "How many beats does a whole note get?", options: ["1", "2", "3", "4"], correctAnswerIndex: 3),
                ],
              ),
            ],
          ),
        ],
      ),

      Topic(
        id: "topic3",
        title: "Intervals",
        chapters: [
          Chapter(
            id: "chapter1",
            title: "Introduction to Intervals",
            description: "Identify intervals by listening and recognizing pitch differences.",
            lessons: [
              Lesson(
                id: "lesson1",
                title: "What is an Interval?",
                content: [
                  LessonContent(type: "text", data: "An interval is the distance between two notes.", order: 1),
                ],
              ),
            ],
            quizzes: [
              Quiz(
                id: "quiz1",
                title: "Interval Quiz",
                questions: [
                  Question(question: "What is a minor 3rd?", options: ["2 semitones", "3 semitones", "4 semitones", "5 semitones"], correctAnswerIndex: 1),
                ],
              ),
            ],
          ),
        ],
      ),

      Topic(
        id: "topic4",
        title: "Chord Progressions",
        chapters: [
          Chapter(
            id: "chapter1",
            title: "Common Progressions",
            description: "Learn common chord progressions used in blues, jazz, and pop music.",
            lessons: [
              Lesson(
                id: "lesson1",
                title: "The I-IV-V Progression",
                content: [
                  LessonContent(type: "text", data: "The I-IV-V progression is common in blues.", order: 1),
                ],
              ),
            ],
            quizzes: [
              Quiz(
                id: "quiz1",
                title: "Progression Quiz",
                questions: [
                  Question(question: "What chords are in a I-IV-V progression?", options: ["I, IV, V", "I, II, III", "IV, V, VI", "V, VI, VII"], correctAnswerIndex: 0),
                ],
              ),
            ],
          ),
        ],
      ),

      Topic(
        id: "topic5",
        title: "Ear Training",
        chapters: [
          Chapter(
            id: "chapter1",
            title: "Interval Recognition",
            description: "Test your aural skills",
            lessons: [
              Lesson(
                id: "lesson1",
                title: "Recognizing Intervals",
                content: [
                  LessonContent(type: "text", data: "Listen for the quality of each interval.", order: 1),
                ],
              ),
            ],
            quizzes: [
              Quiz(
                id: "quiz1",
                title: "Interval Recognition Quiz",
                questions: [
                  Question(question: "What is a perfect 5th?", options: ["2 semitones", "3 semitones", "5 semitones", "7 semitones"], correctAnswerIndex: 3),
                ],
              ),
            ],
          ),
        ],
      ),
    ];
  }



