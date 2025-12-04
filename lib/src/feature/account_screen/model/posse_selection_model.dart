class PosseSelectionModel {
  final String posseID;
  final String posseName;
  final List<String> peopleImage;
  PosseSelectionModel({
    required this.posseID,
    required this.posseName,
    required this.peopleImage,
  });

  Map<String, dynamic> toJson() => {
    "posseID": posseID,
    "posseName": posseName,
    "peopleImage": peopleImage,
  };

  factory PosseSelectionModel.fromJson(Map<String, dynamic> json) =>
      PosseSelectionModel(
        posseID: json["posseID"],
        posseName: json["posseName"],
        peopleImage: List<String>.from(json["peopleImage"]),
      );

  PosseSelectionModel copyWith({
    String? posseID,
    String? posseName,
    List<String>? peopleImage,
  }) {
    return PosseSelectionModel(
      posseID: posseID ?? this.posseID,
      posseName: posseName ?? this.posseName,
      peopleImage: peopleImage ?? this.peopleImage,
    );
  }
}
