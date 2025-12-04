import 'package:flutter_riverpod/flutter_riverpod.dart';

enum QuizTab { newTab, inProgress, completed }

class QuizTabNotifier extends StateNotifier<QuizTab> {
  QuizTabNotifier() : super(QuizTab.newTab);

  void changeTab(QuizTab tab) => state = tab;
}

final quizTabProvider = StateNotifierProvider<QuizTabNotifier, QuizTab>(
  (ref) => QuizTabNotifier(),
);
