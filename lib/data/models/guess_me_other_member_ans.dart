class OtherMemberAnsModel {
  List<Answers>? answers;
  List<Members>? members;

  OtherMemberAnsModel({this.answers, this.members});

  OtherMemberAnsModel.fromJson(Map<String, dynamic> json) {
    if (json['answers'] != null) {
      answers = <Answers>[];
      json['answers'].forEach((v) {
        answers!.add(Answers.fromJson(v));
      });
    }
    if (json['members'] != null) {
      members = <Members>[];
      json['members'].forEach((v) {
        members!.add(Members.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (answers != null) {
      data['answers'] = answers!.map((v) => v.toJson()).toList();
    }
    if (members != null) {
      data['members'] = members!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Answers {
  String? submissionId;
  String? selectedOptionId;
  String? selectedOptionContent;
  String? yourGuess;

  Answers({
    this.submissionId,
    this.selectedOptionId,
    this.selectedOptionContent,
    this.yourGuess,
  });

  Answers.fromJson(Map<String, dynamic> json) {
    submissionId = json['submission_id'];
    selectedOptionId = json['selected_option_id'];
    selectedOptionContent = json['selected_option_content'];
    yourGuess = json['your_guess'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['submission_id'] = submissionId;
    data['selected_option_id'] = selectedOptionId;
    data['selected_option_content'] = selectedOptionContent;
    data['your_guess'] = yourGuess;
    return data;
  }
}

class Members {
  String? id;
  String? name;
  String? avatar;

  Members({this.id, this.name, this.avatar});

  Members.fromJson(Map<String, dynamic> json) {
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
