class ViveQuestionModel {
  String? id;
  String? type;
  String? status;
  String? content;
  String? groupId;
  String? categoryId;
  List<PostOptions>? postOptions;
  List<String>? postAnswerSubmissions;

  ViveQuestionModel(
      {this.id,
      this.type,
      this.status,
      this.content,
      this.groupId,
      this.categoryId,
      this.postOptions,
      this.postAnswerSubmissions});

  ViveQuestionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    status = json['status'];
    content = json['content'];
    groupId = json['group_id'];
    categoryId = json['category_id'];
    if (json['post_options'] != null) {
      postOptions = <PostOptions>[];
      json['post_options'].forEach((v) {
        postOptions!.add( PostOptions.fromJson(v));
      });
    }
    postAnswerSubmissions = json['post_answer_submissions'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['type'] =type;
    data['status'] = status;
    data['content'] = content;
    data['group_id'] = groupId;
    data['category_id'] = categoryId;
    if (postOptions != null) {
      data['post_options'] = postOptions!.map((v) => v.toJson()).toList();
    }
    data['post_answer_submissions'] = postAnswerSubmissions;
    return data;
  }
}

class PostOptions {
  String? id;
  String? subtitle;
  String? text;

  PostOptions({this.id, this.subtitle, this.text});

  PostOptions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subtitle = json['subtitle'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['subtitle'] = subtitle;
    data['text'] = text;
    return data;
  }
}
