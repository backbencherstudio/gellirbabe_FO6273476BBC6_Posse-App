import '../model/user_mood_model.dart';

class TodayMoodMosaicState {
  List<UsersMoodModel>? usersMoodList;
  TodayMoodMosaicState({this.usersMoodList});
  TodayMoodMosaicState copyWith({List<UsersMoodModel>? usersMoodList}) {
    return TodayMoodMosaicState(
      usersMoodList: usersMoodList ?? this.usersMoodList,
    );
  }
}
