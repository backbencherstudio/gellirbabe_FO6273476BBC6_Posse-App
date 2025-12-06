import 'package:possy_app/data/models/response_model.dart';
import 'package:possy_app/data/models/vive_question_model.dart';
import 'package:possy_app/data/resources/remotes/vibe_api_services.dart';

class VibeRepository {
  VibeApiServices vibeRepo;
  VibeRepository({required this.vibeRepo});
  Future<ViveQuestionModel?> getVibeQuestion({required String posseId}) async {
    return await vibeRepo.getVibeQuestion(posseId: posseId);
  }

  Future<ResponseModel> submitVibeAns({
    required String posseId,
    required String postId,
    required String ans,
    required String postOptionId,
  }) async {
 return await   vibeRepo.submitVibeAns(
      posseId: posseId,
      postId: postId,
      ans: ans,
      postOptionId: postOptionId,
    );
  }
}
