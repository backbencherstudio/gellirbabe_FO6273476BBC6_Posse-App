import 'dart:ui';

class UsersMoodModel {
  String? userName;
  String? avatarPath;
  String? mood;
  Color? moodColor;
  Color? moodBackgroundColor;

  UsersMoodModel({
    this.userName,
    this.avatarPath,
    this.mood,
    this.moodColor,
    this.moodBackgroundColor,
  });

  UsersMoodModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    avatarPath = json['avatarPath'];
    mood = json['mood'];
    moodColor = json['moodColor'];
    moodBackgroundColor = json['moodBackgroundColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['avatarPath'] = this.avatarPath;
    data['mood'] = this.mood;
    data['moodColor'] = this.moodColor;
    data['moodBackgroundColor'] = this.moodBackgroundColor;
    return data;
  }
}
