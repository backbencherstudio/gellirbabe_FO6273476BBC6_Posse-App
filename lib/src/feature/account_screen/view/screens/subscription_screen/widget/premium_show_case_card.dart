import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/constant/icons.dart';
import '../../../../../../../core/theme/src/theme_extension/color_pallete.dart';
import '../../../../../../common_widget_style/common_widgets/spacer/auto_spacer.dart';
import '../../../../../vibe_check_screen/widgets/avatar_stack.dart';
import 'build_feature.dart';
import 'subscription_plan_builder.dart';

class PremiumShowCaseCard extends StatelessWidget {
  const PremiumShowCaseCard({super.key, required this.textTheme});

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Subscribe for VIP Gang Access & Benefits',
            style: textTheme.headlineMedium!.copyWith(),
          ),
          AutoSpacer(space: 20.h),
          BuildFeature(
            image: AppIcons.addImage,
            title: 'Respond to anchor questions with image and video',
          ),
          AutoSpacer(space: 14),
          BuildFeature(
            image: AppIcons.aITools,
            title: 'Gain access to AI helping tools for responses',
          ),
          AutoSpacer(space: 14),
          BuildFeature(
            image: AppIcons.unLimited,
            title: 'Unlimited access to group me quizzes',
          ),
          AutoSpacer(space: 14),
          BuildFeature(
            image: AppIcons.groups,
            title: 'increase maximum posse members from 8 to 50',
          ),
          AutoSpacer(space: 20.h),
          SubscriptionPlanBuilder(textTheme: textTheme),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 30.w),
          //   child: Row(
          //     children: [
          //       Expanded(child: Divider()),
          //       Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 5.w),
          //         child: Text("2025 year of the App"),
          //       ),
          //       Expanded(child: Divider()),
          //     ],
          //   ),
          // ),
          // AutoSpacer(space: 12.h),
          // Row(
          //   children: [
          //     AvatarStack(
          //       maxDisplay: 3,
          //       showExtra: false,
          //       imageUrls: List.generate(
          //         100,
          //         (i) => 'https://randomuser.me/api/portraits/men/${i + 1}.jpg',
          //       ),
          //     ),
          //     Text(
          //       'Join 500k+ users mastering English!',
          //       style: textTheme.bodyMedium,
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
