import 'package:moza/src/features/chapters/domain/chapter.dart';

class Topic {
  final String id;
  final String title;
  final String description;
  final List<Chapter> chapters;
  final String availableXP;

  Topic({
    required this.id,
    required this.title,
    required this.description,
    required this.chapters,
    required this.availableXP,
  });
}