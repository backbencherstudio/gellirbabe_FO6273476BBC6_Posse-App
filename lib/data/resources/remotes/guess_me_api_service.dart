import 'package:possy_app/core/services/api_services/api_end_points.dart';
import 'package:possy_app/core/services/api_services/api_services.dart';
import 'package:possy_app/data/models/guess_me_my_submission_status.dart';
import 'package:possy_app/data/models/guess_me_question_model.dart';
import 'package:possy_app/data/models/response_model.dart';

import '../../models/guess_me_categories_model.dart';
import '../../models/guess_me_other_member_ans.dart';
import '../../models/guess_me_result_model.dart';

class GuessMeApiService {
  ApiClient guessMeRemote;
  GuessMeApiService({required this.guessMeRemote});
  Future<List<GuessMeCategoriesModel>?> getGuessMeCategories() async {
    try {
      final res = await guessMeRemote.getRequest(
        endpoints: ApiEndpoints.guessMeCategories,
      );
      if (res['success']) {
        List<GuessMeCategoriesModel> guessMeCatList = [];
        for (var guess in res['data']) {
          guessMeCatList.add(GuessMeCategoriesModel.fromJson(guess));
        }
        return guessMeCatList;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

Future<GuessMeQuestionModel?>getGuessQuestion({required String categoryId})async{
    try {
      final res = await guessMeRemote.getRequest(
        endpoints: ApiEndpoints.guessMeQuestion(categoryId: categoryId),
      );
      if (res['success']) {
       
        return GuessMeQuestionModel.fromJson(res['data']);
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }

} Future<ResponseModel> submitGuessAns({required String posseId,required String postId,required String questionOptionId}) async {
  try{  final body = {"question_option_id": questionOptionId};
    final res = await guessMeRemote.postRequest(
      endpoints: ApiEndpoints.guessMeSubmitAns(posseId: posseId, postId: postId),
      body: body,
    );
    if (res['success']) {
      return ResponseModel(isSuccess: true, message: res['message']);
    }else{
       return ResponseModel(isSuccess: false, message: res['message']);
    }}catch(e){
       return ResponseModel(isSuccess: true, message: '$e');
    }
  }
Future<SubmitionStatusModel?>getMySubmissionStatus({required String posseId,required String postId})async{
    try {
      final res = await guessMeRemote.getRequest(
        endpoints: ApiEndpoints.guessMeSubmitionStatus(posseId: posseId, postId: postId),
      );
      if (res['success']) {
      
        return SubmitionStatusModel.fromJson(res['data']);
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }

}
Future<OtherMemberAnsModel?>getOtherMemberAns({required String posseId,required String postId})async{
    try {
      final res = await guessMeRemote.getRequest(
        endpoints: ApiEndpoints.guessMeOtherMemberAns(posseId: posseId, postId: postId),
      );
      if (res['success']) {
      
        return OtherMemberAnsModel.fromJson(res['data']);
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }

}


 
  Future<ResponseModel> submitGuessQuestion({required String posseId,required String submissionId,required String guessedUserId}) async {
  try{  final body = {
	"guessed_user_id": guessedUserId
};
    final res = await guessMeRemote.postRequest(
      endpoints: ApiEndpoints.submitGuessMeQuestion(posseId: posseId, submissionId: submissionId),
      body: body,
    );
    if (res['success']) {
      return ResponseModel(isSuccess: true, message: res['message']);
    }else{
       return ResponseModel(isSuccess: false, message: res['message']);
    }}catch(e){
       return ResponseModel(isSuccess: true, message: '$e');
    }
  }
  Future<GuessMeResultModel?>getGuessResult({required String posseId,required String postId})async{
    try {
      final res = await guessMeRemote.getRequest(
        endpoints: ApiEndpoints.guessResult(posseId: posseId, postId: postId),
      );
      if (res['success']) {
      
        return GuessMeResultModel.fromJson(res['data']);
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }

}
}
