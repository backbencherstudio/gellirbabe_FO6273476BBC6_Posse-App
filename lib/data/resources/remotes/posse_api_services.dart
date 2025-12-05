import 'package:possy_app/core/services/api_services/api_end_points.dart';
import 'package:possy_app/core/services/api_services/api_services.dart';
import 'package:possy_app/data/models/posse_group_request_model.dart';
import 'package:possy_app/data/models/response_model.dart';

import '../../models/posse_group_model.dart';
import '../../models/single_posse_group_model.dart';

class PosseApiServices {
  ApiClient posseRemote;
  PosseApiServices({required this.posseRemote});
  Future<ResponseModel> ansAnchorQuestion({required String posseId, required String ans}) async {
    try {
      final body = {
        "group_id": posseId,
        "answer": ans,
      };
      final res = await posseRemote.postRequest(
        endpoints: ApiEndpoints.ansNAnchorQuestion(id: posseId),
        body: body,
      );
      if (res['success']) {
        return ResponseModel(success: true, message: res['message']);
      } else {
        return ResponseModel(success: false, message: res['message']);
      }
    } catch (e) {
      return ResponseModel(success: false, message: '$e');
    }
  }

  Future<List<PosseGroupRequestModel>?> getPosseGroupRequest({
    required String posseId,
  }) async {
    try {
      final res = await posseRemote.getRequest(
        endpoints: ApiEndpoints.getAllRequestByPosseId(id: posseId),
      );
      if (res['success']) {
        List<PosseGroupRequestModel> posseRequestList = [];
        for (var requestPosse in res['data']) {
          posseRequestList.add(PosseGroupRequestModel.fromJson(requestPosse));
        }
        return posseRequestList;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseModel> acceptOrRejectMemeber({
    required String memberId,
    required String posseId,
    required bool value,
  }) async {
    try {
      final body = {"member_id": memberId, "accept": value};
      final res = await posseRemote.patchRequest(
        endpoints: ApiEndpoints.acceptOrRejectMember(id: posseId),
        body: body,
      );
      if (res['success']) {
        return ResponseModel(success: true, message: res['message']);
      } else {
        return ResponseModel(success: false, message: res['message']);
      }
    } catch (e) {
      return ResponseModel(success: false, message: '$e');
    }
  }

  Future<ResponseModel> joinPosse({required String code}) async {
    try {
      final body = {"code": code};
      final res = await posseRemote.postRequest(
        endpoints: ApiEndpoints.joinPosse,
        body: body,
      );
      if (res['success']) {
        return ResponseModel(success: true, message: res['message']);
      } else {
        return ResponseModel(success: false, message: res['message']);
      }
    } catch (e) {
      return ResponseModel(success: false, message: '$e');
    }
  }

  Future<ResponseModel> createPosse({
    required String name,
    required String type,
  }) async {
    try {
      final body = {"name": name, "type": type};
      final res = await posseRemote.postRequest(
        endpoints: ApiEndpoints.createPosse,
        body: body,
      );
      if (res['success']) {
        return ResponseModel(success: true, message: res['message']);
      } else {
        return ResponseModel(success: false, message: res['message']);
      }
    } catch (e) {
      return ResponseModel(success: false, message: '$e');
    }
  }

  Future<List<PosseGroupModel>?> getAllPosseGroup({required int page}) async {
    try {
      final res = await posseRemote.getRequest(
        endpoints: ApiEndpoints.getAllPosse(page: page),
      );
      if (res['success']) {
        List<PosseGroupModel> posseList = [];
        for (var posse in res['data']) {
          posseList.add(PosseGroupModel.fromJson(posse));
        }

        return posseList;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<SinglePosseGroupModel?> getSinglePosseGroup({
    required String posseId,
  }) async {
    try {
      final res = await posseRemote.getRequest(
        endpoints: ApiEndpoints.getPosseById(id: posseId),
      );
      if (res['success']) {
        return SinglePosseGroupModel.fromJson(res['data']);
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseModel> leavePosseGroup({
    required String userId,
    required String posseId,
  }) async {
    try {
      final body = {"user_id": userId};
      final res = await posseRemote.postRequest(
        endpoints: ApiEndpoints.leavePosse(id: posseId),
        body: body,
      );
      if (res['success']) {
        return ResponseModel(success: true, message: res['message']);
      } else {
        return ResponseModel(success: false, message: res['message']);
      }
    } catch (e) {
      return ResponseModel(success: false, message: '$e');
    }
  }
}
