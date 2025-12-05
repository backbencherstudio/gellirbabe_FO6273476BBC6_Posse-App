import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:possy_app/core/services/api_services/api_end_points.dart';
import 'package:possy_app/data/models/me_model.dart';

import '../../../core/services/api_services/api_services.dart';
import '../../models/response_model.dart';

class AccountApiServices {
  ApiClient accoutRemote;
  AccountApiServices({required this.accoutRemote});

  Future<MeModel?> me() async {
    try {
      final data = await accoutRemote.getRequest(endpoints: ApiEndpoints.me);
      if (data['success']) {
        return MeModel.fromJson(data['data']);
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseModel> changeName({required String name}) async {
    try {
      final body = {"name": name};
      final data = await accoutRemote.patchRequest(
        endpoints: ApiEndpoints.changeName,
        body: body,
      );
      if (data["success"]) {
        return ResponseModel(success: true, message: data["message"]);
      } else {
        return ResponseModel(success: false, message: data["message"]);
      }
    } catch (e) {
      return ResponseModel(success: false, message: '$e');
    }
  }

  Future<ResponseModel> changeAvatar({required XFile avatar}) async {
    try {
      FormData formData = FormData.fromMap({
        "avatar": await MultipartFile.fromFile(avatar.path),
      });
      final data = await accoutRemote.patchRequest(
        endpoints: ApiEndpoints.changeAvatar,
        formData: formData,
      );
      if (data["success"]) {
        return ResponseModel(success: true, message: data["message"]);
      } else {
        return ResponseModel(success: false, message: data["message"]);
      }
    } catch (e) {
      return ResponseModel(success: false, message: '$e');
    }
  }

  Future<ResponseModel> changeEmail({required String emailOrPhone}) async {
    try {
      final body = {"email": emailOrPhone};
      final data = await accoutRemote.patchRequest(
        endpoints: ApiEndpoints.changeAvatar,
        body: body,
      );
      if (data["success"]) {
        return ResponseModel(success: true, message: data["message"]);
      } else {
        return ResponseModel(success: false, message: data["message"]);
      }
    } catch (e) {
      return ResponseModel(success: false, message: '$e');
    }
  }
}
