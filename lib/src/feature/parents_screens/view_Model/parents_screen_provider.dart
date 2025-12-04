import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:possy_app/src/feature/account_screen/view/screens/account_screen/account_screen.dart';
import 'package:possy_app/src/feature/home_screen/view/home_screen.dart';
import 'package:possy_app/src/feature/quiz_screen/view/quiz_Screen.dart';
import 'package:possy_app/src/feature/vibe_check_screen/vibe_check_screen.dart';
import '../../anchor_log_screens/view/anchor_log_screen.dart';
import '../riverpod_model/parent_screen_riverpod_model.dart';

class ParentsScreenProvider extends StateNotifier<ParentScreenRiverPodModel> {
  ParentsScreenProvider() : super(ParentScreenRiverPodModel());

  /// variable name
  final List<Widget> _pageList = const [
    QuizScreen(),
    AnchorLogScreen(),
    HomeScreen(),
    VibeCheckScreen(),
    AccountScreen(),
  ];

  /// variable name
  List<Widget> get pageList => _pageList;

  void onSelectedIndex(int index) {
    debugPrint("\nSelected Page index : $index\n");
    state = state.copyWith(selectedIndex: index);
  }
}

final parentsScreenProvider =
    StateNotifierProvider<ParentsScreenProvider, ParentScreenRiverPodModel>((
      ref,
    ) {
      return ParentsScreenProvider();
    });
