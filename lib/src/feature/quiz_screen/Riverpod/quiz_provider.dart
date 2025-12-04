import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:possy_app/src/feature/quiz_screen/Riverpod_Model/quizState_notifier.dart';
import 'package:possy_app/src/model/quizs_model.dart';

final quizListProvider =
    StateNotifierProvider<QuizstateNotifier, List<QuizsModel>>(
      (ref) => QuizstateNotifier(),
    );

final isSelectedProvider = StateProvider<int?>((ref) => null);
