class AnswerModel {
  final String title;
  final bool hasAnswered;
  final String? answer;
  final String? Image;

  AnswerModel({
    required this.title,
    required this.hasAnswered,
    required this.answer,
    this.Image,
  });

  factory AnswerModel.fromJson(Map<String, dynamic> json) {
    return AnswerModel(
      title: json['title'],
      hasAnswered: json['hasAnswered'],
      answer: json['answer'],
      Image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'hasAnswered': hasAnswered,
      'answer': answer,
      'images': Image,
    };
  }
}
