class TodayMoodModel {
  MoodType? moodType;
  User? user;

  TodayMoodModel({this.moodType, this.user});

  TodayMoodModel.fromJson(Map<String, dynamic> json) {
    moodType =
        json['mood_type'] != null ? MoodType.fromJson(json['mood_type']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (moodType != null) {
      data['mood_type'] = moodType!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class MoodType {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? label;
  String? emoji;
  String? colorHex;
  String? intensity;

  MoodType({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.label,
    this.emoji,
    this.colorHex,
    this.intensity,
  });

  MoodType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    label = json['label'];
    emoji = json['emoji'];
    colorHex = json['color_hex'];
    intensity = json['intensity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['label'] = label;
    data['emoji'] = emoji;
    data['color_hex'] = colorHex;
    data['intensity'] = intensity;
    return data;
  }
}

class User {
  String? id;
  String? avatar;
  String? name;

  User({this.id, this.avatar, this.name});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    avatar = json['avatar'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['avatar'] = avatar;
    data['name'] = name;
    return data;
  }
}
