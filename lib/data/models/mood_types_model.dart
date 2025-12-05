class MoodTypesModel {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? label;
  String? emoji;
  String? colorHex;
  String?  intensity;

  MoodTypesModel(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.label,
      this.emoji,
      this.colorHex,
      this.intensity});

  MoodTypesModel.fromJson(Map<String, dynamic> json) {
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
