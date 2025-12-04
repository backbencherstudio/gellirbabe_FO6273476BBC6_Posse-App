import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/core/constant/padding.dart';
import 'package:possy_app/src/common_widget_style/common_style/anchor_log_style/anchor_log_color.dart';

class AnchorLogDivider extends StatelessWidget {
  final String dividerText;
  const AnchorLogDivider({super.key, required this.dividerText});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: AppPadding.screenHorizontalPadding,
          child: Divider(thickness: 1, color: AnchorLogColor.dividerColor),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            decoration: BoxDecoration(
              color: AnchorLogColor.dividerColor,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              dividerText,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AnchorLogColor.onSurfaceTextColor,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
