class PosseGroupRequestModel {
  String? userId;
  String? status;
  String? createdAt;

  PosseGroupRequestModel({this.userId, this.status, this.createdAt});

  PosseGroupRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['user_id'] = userId;
    data['status'] = status;
    data['created_at'] = createdAt;
    return data;
  }
}
