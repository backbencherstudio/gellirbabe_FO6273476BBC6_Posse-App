class GuessMeResultModel {
  List<Results>? results;
  Stats? stats;

  GuessMeResultModel({this.results, this.stats});

  GuessMeResultModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
    stats = json['stats'] != null ? Stats.fromJson(json['stats']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    if (stats != null) {
      data['stats'] = stats!.toJson();
    }
    return data;
  }
}

class Results {
  String? submissionId;
  String? selectedOptionId;
  String? selectedOptionContent;
  ActualUser? actualUser;
  String? yourGuess;
  bool? isCorrect;

  Results({
    this.submissionId,
    this.selectedOptionId,
    this.selectedOptionContent,
    this.actualUser,
    this.yourGuess,
    this.isCorrect,
  });

  Results.fromJson(Map<String, dynamic> json) {
    submissionId = json['submission_id'];
    selectedOptionId = json['selected_option_id'];
    selectedOptionContent = json['selected_option_content'];
    actualUser =
        json['actual_user'] != null
            ? ActualUser.fromJson(json['actual_user'])
            : null;
    yourGuess = json['your_guess'];
    isCorrect = json['is_correct'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['submission_id'] = submissionId;
    data['selected_option_id'] = selectedOptionId;
    data['selected_option_content'] = selectedOptionContent;
    if (actualUser != null) {
      data['actual_user'] = actualUser!.toJson();
    }
    data['your_guess'] = yourGuess;
    data['is_correct'] = isCorrect;
    return data;
  }
}

class ActualUser {
  String? id;
  String? name;
  String? avatar;

  ActualUser({this.id, this.name, this.avatar});

  ActualUser.fromJson(Map<String, dynamic> json) {
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

class Stats {
  int? totalMembers;
  int? totalGuesses;
  int? correctGuesses;
  int? accuracy;

  Stats({
    this.totalMembers,
    this.totalGuesses,
    this.correctGuesses,
    this.accuracy,
  });

  Stats.fromJson(Map<String, dynamic> json) {
    totalMembers = json['total_members'];
    totalGuesses = json['total_guesses'];
    correctGuesses = json['correct_guesses'];
    accuracy = json['accuracy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['total_members'] = totalMembers;
    data['total_guesses'] = totalGuesses;
    data['correct_guesses'] = correctGuesses;
    data['accuracy'] = accuracy;
    return data;
  }
}
