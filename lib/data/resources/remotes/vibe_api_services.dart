import 'package:possy_app/core/services/api_services/api_end_points.dart';
import 'package:possy_app/core/services/api_services/api_services.dart';
import 'package:possy_app/data/models/response_model.dart';

import '../../models/vibe_history_model.dart';
import '../../models/vibe_result_model.dart';
import '../../models/vive_question_model.dart';

class VibeApiServices {
  ApiClient vibeRemote;
  VibeApiServices({required this.vibeRemote});

  Future<ViveQuestionModel?> getVibeQuestion({required String posseId}) async {
    try {
      final res = await vibeRemote.getRequest(
        endpoints: ApiEndpoints.vibeQuestion(posseId: posseId),
      );
      if (res['success']) {
        return ViveQuestionModel.fromJson(res['data']);
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseModel> submitVibeAns({
    required String posseId,
    required String postId,
    required String ans,
    required String postOptionId,
  }) async {
    try {
      final body = {
        "answers": [
          {"post_option_id": postOptionId, "answer_text": postOptionId},
        ],
      };
      final res = await vibeRemote.postRequest(
        endpoints: ApiEndpoints.vibeQuestionAns(posseId: posseId, postId: postId),
        body: body,
      );
      if (res['success']) {
        return ResponseModel(isSuccess: true, message: res['message']);
      } else {
        return ResponseModel(isSuccess: false, message: res['message']);
      }
    } catch (e) {
      return ResponseModel(isSuccess: false, message: '$e');
    }
  }

  Future<List<VibeHistoryModel>?> getVibeHistory({
    required String posseId,
  }) async {
    try {
      final res = await vibeRemote.getRequest(
        endpoints: ApiEndpoints.vibeHistory(posseId: posseId),
      );
      if (res['success']) {
        List<VibeHistoryModel> historyList = [];
        for (var vibe in res['data']) {
          historyList.add(VibeHistoryModel.fromJson(vibe));
        }

        return historyList;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
    Future<VibeResultModel?> getVibeResult({   required String posseId,
    required String postId,}) async {
    try {
      final res = await vibeRemote.getRequest(
        endpoints:  ApiEndpoints.vibeResult(posseId: posseId, postId: postId),
      );
      if (res['success']) {
        return VibeResultModel.fromJson(res['data']);
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
