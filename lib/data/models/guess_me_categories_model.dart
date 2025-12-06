class GuessMeCategoriesModel {
  String? id;
  String? name;
  String? image;
  String? scheduleAt;
  bool? hasQuizToday;
  Quiz? quiz;

  GuessMeCategoriesModel(
      {this.id,
      this.name,
      this.image,
      this.scheduleAt,
      this.hasQuizToday,
      this.quiz});

  GuessMeCategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    scheduleAt = json['schedule_at'];
    hasQuizToday = json['has_quiz_today'];
    quiz = json['quiz'] != null ?  Quiz.fromJson(json['quiz']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['schedule_at'] = scheduleAt;
    data['has_quiz_today'] = hasQuizToday;
    if (quiz != null) {
      data['quiz'] =quiz!.toJson();
    }
    return data;
  }
}

class Quiz {
  String? id;
  String? question;
  bool? hasAnswered;

  Quiz({this.id, this.question, this.hasAnswered});

  Quiz.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    hasAnswered = json['has_answered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['question'] = question;
    data['has_answered'] = hasAnswered;
    return data;
  }
}
