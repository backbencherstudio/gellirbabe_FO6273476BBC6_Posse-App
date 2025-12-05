import 'package:image_picker/image_picker.dart';
import 'package:possy_app/data/resources/remotes/account_api_services.dart';

import '../models/me_model.dart';
import '../models/response_model.dart';

class AccountRepository {
  AccountApiServices accountRepo;
  AccountRepository({required this.accountRepo});
  Future<MeModel?> me() async {
    return await accountRepo.me();
  }

  Future<ResponseModel> changeName({required String name}) async {
    return await accountRepo.changeName(name: name);
  }

  Future<ResponseModel> changeAvatar({required XFile avatar}) async {
    return await accountRepo.changeAvatar(avatar: avatar);
  }

  Future<ResponseModel> changeEmail({required String emailOrPhone}) async {
    return await accountRepo.changeEmail(emailOrPhone: emailOrPhone);
  }

  Future<ResponseModel> deleteAccount() async {
    return await accountRepo.deleteAccount();
  }
}
