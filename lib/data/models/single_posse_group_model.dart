class SinglePosseGroupModel {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? name;
  String? type;
  String? code;
  List<GroupUsers>? groupUsers;

  SinglePosseGroupModel(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.name,
      this.type,
      this.code,
      this.groupUsers});

  SinglePosseGroupModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    name = json['name'];
    type = json['type'];
    code = json['code'];
    if (json['group_users'] != null) {
      groupUsers = <GroupUsers>[];
      json['group_users'].forEach((v) {
        groupUsers!.add( GroupUsers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['name'] = name;
    data['type'] = type;
    data['code'] = code;
    if (groupUsers != null) {
      data['group_users'] =groupUsers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GroupUsers {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? type;
  bool? isBanned;
  String? restrictedUntil;
  String? userId;
  String? status;
  String? email;
  String? name;
  String? phoneNumber;
  String? avatar;
  int? currentStreak;
  String? lastStreakDate;

  GroupUsers(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.type,
      this.isBanned,
      this.restrictedUntil,
      this.userId,
      this.status,
      this.email,
      this.name,
      this.phoneNumber,
      this.avatar,
      this.currentStreak,
      this.lastStreakDate});

  GroupUsers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    type = json['type'];
    isBanned = json['is_banned'];
    restrictedUntil = json['restricted_until'];
    userId = json['user_id'];
    status = json['status'];
    email = json['email'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    avatar = json['avatar'];
    currentStreak = json['current_streak'];
    lastStreakDate = json['last_streak_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['type'] = type;
    data['is_banned'] = isBanned;
    data['restricted_until'] = restrictedUntil;
    data['user_id'] = userId;
    data['status'] = status;
    data['email'] = email;
    data['name'] = name;
    data['phone_number'] = phoneNumber;
    data['avatar'] = avatar;
    data['current_streak'] = currentStreak;
    data['last_streak_date'] = lastStreakDate;
    return data;
  }
}
