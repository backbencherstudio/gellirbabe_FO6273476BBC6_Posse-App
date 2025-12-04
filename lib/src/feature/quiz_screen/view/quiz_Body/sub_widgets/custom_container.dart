// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBoxContainer extends StatelessWidget {
  final String text;
  void Function()? onTap;
  final Color bgColor;
  final Color textColor;
  final Color bdColor;
  CustomBoxContainer({
    super.key,
    required this.text,
    this.onTap,
    required this.bgColor,
    required this.textColor,
    required this.bdColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 103.w,
        height: 38.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: bgColor,
          border: Border.all(color: bdColor, width: 2),
        ),

        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              right: 16.r,
              top: 8.h,
              bottom: 8.h,
            ),
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: textColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
