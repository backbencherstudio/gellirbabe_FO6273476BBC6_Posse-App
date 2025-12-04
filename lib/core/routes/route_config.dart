import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:possy_app/core/routes/route_name.dart';
import 'package:possy_app/src/feature/account_screen/view/screens/change_my_posse/change_my_posse.dart';
import 'package:possy_app/src/feature/account_screen/view/screens/manage_notification/manage_notification.dart';
import 'package:possy_app/src/feature/account_screen/view/screens/manage_subscription/manage_subscription.dart';
import 'package:possy_app/src/feature/account_screen/view/screens/members_list/member_list_screen.dart';
import 'package:possy_app/src/feature/account_screen/view/screens/prompt/screens/add_prompt_screen.dart';
import 'package:possy_app/src/feature/account_screen/view/screens/prompt_selection/prompt_selection.dart';
import 'package:possy_app/src/feature/account_screen/view/screens/subscription_screen/subscription_screen.dart';
import 'package:possy_app/src/feature/anchor_log_screens/view/anchor_log_full_view_screen.dart';
import 'package:possy_app/src/feature/anchor_log_screens/view/selected_anchor_view_screen.dart';
import 'package:possy_app/src/feature/auth_screens/view/create_group_screens/view/congratulation_screen.dart';
import 'package:possy_app/src/feature/auth_screens/view/create_group_screens/view/create_group_screen.dart';
import 'package:possy_app/src/feature/auth_screens/view/create_group_screens/view/create_or_join_screen.dart';
import 'package:possy_app/src/feature/auth_screens/view/create_group_screens/view/select_catagory_screen.dart';
import 'package:possy_app/src/feature/auth_screens/view/signin_screens/view/sign_in_screen.dart';
import 'package:possy_app/src/feature/auth_screens/view/signup_screens/view/reset_password_screen/reset_pass_screen.dart';
import 'package:possy_app/src/feature/auth_screens/view/signup_screens/view/sign_up_screen/sign_up_screen.dart';
import 'package:possy_app/src/feature/auth_screens/view/signup_screens/view/signup_otp_screen/signup_otp_screen.dart';
import 'package:possy_app/src/feature/auth_screens/view/signup_screens/view/successfully_registere_screen/successfully_registered_screen.dart';
import 'package:possy_app/src/feature/mood_mosaic_screen/view/mood_mosaic_screen.dart';
import 'package:possy_app/src/feature/home_screen/view/home_screen.dart';
import 'package:possy_app/src/feature/notification_screens/view/notification_screen.dart';
import 'package:possy_app/src/feature/quiz_screen/view/quiz_Body/quiz_tile/quiz_tile.dart';
import 'package:possy_app/src/feature/quiz_screen/view/quiz_Screen.dart';
import 'package:possy_app/src/feature/splash_screen/presentation/splash_screen.dart';
import 'package:possy_app/src/feature/streak_screen/view/streak_screen.dart';
import 'package:possy_app/src/feature/today_mood_mosaic_screen/view/today_mood_mosaic_screen.dart';
import 'package:possy_app/src/feature/vibe_check_screen/vibe_check_screen.dart';
import 'package:possy_app/src/feature/parents_screens/view/parents_Screen.dart';
import 'package:possy_app/src/feature/welcome_screen/presentation/welcome_screen.dart';
import '../../src/feature/account_screen/view/screens/FAQ_screen/FAQ_screen.dart';
import '../../src/feature/account_screen/view/screens/account_screen/account_screen.dart';
import '../../src/feature/account_screen/view/screens/prompt/screens/edit_prompt_screen.dart';
import '../../src/feature/account_screen/view/screens/prompt/screens/prompt_vault_screen.dart';
import '../../src/feature/account_screen/view/screens/edit_account_screen/edit_profile_screen.dart';
import '../../src/feature/account_screen/view/screens/language_screen/language_screen.dart';
import '../../src/feature/auth_screens/view/forgot_password_screens/view/email_verify_screen.dart';
import '../../src/feature/auth_screens/view/forgot_password_screens/view/otp_verify_screen.dart';
import '../../src/feature/auth_screens/view/forgot_password_screens/view/successfully_reset_password_screen.dart';
import '../../src/feature/mood_mosaic_screen/view/moode_confirm_screen.dart';
import '../../src/feature/onboarding_screens/view/onboarding_screen.dart';
import 'build_page_with_transition.dart';

class RouteConfig {
  GoRouter goRouter = GoRouter(
    initialLocation: RouteName.splashScreen,


    routes: [
      GoRoute(
        name: RouteName.onboardingScreen,
        path: RouteName.onboardingScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: OnboardingScreen());
        },
      ),
      GoRoute(
        name: RouteName.signInScreen,
        path: RouteName.signInScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            transitionType: PageTransitionType.slideRightToLeft,
            context: context,
            state: state,
            child: SignInScreen(),
          );
        },
      ),
      GoRoute(
        name: RouteName.emailVerifyScreen,
        path: RouteName.emailVerifyScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            transitionType: PageTransitionType.slideRightToLeft,
            context: context,
            state: state,
            child: EmailVerifyScreen(),
          );
        },
      ),
      GoRoute(
        name: RouteName.otpVerifyScreen,
        path: RouteName.otpVerifyScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: OTPVerifyScreen());
        },
      ),
      GoRoute(
        name: RouteName.selectCatagoryScreen,
        path: RouteName.selectCatagoryScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: SelectCategoryScreen());
        },
      ),
      GoRoute(
        name: RouteName.successfullyResetPasswordScreen,
        path: RouteName.successfullyResetPasswordScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            transitionType: PageTransitionType.slideRightToLeft,
            context: context,
            state: state,
            child: SuccessfullyResetPasswordScreen(),
          );
        },
      ),
      GoRoute(
        name: RouteName.signUpScreen,
        path: RouteName.signUpScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            transitionType: PageTransitionType.slideRightToLeft,
            context: context,
            state: state,
            child: SignUpScreen(),
          );
        },
      ),
      GoRoute(
        name: RouteName.signUpOTPScreen,
        path: RouteName.signUpOTPScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            transitionType: PageTransitionType.slideRightToLeft,
            context: context,
            state: state,
            child: SignupOtpScreen(),
          );
        },
      ),
      GoRoute(
        name: RouteName.successfullyRegisteredScreen,
        path: RouteName.successfullyRegisteredScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: SuccessfullyRegisteredScreen());
        },
      ),
      GoRoute(
        name: RouteName.crateOrJoinScreen,
        path: RouteName.crateOrJoinScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            transitionType: PageTransitionType.slideRightToLeft,
            context: context,
            state: state,
            child: CreateOrJoinScreen(),
          );
        },
      ),
      GoRoute(
        name: RouteName.createGroupScreen,
        path: RouteName.createGroupScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: CreateGroupScreen());
        },
      ),

      GoRoute(
        name: RouteName.congratulationScreen,
        path: RouteName.congratulationScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            transitionType: PageTransitionType.slideRightToLeft,
            context: context,
            state: state,
            child: CongratulationScreen(),
          );
        },
      ),
      GoRoute(
        name: RouteName.homeScreen,
        path: RouteName.homeScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            transitionType: PageTransitionType.slideRightToLeft,
            context: context,
            state: state,
            child: HomeScreen(),
          );
        },
      ),
      GoRoute(
        name: RouteName.resetPAssScreen,
        path: RouteName.resetPAssScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            transitionType: PageTransitionType.slideRightToLeft,
            context: context,
            state: state,
            child: ResetPassScreen(),
          );
        },
      ),
      GoRoute(
        name: RouteName.parentsScreen,
        path: RouteName.parentsScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            transitionType: PageTransitionType.slideRightToLeft,
            context: context,
            state: state,
            child: ParentsScreen(),
          );
        },
      ),
      GoRoute(
        name: RouteName.vibeCheckScreen,
        path: RouteName.vibeCheckScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: VibeCheckScreen());
        },
      ),

      GoRoute(
        name: RouteName.accountScreen,
        path: RouteName.accountScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: AccountScreen());
        },
      ),
      GoRoute(
        name: RouteName.editProfileScreen,
        path: RouteName.editProfileScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: EditProfileScreen());
        },
      ),

      GoRoute(
        name: RouteName.languagePreferencesScreen,
        path: RouteName.languagePreferencesScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: LanguageScreen());
        },
      ),
      GoRoute(
        name: RouteName.manageNotificationScreen,
        path: RouteName.manageNotificationScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: ManageNotification());
        },
      ),
      GoRoute(
        name: RouteName.streakScreen,
        path: RouteName.streakScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: StreakScreen());
        },
      ),
      GoRoute(
        name: RouteName.subscriptionScreen,
        path: RouteName.subscriptionScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: SubscriptionScreen());
        },
      ),
      GoRoute(
        name: RouteName.manageSubscriptionScreen,
        path: RouteName.manageSubscriptionScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: ManageSubscription());
        },
      ),
      GoRoute(
        name: RouteName.memberListScreen,
        path: RouteName.memberListScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: MemberListScreen());
        },
      ),
      GoRoute(
        name: RouteName.promptVault,
        path: RouteName.promptVault,
        pageBuilder: (context, state) {
          return const MaterialPage(child: PromptVaultScreen());
        },
      ),
      GoRoute(
        name: RouteName.faqScreen,
        path: RouteName.faqScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: FaqScreen());
        },
      ),
      GoRoute(
        name: RouteName.addPromptScreen,
        path: RouteName.addPromptScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: AddPromptScreen());
        },
      ),
      GoRoute(
        name: RouteName.anchorLogFullViewScreen,
        path: RouteName.anchorLogFullViewScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: AnchorLogFullViewScreen());
        },
      ),
      GoRoute(
        name: RouteName.selectedAnchorViewScreen,
        path: RouteName.selectedAnchorViewScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: SelectedAnchorViewScreen());
        },
      ),
      GoRoute(
        name: RouteName.editPromptScreen,
        path: RouteName.editPromptScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: EditPromptScreen());
        },
      ),
      GoRoute(
        name: RouteName.moodMosaicScreen,
        path: RouteName.moodMosaicScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: MoodMosaicScreen());
        },
      ),
      GoRoute(
        name: RouteName.quiz,
        path: RouteName.quiz,
        pageBuilder: (context, state) {
          return const MaterialPage(child: QuizScreen());
        },
      ),
      GoRoute(
        name: RouteName.todayMoodMosaicScreen,
        path: RouteName.todayMoodMosaicScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            transitionType: PageTransitionType.fade,
            context: context,
            state: state,
            child: TodayMoodMosaicScreen(),
          );
          //return const MaterialPage(child: TodayMoodMosaicScreen());
        },
      ),
      GoRoute(
        name: RouteName.notificationScreen,
        path: RouteName.notificationScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            transitionType: PageTransitionType.slideRightToLeft,
            context: context,
            state: state,
            child: NotificationScreen(),
          );

          //return const MaterialPage(child: TodayMoodMosaicScreen());
        },
      ),
      GoRoute(
        path: '${RouteName.quiztile}/:index',
        name: RouteName.quiztile,
        builder: (context, state) {
          final index = int.parse(state.pathParameters['index']!);
          return QuizTile(index: index);
        },
      ),
      GoRoute(
        name: RouteName.promptSection,
        path: RouteName.promptSection,
        pageBuilder: (context, state) {
          return const MaterialPage(child: PromptSelection());
        },
      ),
      GoRoute(
        name: RouteName.changeMyPosse,
        path: RouteName.changeMyPosse,
        pageBuilder: (context, state) {
          return const MaterialPage(child: ChangeMyPosse());
        },
      ),
      GoRoute(
        name: RouteName.splashScreen,
        path: RouteName.splashScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: SplashScreen());
        },
      ),
      GoRoute(
        name: RouteName.welcomeScreen,
        path: RouteName.welcomeScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: WelcomeScreen());
        },
      ),

      GoRoute(
        name: RouteName.moodConfirmScreen,
        path: RouteName.moodConfirmScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            transitionType: PageTransitionType.slideRightToLeft,
            context: context,
            state: state,
            child: MoodConfirmScreen(),
          );

          //return const MaterialPage(child: TodayMoodMosaicScreen());
        },
      ),


    ],
  );
}
