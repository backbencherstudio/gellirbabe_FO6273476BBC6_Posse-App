import 'package:possy_app/data/models/guess_me_categories_model.dart';
import 'package:possy_app/data/models/guess_me_my_submission_status.dart';
import 'package:possy_app/data/models/guess_me_other_member_ans.dart';
import 'package:possy_app/data/resources/remotes/guess_me_api_service.dart';

import '../models/response_model.dart';

class GuessMeRepository {
  GuessMeApiService guessMeRemote;
  GuessMeRepository({required this.guessMeRemote});
  Future<List<GuessMeCategoriesModel>?> getGuessMeCategories() async {
    return await guessMeRemote.getGuessMeCategories();
  }

  Future<ResponseModel> submitGuessAns({
    required String posseId,
    required String postId,
    required String questionOptionId,
  }) async {
    return await guessMeRemote.submitGuessAns(
      posseId: posseId,
      postId: postId,
      questionOptionId: questionOptionId,
    );
  }

  Future<SubmitionStatusModel?> getMySubmissionStatus({
    required String posseId,
    required String postId,
  }) async {
    return await guessMeRemote.getMySubmissionStatus(
      posseId: posseId,
      postId: postId,
    );
  }

  Future<OtherMemberAnsModel?> getOtherMemberAns({
    required String posseId,
    required String postId,
  }) async {
    return await guessMeRemote.getOtherMemberAns(posseId: posseId, postId: postId);
  }

  Future<ResponseModel> submitGuessQuestion({
    required String posseId,
    required String submissionId,
    required String guessedUserId,
  }) async {
    return await guessMeRemote.submitGuessQuestion(
      posseId: posseId,
      submissionId: submissionId,
      guessedUserId: guessedUserId,
    );
  }
}
