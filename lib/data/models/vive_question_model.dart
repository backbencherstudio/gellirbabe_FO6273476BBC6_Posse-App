class ViveQuestionModel {
  String? id;
  String? type;
  String? status;
  String? content;
  String? groupId;
  String? categoryId;
  List<PostOptions>? postOptions;

  ViveQuestionModel(
      {this.id,
      this.type,
      this.status,
      this.content,
      this.groupId,
      this.categoryId,
      this.postOptions});

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
        postOptions!.add(new PostOptions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['status'] = this.status;
    data['content'] = this.content;
    data['group_id'] = this.groupId;
    data['category_id'] = this.categoryId;
    if (this.postOptions != null) {
      data['post_options'] = this.postOptions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PostOptions {
  String? id;
  String? subtitle;
  String? text;
  List<PostAnswerSubmissions>? postAnswerSubmissions;

  PostOptions({this.id, this.subtitle, this.text, this.postAnswerSubmissions});

  PostOptions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subtitle = json['subtitle'];
    text = json['text'];
    if (json['post_answer_submissions'] != null) {
      postAnswerSubmissions = <PostAnswerSubmissions>[];
      json['post_answer_submissions'].forEach((v) {
        postAnswerSubmissions!.add( PostAnswerSubmissions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  {};
    data['id'] = id;
    data['subtitle'] = subtitle;
    data['text'] = text;
    if (postAnswerSubmissions != null) {
      data['post_answer_submissions'] =
          postAnswerSubmissions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PostAnswerSubmissions {
  String? id;
  String? name;
 String? avatar;

  PostAnswerSubmissions({this.id, this.name, this.avatar});

  PostAnswerSubmissions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['avatar'] = avatar;
    return data;
  }
}
