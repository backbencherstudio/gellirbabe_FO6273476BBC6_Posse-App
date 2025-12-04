import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/theme/src/theme_extension/color_pallete.dart';
class PosseOptionWidget extends StatelessWidget {
  const PosseOptionWidget({
    super.key,
    required this.isSelected,
    required this.category,
  });

  final bool isSelected;
  final String category;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.only(bottom: 2.h), // spacing between rows
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: isSelected ? AppColor.primaryColor : Colors.transparent,
        border: Border.all(color: AppColor.primaryColor, width: 2),
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: Text(
        category,
        style: textTheme.bodyMedium!.copyWith(
          color: isSelected ? Colors.white : AppColor.primaryColor,
          fontSize: 12.sp,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

