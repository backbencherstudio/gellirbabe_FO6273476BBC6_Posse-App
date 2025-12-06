import 'package:possy_app/data/models/response_model.dart';
import 'package:possy_app/data/resources/remotes/posse_api_services.dart';

class PosseRepository {
  PosseApiServices posseRepo;
  PosseRepository({required this.posseRepo});
  Future<ResponseModel> joinPosse({required String code}) async {
    return await posseRepo.joinPosse(code: code);
  }

  Future<ResponseModel> createPosse({
    required String name,
    required String type,
  }) async {
    return await posseRepo.createPosse(name: name, type: type);
  }
}
