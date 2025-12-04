import 'package:possy_app/src/feature/mood_mosaic_screen/moods.dart';
import 'package:flutter/material.dart';
import '../../../common_widget_style/common_style/mood_mosaic_style/mood_mosaic_color.dart';

class MoodMosaicState {
  int currentPage;
  Moods selectedMood;
  Color backgroundColor;
  MoodMosaicState({this.currentPage = 0, this.selectedMood = Moods.angry, this.backgroundColor = MoodMosaicColor.spectacularBackgroundColor });
  MoodMosaicState copyWith({int? currentPage, Moods? selectedMood, Color? backgroundColor}) {
    return MoodMosaicState(
      currentPage: currentPage ?? this.currentPage,
      selectedMood: selectedMood ?? this.selectedMood,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }
}
