import 'package:flutter/foundation.dart';

class LearnPath extends ChangeNotifier {
  String? lastChapterTitle;

  void setChapterTitle(String title) {
    lastChapterTitle = title;
    notifyListeners();
  }
}