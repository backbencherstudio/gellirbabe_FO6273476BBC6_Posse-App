class PosseGroupModel {
  String? id;
  String? name;
  String? type;
  List<Users>? users;

  PosseGroupModel({this.id, this.name, this.type, this.users});

  PosseGroupModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] =id;
    data['name'] = name;
    data['type'] = type;
    if (users != null) {
      data['users'] =users!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Users {
  String? type;
  String? status;
  String? id;
  String? avatar;
  String? name;

  Users({this.type, this.status, this.id, this.avatar, this.name});

  Users.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    status = json['status'];
    id = json['id'];
    avatar = json['avatar'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['type'] = type;
    data['status'] = status;
    data['id'] = id;
    data['avatar'] = avatar;
    data['name'] = name;
    return data;
  }
}
