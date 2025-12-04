import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:possy_app/core/constant/icons.dart';
import 'package:possy_app/core/routes/route_name.dart';

import '../common_style/timeline_style/timeline_color.dart';

class CommonWidgets {
  /// App primary button
  static Widget primaryButton({
    required BuildContext context,
    required String title,
    required Color color,
    required Color textColor,
    required VoidCallback onPressed,
    EdgeInsets? padding,
    TextStyle? textTheme,
  }) {
    final bodyLarge = Theme.of(context).textTheme.bodyLarge;

    return SizedBox(
      height: 56.h,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: padding ?? EdgeInsets.zero,
          backgroundColor: color,
          elevation: 0,
          splashFactory: NoSplash.splashFactory,
        ),
        child: Text(
          title,
          style: textTheme ?? bodyLarge?.copyWith(
            color:
                textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  static Widget circleButton({
    required String imgPath,
    required Function onTap,
    EdgeInsets? padding,
    EdgeInsets? margin,
    Size? imageSize,
    Color? backgroundColor,
    Color? color,
  }) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          imgPath,
          height: imageSize?.height ?? 20.h,
          width: imageSize?.width ?? 20.w,
          fit: BoxFit.cover,
          colorFilter:
              color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
        ),
      ),
    );
  }

  static Widget customAppBar({
    bool? isBackButton,
    Color? backButtonColor,
    required BuildContext context,
    String? leadingImagePath,
    Size? leadingImageSize,
    Function? leadingButtonOnTap,
    required String title,
    required Color titleColor,
    String? subtitle,
    String? subtitleImagePath,
    Size? subtitleImageSize,
    Color? subtitleColor,
    Color? leadingBgColor,
    bool? centerTitle = false,
    Widget? actionWidgets,
    EdgeInsets? margin,
    double? fontSize,
    // void Function()? onTap
  }) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Leading
            if (isBackButton != null && isBackButton)
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: SizedBox(
                  width: 32.w,
                  height: 32.h,
                  child: ClipRRect(child: SvgPicture.asset(AppIcons.backArrow)),
                ),
              )
            else if (leadingImagePath != null)
              GestureDetector(
                onTap: () {
                  leadingButtonOnTap!();
                },
                child: Container(
                  // margin:
                  // //  margin ??
                  // EdgeInsets.only(left: 16.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: leadingBgColor ?? Colors.transparent,
                  ),
                  child: ClipRRect(
                    child: Image.asset(
                      leadingImagePath,
                      width: 50.w,
                      height: 50.w,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

            SizedBox(width: 12.w),
            if (centerTitle != null && centerTitle) Spacer(),

            /// Title
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: titleColor,
                    fontSize: fontSize?? 20.sp,
                  ),
                ),
                if (subtitle != null)
                  Row(
                    children: [
                      if (subtitleImagePath != null)
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              subtitleImagePath,
                              width: subtitleImageSize?.width ?? 14.w,
                              height: subtitleImageSize?.height ?? 14.h,
                            ),
                            SizedBox(width: 4.w),
                          ],
                        ),
                      Text(
                        subtitle,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: subtitleColor ?? Colors.white,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
            
            Spacer(),

            /// Actions
            Row(children: [if (actionWidgets != null) actionWidgets]),
          ],
        ),
      ),
    );

    
  }


  /// Confirmation dialog, when call, will open a bottom sheet
  static Future<bool> customConfirmationBottomSheet({
    required BuildContext context,
    String? iconPath,
    String? bodyText,
    required String confirmButtonText,
    String? headerText,
    Function? onCancel,
    required Function onConfirm,
    Color? cancelButtonColor,
    Color? confirmationButtonColor,
    Color? iconColor,
    Widget? bodyWidget,
    double? maxBottomSheetHeight,
    Widget? oneBottomButton,
  }) async {
    bool isConfirm = false;
    var value = await showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return Container(
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 20.h),
            padding: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
              bottom: 20.h,
              top: 12.h,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 40.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      color: TimelineColor.iconColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  SizedBox(height: 25.h),

                  Column(
                    children: [
                      /// Pass Body Widget Or Body Icon, Header Text & Body Text
                      bodyWidget ??
                          Column(
                            children: [
                              SizedBox(
                                child: SvgPicture.asset(
                                  iconPath ?? AppIcons.report,
                                ),
                              ),
                              SizedBox(height: 25.h),
                              Text(
                                headerText ?? "Are You Sure?",
                                style: Theme.of(context).textTheme.titleSmall
                                    ?.copyWith(color: TimelineColor.textColor),
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                bodyText ?? "",
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium?.copyWith(
                                  color: TimelineColor.lightTextColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                      SizedBox(height: 35.h),
                      //  if(MediaQuery.of(context).viewInsets.bottom == 0)
                      ///Cancel Button
                      oneBottomButton ??
                          Row(
                            spacing: 12.w,
                            children: [
                              Expanded(
                                child: primaryButton(
                                  context: context,
                                  title: "Cancel",
                                  color:
                                      cancelButtonColor ??
                                      TimelineColor.secondaryColor,
                                  textColor: TimelineColor.textColor,
                                  onPressed: () {
                                    isConfirm = false;
                                    onCancel ?? Navigator.pop(context);
                                  },
                                ),
                              ),

                              /// Confirm Button
                              Expanded(
                                child: primaryButton(
                                  context: context,
                                  title: confirmButtonText,
                                  color:
                                      confirmationButtonColor ??
                                      TimelineColor.primaryColor,
                                  textColor: TimelineColor.onPrimaryColor,
                                  onPressed: () {
                                    isConfirm = true;
                                    onConfirm();
                                  },
                                ),
                              ),
                            ],
                          ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
    return isConfirm;
  }

  static Widget notificationButton({
    required BuildContext context,
    bool? isRead,
  }) {
    return circleButton(
      padding: EdgeInsets.all(10.r),
      imgPath: AppIcons.notification,
      imageSize: Size(20.w, 20.h),
      onTap: () {
        debugPrint("\nPressed on notification button.\n");
        context.push(RouteName.notificationScreen);
      },
    );
  }
}
