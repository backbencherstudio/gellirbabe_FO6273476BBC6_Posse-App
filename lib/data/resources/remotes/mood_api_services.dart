import 'package:possy_app/core/services/api_services/api_end_points.dart';
import 'package:possy_app/core/services/api_services/api_services.dart';
import 'package:possy_app/data/models/response_model.dart';

import '../../models/mood_types_model.dart';
import '../../models/today_mood_model.dart';

class MoodApiServices {
  ApiClient moodRemote;
  MoodApiServices({required this.moodRemote});
  Future<ResponseModel> getMoodStatus({required String posseId}) async {
    try {
      final res = await moodRemote.getRequest(
        endpoints: ApiEndpoints.moodStatus(id: posseId),
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

  Future<List<MoodTypesModel>?> getMoodTypes() async {
    try {
      final res = await moodRemote.getRequest(
        endpoints: ApiEndpoints.getMoodType,
      );
      if (res['success']) {
        List<MoodTypesModel> moodTypeList = [];
        for (var mood in res['data']) {
          moodTypeList.add(MoodTypesModel.fromJson(mood));
        }
        return moodTypeList;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseModel> createMood({
    required String posseId,
    required String moodId,
  }) async {
    try {
      final body = {"mood_type_id": moodId, "group_id": posseId};
      final res = await moodRemote.postRequest(
        endpoints: ApiEndpoints.createMood,
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

  Future<List<TodayMoodModel>?> getTodaysMoods({
    required String posseId,
  }) async {
    try {
      final res = await moodRemote.getRequest(
        endpoints: ApiEndpoints.todayMood(id: posseId),
      );
      if (res['success']) {
        List<TodayMoodModel> todayMoolList = [];
        for (var mood in res['data']) {
          todayMoolList.add(TodayMoodModel.fromJson(mood));
        }
        return todayMoolList;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
