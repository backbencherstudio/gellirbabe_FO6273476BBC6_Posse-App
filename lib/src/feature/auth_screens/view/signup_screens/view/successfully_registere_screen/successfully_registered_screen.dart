import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:possy_app/core/routes/route_name.dart';
import 'package:possy_app/src/common_widget_style/common_style/auth_style/auth_color_pallete.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_widgets.dart';

import '../../../../../../../core/constant/icons.dart';

class SuccessfullyRegisteredScreen extends StatelessWidget {
  const SuccessfullyRegisteredScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// Text Theme
    final bodyLarge = Theme.of(context).textTheme.bodyLarge;
    final headlineSmall = Theme.of(context).textTheme.headlineSmall;

    return Scaffold(
      backgroundColor: AuthColorPalette.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                SvgPicture.asset(AppIcons.registerIcon),
                SizedBox(height: 40.h),
                Text(
                  "Registration Complete!",
                  style: headlineSmall?.copyWith(
                    color: AuthColorPalette.titleColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(
                    "Your Posse account is all set—welcome aboard!",
                    textAlign: TextAlign.center,

                    style: bodyLarge?.copyWith(
                      color: AuthColorPalette.bodyTextColor,
                    ),
                  ),
                ),
                Spacer(),
                CommonWidgets.primaryButton(
                  context: context,
                  title: "Create or Join a Posse",
                  color: AuthColorPalette.primary,
                  textColor: AuthColorPalette.white,
                  onPressed: () {
                    context.go(RouteName.crateOrJoinScreen);
                  },
                ),
                SizedBox(height: 56.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
