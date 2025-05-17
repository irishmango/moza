class LessonContent {
  final String type;  // "text" or "image"
  final String data;  // Text content or image path
  final int order;    // Order in the lesson

  LessonContent({
    required this.type,
    required this.data,
    required this.order,
  });
}

class Lesson {
  final String id;
  final String title;
  final List<LessonContent> content;

  Lesson({
    required this.id,
    required this.title,
    required this.content,
  });
}