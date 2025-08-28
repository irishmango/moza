import 'package:moza/src/features/chapters/domain/chapter.dart';

class Topic {
  final String id;
  final String title;
  final List<Chapter> chapters;
  final String availableXP;

  Topic({
    required this.id,
    required this.title,
    required this.chapters,
    required this.availableXP,
  });
}