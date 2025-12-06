class VibeHistoryModel {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? status;
  String? publishedAt;
  String? scheduleAt;
  String? type;
  String? content;
  String? groupId;
  String? categoryId;
  List<PostOptions>? postOptions;
  List<PostAnswerSubmissions>? postAnswerSubmissions;

  VibeHistoryModel(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.status,
      this.publishedAt,
      this.scheduleAt,
      this.type,
      this.content,
      this.groupId,
      this.categoryId,
      this.postOptions,
      this.postAnswerSubmissions});

  VibeHistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    status = json['status'];
    publishedAt = json['published_at'];
    scheduleAt = json['schedule_at'];
    type = json['type'];
    content = json['content'];
    groupId = json['group_id'];
    categoryId = json['category_id'];
    if (json['post_options'] != null) {
      postOptions = <PostOptions>[];
      json['post_options'].forEach((v) {
        postOptions!.add(PostOptions.fromJson(v));
      });
    }
    if (json['post_answer_submissions'] != null) {
      postAnswerSubmissions = <PostAnswerSubmissions>[];
      json['post_answer_submissions'].forEach((v) {
        postAnswerSubmissions!.add( PostAnswerSubmissions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['status'] = status;
    data['published_at'] = publishedAt;
    data['schedule_at'] = scheduleAt;
    data['type'] = type;
    data['content'] = content;
    data['group_id'] = groupId;
    data['category_id'] = categoryId;
    if (postOptions != null) {
      data['post_options'] = postOptions!.map((v) => v.toJson()).toList();
    }
    if (postAnswerSubmissions != null) {
      data['post_answer_submissions'] =
          postAnswerSubmissions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PostOptions {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? subtitle;
  String? text;
  String? postId;

  PostOptions(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.subtitle,
      this.text,
      this.postId});

  PostOptions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    subtitle = json['subtitle'];
    text = json['text'];
    postId = json['post_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['subtitle'] = subtitle;
    data['text'] = text;
    data['post_id'] = postId;
    return data;
  }
}

class PostAnswerSubmissions {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? status;
  String? userId;
  String? postId;
  String? postOptionId;
  String? answer;
  String? groupId;
  String? postQuestionId;
  User? user;

  PostAnswerSubmissions(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.status,
      this.userId,
      this.postId,
      this.postOptionId,
      this.answer,
      this.groupId,
      this.postQuestionId,
      this.user});

  PostAnswerSubmissions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    status = json['status'];
    userId = json['user_id'];
    postId = json['post_id'];
    postOptionId = json['post_option_id'];
    answer = json['answer'];
    groupId = json['group_id'];
    postQuestionId = json['postQuestionId'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['status'] = status;
    data['user_id'] = userId;
    data['post_id'] = postId;
    data['post_option_id'] = postOptionId;
    data['answer'] = answer;
    data['group_id'] = groupId;
    data['postQuestionId'] = postQuestionId;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? name;
  String? avatar;

  User({this.name, this.avatar});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    return data;
  }
}
