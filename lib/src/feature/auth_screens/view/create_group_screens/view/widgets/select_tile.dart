// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/core/theme/src/theme_extension/color_pallete.dart';

class SelectTile extends StatelessWidget {
  final String text;
  final bool isSelected;
  SelectTile({super.key, required this.text, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 33.h,
      // width: 74.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(80.r),
        color: isSelected ? AppColor.primaryColor : Color(0xffFfffff),
        border: Border.all(width: 2.w, color: AppColor.primaryColor),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          top: 8.h,
          bottom: 8.h,
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            color: isSelected ? Color(0xffffffff) : AppColor.primaryColor,
          ),
        ),
      ),
    );
  }
}
