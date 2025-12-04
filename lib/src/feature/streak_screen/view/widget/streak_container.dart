import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/core/constant/padding.dart';
import 'package:possy_app/src/feature/anchor_log_screens/view/widgets/anchor_log_streak_show.dart';

class StreakContainer extends StatelessWidget {
  const StreakContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle = Theme.of(context).textTheme;

    return Padding(
      padding: AppPadding.screenHorizontalPadding,
      child: Container(
        height: 280.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Color(0xffffffff),
        ),
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(12.0),
            //   child: SingleChildScrollView(
            //     scrollDirection: Axis.horizontal,
            //     child: Row(
            //       spacing: 16.w,
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         FireCircle(isLit: true, day: "Week 1"),
            //         FireCircle(isLit: true, day: "Week 2"),
            //         FireCircle(isLit: true, day: "Week 3"),
            //         FireCircle(isLit: false, day: "Week 4"),
            //         FireCircle(isLit: true, day: "Week 5"),
            //         FireCircle(isLit: true, day: "Week 6"),
            //         FireCircle(isLit: true, day: "Week 7"),
            //       ],
            //     ),
            //   ),
            // ),
            StreakShow(isDayStreakShow: true),

            SizedBox(height: 30.h),
            // Center(
            //   child: Column(
            //     children: [
            //       SvgPicture.asset(AppIcons.bigLit),
            //       SizedBox(height: 12.h),
            //       Text(
            //         "7 Day Streak!",
            //         style: TextStyle.headlineSmall!.copyWith(
            //           fontWeight: FontWeight.w700,
            //           color: Color(0xff1D1F2C),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
