class MeModel {
  String? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? avatar;
  String? type;
  String? gender;
  String? dateOfBirth;
  String? createdAt;

  MeModel(
      {this.id,
      this.name,
      this.email,
      this.phoneNumber,
      this.avatar,
      this.type,
      this.gender,
      this.dateOfBirth,
      this.createdAt});

  MeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    avatar = json['avatar'];
    type = json['type'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone_number'] =phoneNumber;
    data['avatar'] = avatar;
    data['type'] = type;
    data['gender'] = gender;
    data['date_of_birth'] = dateOfBirth;
    data['created_at'] = createdAt;
    return data;
  }
}
