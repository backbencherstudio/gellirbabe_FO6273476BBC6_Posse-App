import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:possy_app/core/constant/icons.dart';
import 'package:possy_app/src/model/ansModel.dart';

class AnswerListNotifier extends StateNotifier<List<AnswerModel>> {
  AnswerListNotifier() : super([

    AnswerModel(
            Image: AppIcons.buribedi2,
            title: "Rayna",
            hasAnswered: false,
            answer: "A blender – powerful and messy but gets the job done!",
          ),
    AnswerModel(
            Image: AppIcons.maiya,
            title: "Takia",
            hasAnswered: false,
            answer: "a plate coz it can hold all the good delicous foods",
          ),
    AnswerModel(
      Image: AppIcons.buribedi,
            title: "shakin",
            hasAnswered: false,
            answer: "Microwave – fast, convenident, but sometimes overlooked.",
          ),
  ]);

  void addAnswer(String title, bool hasAnswered, String? answer) {
    final newAnswer = AnswerModel(
      title: title,
      hasAnswered: hasAnswered,
      answer: answer,
    );
    state = [...state, newAnswer];
  }

  void clearAnswers() {
    state = [];
  }
}

final answerListProvider = StateNotifierProvider<AnswerListNotifier, List<AnswerModel>>(
  (ref) => AnswerListNotifier(),
);
final isAnswerSentProvider = StateProvider<bool>((ref) => false);
