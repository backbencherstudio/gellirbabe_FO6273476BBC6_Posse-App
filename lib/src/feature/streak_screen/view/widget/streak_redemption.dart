import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:possy_app/core/theme/src/theme_extension/color_pallete.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_widgets.dart';

import '../../../../common_widget_style/common_widgets/spacer/auto_spacer.dart';
import 'calendar_widget.dart';

// class StreakRedemption extends StatelessWidget {
//   const StreakRedemption({super.key});

@override
Widget build(BuildContext context) {
  TextTheme textTheme = Theme.of(context).textTheme;
  return Column(
    children: [
      Center(
        child: Container(
          height: 5.w,
          width: 40.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: const Color(0xff171717),
          ),
        ),
      ),
      AutoSpacer(space: 24.h),
      CalendarWidget(),
      AutoSpacer(space: 24.h),
      Text('Select a date', style: textTheme.titleSmall),
      SizedBox(height: 5.h),
      Text('Redeem your streak', style: textTheme.labelLarge),
      AutoSpacer(space: 24.h),
      Row(
        children: [
          Expanded(
            child: CommonWidgets.primaryButton(
              context: context,
              title: 'Cancel',
              color: AppColor.surfaceColor,
              textColor: Colors.black,
              onPressed: () {
                context.pop();
              },
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: CommonWidgets.primaryButton(
              context: context,
              title: 'Continue',
              color: AppColor.primaryColor,
              textColor: Colors.black,
              onPressed: () {
                context.pop();
              },
            ),
          ),
        ],
      ),
      AutoSpacer(space: 10.h),
    ],
  );
}
