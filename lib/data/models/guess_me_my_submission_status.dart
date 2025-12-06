class SubmitionStatusModel {
  bool? hasSubmitted;
  Submission? submission;
  GroupProgress? groupProgress;

  SubmitionStatusModel(
      {this.hasSubmitted, this.submission, this.groupProgress});

  SubmitionStatusModel.fromJson(Map<String, dynamic> json) {
    hasSubmitted = json['has_submitted'];
    submission = json['submission'] != null
        ?  Submission.fromJson(json['submission'])
        : null;
    groupProgress = json['group_progress'] != null
        ? GroupProgress.fromJson(json['group_progress'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['has_submitted'] = hasSubmitted;
    if (submission != null) {
      data['submission'] = submission!.toJson();
    }
    if (groupProgress != null) {
      data['group_progress'] = groupProgress!.toJson();
    }
    return data;
  }
}

class Submission {
  String? id;
  String? selectedOptionId;
  String? answer;
  String? createdAt;

  Submission({this.id, this.selectedOptionId, this.answer, this.createdAt});

  Submission.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    selectedOptionId = json['selected_option_id'];
    answer = json['answer'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data ={};
    data['id'] = id;
    data['selected_option_id'] = selectedOptionId;
    data['answer'] = answer;
    data['created_at'] = createdAt;
    return data;
  }
}

class GroupProgress {
  int? totalMembers;
  int? totalSubmissions;

  GroupProgress({this.totalMembers, this.totalSubmissions});

  GroupProgress.fromJson(Map<String, dynamic> json) {
    totalMembers = json['total_members'];
    totalSubmissions = json['total_submissions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['total_members'] = totalMembers;
    data['total_submissions'] = totalSubmissions;
    return data;
  }
}
