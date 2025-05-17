import 'package:moza/src/features/chapters/domain/chapter.dart';

class Topic {
  final String id;
  final String title;
  final List<Chapter> chapters;

  Topic({
    required this.id,
    required this.title,
    required this.chapters,
  });
}