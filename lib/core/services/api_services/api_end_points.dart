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

  //===========================Guess me===============================
  //===========================Weekly vibe check===============================
  //===========================Moods===============================
  //===========================Vibe check===============================

  // static const String createPosse = "api/group";
  // static const String joinPosse = "api/group/join/code";
  // static  String getAllPosse(int page) => "api/group?page=$page&limit=10";
  // static String getPosseDetails(String id) => "api/group/$id";
  // static String getRequestedMembersList(String id) =>
  //     "api/group/join-requests/$id";
  // static String acceptOrRejectMember(String id) => "api/group/join-request/$id";

  // static const String getMoodType = "api/moods/mood-types";
  // static const String createMood = "api/moods";
  // static String getAllTodayMood(String id) => "api/moods/groups/$id";
  // static String getMoodStatus(String id) => "api/moods/status/groups/$id";

  // static String getVibeCheckQuestion(String id) =>
  //     "api/groups/$id/vibe-checks/question";
  // static String answerVibeCheckQuestion(String grpId, String postId) =>
  //     "api/groups/$grpId/vibe-checks/$postId/answers";
  // static String vibeCheckResultQuestion(String grpId, String postId) =>
  //     "api/groups/$grpId/vibe-checks/$postId/results";
  // static String vibeCheckHistory(String grpId) =>
  //     "api/groups/$grpId/vibe-checks";
}
