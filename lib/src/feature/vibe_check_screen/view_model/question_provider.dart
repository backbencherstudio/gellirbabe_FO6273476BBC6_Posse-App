import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:possy_app/core/utils/utils.dart';
import '../model/quiz_option_Model.dart';

class QuestionNotifier extends StateNotifier<List<QuizOption>> {
  QuestionNotifier(super.initialOptions);

  static final questionProvider = StateNotifierProvider.autoDispose
      .family<QuestionNotifier, List<QuizOption>, List<QuizOption>>(
        (ref, initialOptions) => QuestionNotifier(initialOptions),
      );

  void select(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        state[i].copyWith(isSelected: i == index),
    ];
  }

  String getFormattedDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final inputDate = DateTime(date.year, date.month, date.day);

    DateTime sevenDaysAgo = today.subtract(Duration(days: 7));
    DateTime fourteenDaysAgo = today.subtract(Duration(days: 14));

    if (inputDate.isAfter(sevenDaysAgo) && inputDate.isBefore(today.add(Duration(days: 0)))) {
      return '';
    }
    else if (inputDate.isAfter(fourteenDaysAgo) && inputDate.isBefore(sevenDaysAgo)) {
      return 'Last Week';
    }
    else {
      return Utils.formatDate(formatType: "MMM dd, yyyy", dateTime: inputDate);  // Format for dates outside the last 14 days
    }
  }

}


