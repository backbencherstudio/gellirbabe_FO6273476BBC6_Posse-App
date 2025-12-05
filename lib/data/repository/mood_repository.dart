import '../models/mood_types_model.dart' show MoodTypesModel;
import '../models/response_model.dart';
import '../models/today_mood_model.dart';
import '../resources/remotes/mood_api_services.dart';

class MoodRepository {
  MoodApiServices moodRepo;
  MoodRepository({required this.moodRepo});
  Future<ResponseModel> getMoodStatus({required String posseId}) async {
    return await moodRepo.getMoodStatus(posseId: posseId);
  }

  Future<List<MoodTypesModel>?> getMoodTypes() async {
    return await moodRepo.getMoodTypes();
  }

  Future<ResponseModel> createMood({
    required String posseId,
    required String moodId,
  }) async {
    return await moodRepo.createMood(posseId: posseId, moodId: moodId);
  }

  Future<List<TodayMoodModel>?> getTodaysMoods({
    required String posseId,
  }) async {
    return await moodRepo.getTodaysMoods(posseId: posseId);
  }
}
