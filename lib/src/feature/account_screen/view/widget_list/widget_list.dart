import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:possy_app/core/routes/route_name.dart';
import 'package:possy_app/core/theme/src/theme_extension/color_pallete.dart';

import '../../../../../core/constant/icons.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../common_widget_style/common_style/account_style/account_color.dart';
import '../../../../common_widget_style/common_widgets/common_widgets.dart';
import '../editing_field/change_email.dart';
import '../editing_field/change_name.dart';
import '../editing_field/change_password.dart';

class AccountWidgetList {
  static List<Widget> manageAccount(BuildContext context) => [
    Utils.accountOptionTile(
      context: context,
      title: 'Profile Information',
      leadingAsset: AppIcons.accountProfileIcon,
      avatarBackgroundColor: AccountColor.manageAccountBg,
      onPressed: () {
        context.push(RouteName.editProfileScreen);
      },
    ),
    /*Utils.accountOptionTile(
      context: context,
      title: 'Language Preferences',
      leadingAsset: AppIcons.accountLanguagePreference,
      avatarBackgroundColor: AccountColor.manageAccountBg,
      onPressed: () {
        context.push(RouteName.languagePreferencesScreen);
      },
    ),*/
    Utils.accountOptionTile(
      context: context,
      title: 'Notification Preferences',
      leadingAsset: AppIcons.accountNotificationPreference,
      avatarBackgroundColor: AccountColor.manageAccountBg,
      onPressed: () {
        context.push(RouteName.manageNotificationScreen);
      },
    ),
    Utils.accountOptionTile(
      context: context,
      title: 'Manage Subscription',
      leadingAsset: AppIcons.accountSubscriptionPreference,
      avatarBackgroundColor: AccountColor.manageAccountBg,
      onPressed: () {
        context.push(RouteName.subscriptionScreen);
      },
    ),
  ];

  static List<Widget> posse(BuildContext context) => [
    Utils.accountOptionTile(
      context: context,
      title: 'Members',
      leadingAsset: AppIcons.accountPosseUser,
      avatarBackgroundColor: AccountColor.posseBg,
      onPressed: () {
        context.push(RouteName.memberListScreen);
      },
    ),
    Utils.accountOptionTile(
      context: context,
      title: 'Prompt Vault',
      leadingAsset: AppIcons.promptVault,
      avatarBackgroundColor: AccountColor.posseBg,
      onPressed: () {
        context.push(RouteName.promptVault);
      },
    ),
    Utils.accountOptionTile(
      context: context,
      title: 'Prompt Selection',
      leadingAsset: AppIcons.promptVault,
      avatarBackgroundColor: AccountColor.posseBg,
      onPressed: () {
        context.push(RouteName.promptSection);
      },
    ),
    Utils.accountOptionTile(
      context: context,
      title: 'Change MyPosse',
      leadingAsset: AppIcons.groupPosseAccount,
      avatarBackgroundColor: AccountColor.posseBg,
      onPressed: () {
        context.push(RouteName.changeMyPosse);
      },
    ),
  ];

  static List<Widget> helpSupport(BuildContext context) => [
    Utils.accountOptionTile(
      context: context,
      title: 'View FAQs',
      leadingAsset: AppIcons.accountSupportUser,
      avatarBackgroundColor: AccountColor.supportBg,
      onPressed: () {
        context.push(RouteName.faqScreen);
      },
    ),
    Utils.accountOptionTile(
      context: context,
      title: 'Logout',
      leadingAsset: AppIcons.accountLogout,
      avatarBackgroundColor: AccountColor.supportBg,
      onPressed: () {
        CommonWidgets.customConfirmationBottomSheet(
          context: context,
          confirmButtonText: 'Logout',
          onConfirm: () {},
          iconPath: AppIcons.logoutIconButton,
          bodyText: 'Do you want to logout?',
          headerText: 'Are You Sure?',
          confirmationButtonColor: AppColor.notifyRed,
        );
      },
    ),
  ];

  static List<Widget> editProfile(BuildContext context) => [
    Utils.accountOptionTile(
      context: context,
      title: 'Change Name',
      leadingAsset: AppIcons.userEditProfile,
      avatarBackgroundColor: AppColor.surfaceColor,
      onPressed: () {
        Utils.openBottomSheet(context, ChangeName());
      },
    ),
    Utils.accountOptionTile(
      context: context,
      title: 'Email',
      email: 'James@gmail.com',
      leadingAsset: AppIcons.emailEditProfile,
      avatarBackgroundColor: AppColor.surfaceColor,
      onPressed: () {
        Utils.openBottomSheet(context, ChangeEmail());
      },
    ),
    Utils.accountOptionTile(
      context: context,
      title: 'Change Password',
      leadingAsset: AppIcons.changePassEditProfile,
      avatarBackgroundColor: AppColor.surfaceColor,
      onPressed: () {
        Utils.openBottomSheet(context, ChangePassword());
      },
    ),
    Utils.accountOptionTile(
      context: context,
      title: 'Delete Account',
      titleColor: AppColor.notifyRed,
      leadingAsset: AppIcons.delete,
      avatarBackgroundColor: AccountColor.supportBg,
      onPressed: () {
        CommonWidgets.customConfirmationBottomSheet(
          context: context,
          confirmButtonText: 'Delete',
          onConfirm: () {},
          iconPath: AppIcons.trashEditProfile,
          bodyText: 'Do you want to delete this account?',
          headerText: 'Are You Sure?',
          confirmationButtonColor: AppColor.notifyRed,
        );
      },
    ),
  ];
}
