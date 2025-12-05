class ApiEndpoints {
  static const String baseUrl =
      'https://rural-receives-regulation-longer.trycloudflare.com/api';

  //===========================Auth===============================
  static const String register = 'auth/register';
  static const String verifyRegistration = 'auth/verify-registration';
  static const String login = 'auth/login';
  static const String forgotPassword = "auth/forgot-password";
  static const String verifyOTP = "auth/verify-otp";
  static const String resetPassword = "auth/reset-password";

  //===========================Account===============================
  static const String me = 'auth/me';
  static const String changeName = 'accounts/change-name';
  static const String changeAvatar = 'accounts/avatar';
  static const String changeEmail = 'api/accounts/change-email';
  static const String changePassword = 'accounts/change-password';
  static const String deleteAccount = 'accounts/delete-account';

  //===========================Posse===============================
  static String ansNAnchorQuestion({required String id}) =>
      'group/$id/questions';
  static String posseQuestionNAns({required String id}) =>
      'group/$id/questions';
  static String getAllRequestByPosseId({required String id}) =>
      'group/join-requests/$id';
  static String acceptOrRejectMember({required String id}) =>
      'group/join-request/$id';
  static const String joinPosse = 'group/join/code';
  static const String createPosse = 'group';
  static String getAllPosse({required int page}) =>
      'api/group?page=$page&limit=10';
  static String getPosseById({required String id}) => 'group/$id';
  static String leavePosse({required String id}) => 'group/$id/leave';

  //===========================Guess me===============================


  //===========================Moods===============================
  static const String getMoodType = 'moods/mood-types';
  static const String createMood = 'moods';
  static String moodStatus({required String id}) => 'moods/status/groups/$id';
  static String todayMood({required String id}) => 'moods/status/groups/$id';

  //===========================Vibe check===============================
      static String vibeQuestion({required String posseId}) => 'groups/$posseId/vibe-checks/question';
      static String vibeQuestionAns({required String posseId,required String postId}) => 'groups/$posseId/vibe-checks/$postId/answers';
      static String vibeHistory({required String posseId}) => 'groups/$posseId/vibe-checks';
      static String vibeResult({required String posseId,required String postId}) => 'groups/$posseId/vibe-checks/$postId/results';

 
}
