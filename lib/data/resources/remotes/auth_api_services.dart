import 'package:possy_app/core/services/api_services/api_end_points.dart';
import 'package:possy_app/core/services/api_services/api_services.dart';
import 'package:possy_app/data/models/response_model.dart';

import '../caches/shared_preferences.dart';

class AuthApiServices {
  ApiClient authRemote;
  AuthApiServices({required this.authRemote});
  Future<ResponseModel> register({
    required String name,
    required String emailOrPhone,
    required String dob,
    required String password,
  }) async {
    try {
      final body = {
        "name": name,
        "emailOrPhone": emailOrPhone,
        "dob": dob,
        "password": password,
        "confirmPassword": password,
      };
      final data = await authRemote.postRequest(
        endpoints: ApiEndpoints.register,
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

  Future<ResponseModel> verifyRegister({
    required String emailOrPhone,
    required String otp,
  }) async {
    try {
      final body = {"emailOrPhone": emailOrPhone, "otp": otp};
      final data = await authRemote.postRequest(
        endpoints: ApiEndpoints.verifyRegistration,
        body: body,
      );
      if (data["success"]) {
        await SharedPreferenceData.setToken(data["token"]);
        await ApiClient.headerSet();
        return ResponseModel(success: true, message: data["message"]);
      } else {
        return ResponseModel(success: false, message: data["message"]);
      }
    } catch (e) {
      return ResponseModel(success: false, message: '$e');
    }
  }

  Future<ResponseModel> login({
    required String emailOrPhone,
    required String password,
  }) async {
    try {
      final body = {"emailOrPhone": emailOrPhone, "password": password};
      final data = await authRemote.postRequest(
        endpoints: ApiEndpoints.login,
        body: body,
      );
      if (data["success"]) {
        await SharedPreferenceData.setToken(data["token"]);
        await ApiClient.headerSet();
        return ResponseModel(success: true, message: data["message"]);
      } else {
        return ResponseModel(success: false, message: data["message"]);
      }
    } catch (e) {
      return ResponseModel(success: false, message: '$e');
    }
  }

  Future<ResponseModel> forgotPassword({required String emailOrPhone}) async {
    try {
      final body = {"email": emailOrPhone};
      final data = await authRemote.postRequest(
        endpoints: ApiEndpoints.forgotPassword,
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

  Future<ResponseModel> verifyOtp({
    required String emailOrPhone,
    required String otp,
  }) async {
    try {
      final body = {"email": emailOrPhone, "otp": otp};
      final data = await authRemote.postRequest(
        endpoints: ApiEndpoints.verifyOTP,
        body: body,
      );
      if (data["success"]) {
        await SharedPreferenceData.setToken(data["token"]);
        await ApiClient.headerSet();
        return ResponseModel(success: true, message: data["message"]);
      } else {
        return ResponseModel(success: false, message: data["message"]);
      }
    } catch (e) {
      return ResponseModel(success: false, message: '$e');
    }
  }

  Future<ResponseModel> resetPassword({required String password}) async {
    try {
      final body = {"password": password, "confirm_password": password};
      final data = await authRemote.postRequest(
        endpoints: ApiEndpoints.resetPassword,
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
