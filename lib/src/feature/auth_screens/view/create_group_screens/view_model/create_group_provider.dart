import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:possy_app/core/services/api_services/api_services.dart';
import 'package:possy_app/data/models/response_model.dart';
import 'package:possy_app/data/resources/remotes/posse_api_services.dart';
import 'package:possy_app/src/feature/auth_screens/view/create_group_screens/model/create_group_model.dart';

import '../../../../../../data/repository/posse_repository.dart';

final createOrJoinPosseProvider =
    StateNotifierProvider<CreateGroupProvider, CreateGroupModel>(
      (ref) => CreateGroupProvider(posseRep: PosseRepository(posseRepo: PosseApiServices(posseRemote: ApiClient()))),
    );

class CreateGroupProvider extends StateNotifier<CreateGroupModel> {
  PosseRepository posseRep;

  CreateGroupProvider({required this.posseRep}) : super(CreateGroupModel());

  void selectLabel(String label) {
    state = state.copyWith(selectedLabel: label);
  }
   Future<ResponseModel> joinPosse({required String code}) async {
    return await posseRep.joinPosse(code: code);
  }

  Future<ResponseModel> createPosse({
    required String name,
    required String type,
  }) async {
    return await posseRep.createPosse(name: name, type: type);
  }
  
}
