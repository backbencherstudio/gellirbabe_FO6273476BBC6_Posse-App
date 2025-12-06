class VibeResultModel {
  String? type;
  String? status;
  String? content;
  String? groupId;
  String? categoryId;
  List<PostOptions>? postOptions;

  VibeResultModel(
      {this.type,
      this.status,
      this.content,
      this.groupId,
      this.categoryId,
      this.postOptions});

  VibeResultModel.fromJson(Map<String, dynamic> json) {
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['type'] = type;
    data['status'] = status;
    data['content'] = content;
    data['group_id'] = groupId;
    data['category_id'] = categoryId;
    if (postOptions != null) {
      data['post_options'] = postOptions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PostOptions {
  String? id;
  String? subtitle;
  String? text;
  List<PostAnswerSubmissions>? postAnswerSubmissions;
  bool? yourAnswered;

  PostOptions(
      {this.id,
      this.subtitle,
      this.text,
      this.postAnswerSubmissions,
      this.yourAnswered});

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
    yourAnswered = json['your_answered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['subtitle'] = subtitle;
    data['text'] = text;
    if (postAnswerSubmissions != null) {
      data['post_answer_submissions'] =
          postAnswerSubmissions!.map((v) => v.toJson()).toList();
    }
    data['your_answered'] = yourAnswered;
    return data;
  }
}

class PostAnswerSubmissions {
  User? user;

  PostAnswerSubmissions({this.user});

  PostAnswerSubmissions.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? id;
  String? name;
  String? avatar;

  User({this.id, this.name, this.avatar});

  User.fromJson(Map<String, dynamic> json) {
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
