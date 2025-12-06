import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:possy_app/core/services/api_services/api_services.dart';
import 'package:possy_app/data/resources/remotes/auth_api_services.dart';
import 'package:possy_app/src/feature/auth_screens/view/signup_screens/model/sign_up_model.dart';

import '../../../../../../data/models/response_model.dart';
import '../../../../../../data/repository/auth_repository.dart';

final signUpProvider = StateNotifierProvider<SignUpProvider, SignUpModel>(
  (ref) => SignUpProvider(
    authRepository: AuthRepository(
      authRepo: AuthApiServices(authRemote: ApiClient()),
    ),
  ),
);

class SignUpProvider extends StateNotifier<SignUpModel> {
  AuthRepository authRepository;
  SignUpProvider({required this.authRepository}) : super(const SignUpModel());

  void togglePasswordVisibility() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
    // debugPrint("toggle password visibility: $state}");
  }

  void toggleConfirmPasswordVisibility() {
    state = state.copyWith(
      isConfirmPasswordVisible: !state.isConfirmPasswordVisible,
    );
    debugPrint("\n\ntoggle confirm password visibility: $state\n\n");
  }

  void checkIsLoading() {
    state = state.copyWith(isLoading: !state.isLoading);
  }

  Future<ResponseModel> register({
    required String name,
    required String emailOrPhone,
    required String dob,
    required String password,
  }) async {
    checkIsLoading();
    return await authRepository.register(
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
    return await authRepository.verifyRegister(emailOrPhone: emailOrPhone, otp: otp);
  }
}
