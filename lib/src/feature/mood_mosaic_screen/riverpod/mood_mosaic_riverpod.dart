import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:possy_app/src/feature/mood_mosaic_screen/moods.dart';
import 'package:possy_app/src/feature/mood_mosaic_screen/riverpod/mood_mosaic_state.dart';

import '../../../common_widget_style/common_style/mood_mosaic_style/mood_mosaic_color.dart';
import '../view/widgets/mood_mosaic_container.dart';

final moodMosaicRiverpod =
    StateNotifierProvider<MoodMosaicRiverpod, MoodMosaicState>(
      (ref) => MoodMosaicRiverpod(),
    );

class MoodMosaicRiverpod extends StateNotifier<MoodMosaicState> {
  MoodMosaicRiverpod() : super(MoodMosaicState());

  final List<Widget> _moodsWidgetList = [
    MoodMosaicContainer(
      moodName: "Spectacular",
      moodColor: MoodMosaicColor.spectacularColor,
      textColor: MoodMosaicColor.spectacularTextColor,
      gifPath: "assets/gifs/spectacular_emoji.gif",
    ),
    MoodMosaicContainer(
      moodName: "Happy",
      moodColor: MoodMosaicColor.happyColor,
      textColor: MoodMosaicColor.happyTextColor,
      gifPath: "assets/gifs/happy_emoji.gif",
    ),
    MoodMosaicContainer(
      moodName: "Good",
      moodColor: MoodMosaicColor.goodColor,
      textColor: MoodMosaicColor.goodTextColor,
      gifPath: "assets/gifs/good_emoji.gif",
    ),
    MoodMosaicContainer(
      moodName: "Upset",
      moodColor: MoodMosaicColor.upsetColor,
      textColor: MoodMosaicColor.upsetTextColor,
      gifPath: "assets/gifs/upset_emoji.gif",
    ),
    MoodMosaicContainer(
      moodName: "Sad",
      moodColor: MoodMosaicColor.sadColor,
      textColor: MoodMosaicColor.sadTextColor,
      gifPath: "assets/gifs/sad_emoji.gif",
    ),
    MoodMosaicContainer(
      moodName: "Angry",
      moodColor: MoodMosaicColor.angryColor,
      textColor: MoodMosaicColor.angryTextColor,
      gifPath: "assets/gifs/angry_emoji.gif",
    ),
  ];
  List<Widget> get moodsWidgetList => _moodsWidgetList;

  final List<Color> _moodsColor = const [
    MoodMosaicColor.spectacularColor,
    MoodMosaicColor.happyColor,
    MoodMosaicColor.goodColor,
    MoodMosaicColor.upsetColor,
    MoodMosaicColor.sadColor,
    MoodMosaicColor.angryColor,
  ];

  /// mood list
  final List<Moods> moodsList = [
    Moods.spectacular,
    Moods.happy,
    Moods.good,
    Moods.upset,
    Moods.sad,
    Moods.angry,
  ];

  List<Color> get moodsColor => _moodsColor;

  void onPageChange(int index) {
    state = state.copyWith(currentPage: index, selectedMood: moodsList[index]);
    Color backgroundColor = handleScreenBackgroundColor();
    debugPrint("\n current mood : ${state.selectedMood.toString()}\n");
    state = state.copyWith(backgroundColor: backgroundColor);
  }

  void onSelected() {
    state = state.copyWith(selectedMood: moodsList[state.currentPage]);
  }

  /// handle background color
  Color handleScreenBackgroundColor() {
    if (state.selectedMood == Moods.spectacular) {
      return MoodMosaicColor.spectacularBackgroundColor;
    } else if (state.selectedMood == Moods.happy) {
      return MoodMosaicColor.happyBackgroundColor;
    } else if (state.selectedMood == Moods.good) {
      return MoodMosaicColor.goodBackgroundColor;
    } else if (state.selectedMood == Moods.upset) {
      return MoodMosaicColor.upsetBackgroundColor;
    } else if (state.selectedMood == Moods.sad) {
      return MoodMosaicColor.sadBackgroundColor;
    } else {
      return MoodMosaicColor.angryBackgroundColor;
    }
  }

  /// handle mood color
  Color handleMoodColor() {
    if (state.selectedMood == Moods.spectacular) {
      return MoodMosaicColor.spectacularColor;
    } else if (state.selectedMood == Moods.happy) {
      return MoodMosaicColor.happyColor;
    } else if (state.selectedMood == Moods.good) {
      return MoodMosaicColor.goodColor;
    } else if (state.selectedMood == Moods.upset) {
      return MoodMosaicColor.upsetColor;
    } else if (state.selectedMood == Moods.sad) {
      return MoodMosaicColor.sadColor;
    } else {
      return MoodMosaicColor.angryColor;
    }
  }

  /// handle text color
  Color handleTextColor() {
    if (state.selectedMood == Moods.spectacular) {
      return MoodMosaicColor.spectacularTextColor;
    } else if (state.selectedMood == Moods.happy) {
      return MoodMosaicColor.happyTextColor;
    } else if (state.selectedMood == Moods.good) {
      return MoodMosaicColor.goodTextColor;
    } else if (state.selectedMood == Moods.upset) {
      return MoodMosaicColor.upsetTextColor;
    } else if (state.selectedMood == Moods.sad) {
      return MoodMosaicColor.sadTextColor;
    } else {
      return MoodMosaicColor.angryTextColor;
    }
  }

  /// gif path
  String gifPath() {
    if (state.selectedMood == Moods.spectacular) {
      return "assets/gifs/spectacular_emoji.gif";
    } else if (state.selectedMood == Moods.happy) {
      return "assets/gifs/happy_emoji.gif";
    } else if (state.selectedMood == Moods.good) {
      return "assets/gifs/good_emoji.gif";
    } else if (state.selectedMood == Moods.upset) {
      return "assets/gifs/upset_emoji.gif";
    } else if (state.selectedMood == Moods.sad) {
      return "assets/gifs/sad_emoji.gif";
    } else {
      return "assets/gifs/angry_emoji.gif";
    }
  }

  /// get mood name
 String getMoodName(){
   if (state.selectedMood == Moods.spectacular) {
     return "Spectacular";
   } else if (state.selectedMood == Moods.happy) {
     return "Happy";
   } else if (state.selectedMood == Moods.good) {
     return "Good";
   } else if (state.selectedMood == Moods.upset) {
     return "Upset";
   } else if (state.selectedMood == Moods.sad) {
     return "Sad";
   } else {
     return "Angry";
   }
 }

}
