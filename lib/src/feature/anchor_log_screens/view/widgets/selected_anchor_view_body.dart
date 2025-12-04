import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/images.dart';
import '../../../../common_widget_style/common_style/anchor_log_style/anchor_log_color.dart';
import 'anchor_log_common_container.dart';

class SelectedAnchorViewBody extends StatelessWidget {
  const SelectedAnchorViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AnchorLogCommonContainer(
      child: Column(
        children: [
          Text(
            "If your mood was a will smith movie today, which one would you be?",
            style: Theme.of(
              context,
            ).textTheme.titleSmall?.copyWith(color: AnchorLogColor.textColor),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),

          SizedBox(height: 24.h),

          ListView.builder(
            itemCount: 4,
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (_, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 30.h),
                child: Row(
                  spacing: 13.w,
                  children: [
                    /// Other user's Avatar pictures
                    if (index != 3)
                      Image.asset(
                        AppImages.screenTopAvatar,
                        width: 40.w,
                        height: 40.h,
                        fit: BoxFit.cover,
                      ),

                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 12.h,
                        ),
                        decoration: BoxDecoration(
                          color:
                              index == 3
                                  ? Color(0xff9EBA72)
                                  : Color(0xffF8FAFB),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 10.h,
                          children: [
                            if (index != 3)
                              Text(
                                "Albert Flores",
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: index == 3 ? Colors.white : null,
                                ),
                              ),
                            Text(
                              "Are we using the correct font and chat bubble?",
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium?.copyWith(
                                color: index == 3 ? Colors.white : null,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    if (index == 3)
                      Image.asset(
                        AppImages.screenTopAvatar,
                        width: 40.w,
                        height: 40.h,
                        fit: BoxFit.cover,
                      ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
