import 'package:possy_app/data/models/response_model.dart';

import '../resources/remotes/auth_api_services.dart';

class AuthRepository {
  AuthApiServices authRepo;
  AuthRepository({required this.authRepo});
  Future<ResponseModel> register({
    required String name,
    required String emailOrPhone,
    required String dob,
    required String password,
  }) async {
    return await authRepo.register(
      name: name,
      emailOrPhone: emailOrPhone,
      dob: dob,
      password: password,
    );
  }

  Future<ResponseModel> verifyRegister({
    required String emailOrPhone,
    required String otp,
  }) async {
    return await authRepo.verifyRegister(emailOrPhone: emailOrPhone, otp: otp);
  }

  Future<ResponseModel> login({
    required String emailOrPhone,
    required String password,
  }) async {
    return await authRepo.login(emailOrPhone: emailOrPhone, password: password);
  }

  Future<ResponseModel> forgotPassword({required String emailOrPhone}) async {
    return await authRepo.forgotPassword(emailOrPhone: emailOrPhone);
  }

  Future<ResponseModel> verifyOtp({
    required String emailOrPhone,
    required String otp,
  }) async {
    return await authRepo.verifyOtp(emailOrPhone: emailOrPhone, otp: otp);
  }

  Future<ResponseModel> resetPassword({required String password}) async {
    return await authRepo.resetPassword(password: password);
  }
}
