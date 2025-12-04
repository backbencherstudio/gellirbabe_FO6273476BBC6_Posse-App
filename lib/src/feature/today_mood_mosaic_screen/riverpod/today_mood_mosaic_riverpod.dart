import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:possy_app/core/constant/images.dart';
import 'package:possy_app/src/feature/today_mood_mosaic_screen/model/user_mood_model.dart';
import 'package:possy_app/src/feature/today_mood_mosaic_screen/riverpod/today_mood_mosaic_state.dart';
import '../../../common_widget_style/common_style/mood_mosaic_style/mood_mosaic_color.dart';

final todayMoodMosaicRiverpod =
    StateNotifierProvider<TodayMoodMosaicRiverpod, TodayMoodMosaicState>(
      (ref) => TodayMoodMosaicRiverpod(),
    );

class TodayMoodMosaicRiverpod extends StateNotifier<TodayMoodMosaicState> {
  TodayMoodMosaicRiverpod() : super(TodayMoodMosaicState()) {
    fetchUserMoodModel();
  }

  List<Map<String, dynamic>> dummyUserMoodsData = [
    {
      "userName": "Safrid",
      "avatarPath": "assets/avatar/angry_avatar.png",
      "mood": "Angry",
      "moodColor": MoodMosaicColor.angryColor,
      "moodBackgroundColor": MoodMosaicColor.angryBackgroundColor,
    },
    {
      "userName": "Sujay",
      "avatarPath": "assets/avatar/sad_avatar.png",
      "mood": "Sad",
      "moodColor": MoodMosaicColor.sadColor,
      "moodBackgroundColor": MoodMosaicColor.sadBackgroundColor,
    },
    {
      "userName": "Shakin",
      "avatarPath": "assets/avatar/good_avatar.png",
      "mood": "Good",
      "moodColor": MoodMosaicColor.goodColor,
      "moodBackgroundColor": MoodMosaicColor.goodBackgroundColor,
    },
    {
      "userName": "Saiful",
      "avatarPath": "assets/avatar/spectacular_avatar.png",
      "mood": "Spectacular",
      "moodColor": MoodMosaicColor.spectacularColor,
      "moodBackgroundColor": MoodMosaicColor.spectacularBackgroundColor,
    },
    {
      "userName": "Shakhawat",
      "avatarPath": "assets/avatar/upset_avatar.png",
      "mood": "Upset",
      "moodColor": MoodMosaicColor.upsetColor,
      "moodBackgroundColor": MoodMosaicColor.upsetBackgroundColor,
    },
    {
      "userName": "Shara",
      "avatarPath": "assets/avatar/good_avatar.png",
      "mood": "Good",
      "moodColor": MoodMosaicColor.goodColor,
      "moodBackgroundColor": MoodMosaicColor.goodBackgroundColor,
    },
    {
      "userName": "Seeam",
      "avatarPath": "assets/avatar/angry_avatar.png",
      "mood": "Angry",
      "moodColor": MoodMosaicColor.angryColor,
      "moodBackgroundColor": MoodMosaicColor.angryBackgroundColor,
    },
    {
      "userName": "Trishna",
      "avatarPath": "assets/avatar/good_avatar.png",
      "mood": "Good",
      "moodColor": MoodMosaicColor.goodColor,
      "moodBackgroundColor": MoodMosaicColor.goodBackgroundColor,
    },
    {
      "userName": "Kowshik",
      "avatarPath": "assets/avatar/upset_avatar.png",
      "mood": "Upset",
      "moodColor": MoodMosaicColor.upsetColor,
      "moodBackgroundColor": MoodMosaicColor.upsetBackgroundColor,
    },
    {
      "userName": "Piash",
      "avatarPath": "assets/avatar/sad_avatar.png",
      "mood": "Sad",
      "moodColor": MoodMosaicColor.sadColor,
      "moodBackgroundColor": MoodMosaicColor.sadBackgroundColor,
    },
    {
      "userName": "Laboni",
      "avatarPath": "assets/avatar/happy_avatar.png",
      "mood": "Happy",
      "moodColor": MoodMosaicColor.happyColor,
      "moodBackgroundColor": MoodMosaicColor.happyBackgroundColor,
    },
  ];

  Future<void> fetchUserMoodModel() async {
    List<UsersMoodModel> usersMoodList =
        dummyUserMoodsData.map((userMood) {
          return UsersMoodModel.fromJson(userMood);
        }).toList();
    state = state.copyWith(usersMoodList: usersMoodList);
  }
}
