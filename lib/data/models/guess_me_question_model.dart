class GuessMeQuestionModel {
  String? id;
  String? status;
  String? scheduleAt;
  String? type;
  String? content;
  List<PostQuestions>? postQuestions;

  GuessMeQuestionModel({
    this.id,
    this.status,
    this.scheduleAt,
    this.type,
    this.content,
    this.postQuestions,
  });

  GuessMeQuestionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    scheduleAt = json['schedule_at'];
    type = json['type'];
    content = json['content'];
    if (json['post_questions'] != null) {
      postQuestions = <PostQuestions>[];
      json['post_questions'].forEach((v) {
        postQuestions!.add(PostQuestions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['status'] = status;
    data['schedule_at'] = scheduleAt;
    data['type'] = type;
    data['content'] = content;
    if (postQuestions != null) {
      data['post_questions'] = postQuestions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PostQuestions {
  String? id;
  String? content;
  List<PostQuestionOptions>? postQuestionOptions;

  PostQuestions({this.id, this.content, this.postQuestionOptions});

  PostQuestions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    if (json['post_question_options'] != null) {
      postQuestionOptions = <PostQuestionOptions>[];
      json['post_question_options'].forEach((v) {
        postQuestionOptions!.add(PostQuestionOptions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['content'] = content;
    if (postQuestionOptions != null) {
      data['post_question_options'] =
          postQuestionOptions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PostQuestionOptions {
  String? id;
  String? content;

  PostQuestionOptions({this.id, this.content});

  PostQuestionOptions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['content'] = content;
    return data;
  }
}
