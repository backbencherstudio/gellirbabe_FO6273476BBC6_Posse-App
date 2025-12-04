import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:possy_app/core/routes/route_name.dart';
import 'package:possy_app/src/common_widget_style/common_style/anchor_log_style/anchor_log_color.dart';
import 'package:possy_app/src/feature/anchor_log_screens/view/widgets/anchor_log_common_container.dart';
import 'package:possy_app/src/feature/anchor_log_screens/view/widgets/anchor_log_divider.dart';
import 'package:possy_app/src/feature/vibe_check_screen/widgets/avatar_stack.dart';

final String avatarImageUrl =
    "https://media.licdn.com/dms/image/v2/D5603AQFdD2aaGDI_ag/profile-displayphoto-shrink_200_200/B56ZRrKXX5HoAc-/0/1736964668235?e=2147483647&v=beta&t=YVA5QPxJ9_0duc5ahUZggBc4k1cMD8b5eULrnBNbrng";

class AnchorLogBody extends StatelessWidget {
  const AnchorLogBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemBuilder: (_, index) {
        return Column(
          //spacing: 16.h,
          children: [
            SizedBox(height: 16.h),

            AnchorLogDivider(dividerText: "04/0725"),

            SizedBox(height: 16.h),

            GestureDetector(
              onTap: () => context.push(RouteName.selectedAnchorViewScreen),
              child: AnchorLogCommonContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16.h,
                  children: [
                    Text(
                      "If your mood was a will smith movie today, which one would you be?",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: AnchorLogColor.textColor,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),

                    AvatarStack(
                      imageUrls: [
                        avatarImageUrl,
                        avatarImageUrl,
                        avatarImageUrl,
                        avatarImageUrl,
                        avatarImageUrl,
                        avatarImageUrl,
                        avatarImageUrl,
                        avatarImageUrl,
                        avatarImageUrl,
                      ],
                      maxDisplay: 3,
                      showExtra: true,
                      showExtraBackgroundColor:
                          AnchorLogColor.streakDeActiveBackgroundColor,
                      showExtraTextColor:
                          AnchorLogColor.streakDeActiveForegroundColor,
                    ),
                  ],
                ),
              ),
            ),

            //SizedBox(height: 16.h,),
          ],
        );
      },
    );
  }
}
