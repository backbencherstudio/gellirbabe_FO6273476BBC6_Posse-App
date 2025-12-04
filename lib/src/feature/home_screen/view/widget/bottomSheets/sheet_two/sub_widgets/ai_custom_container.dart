import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class AiCustomContainer extends StatelessWidget {
  final String text;
  void Function()? onTap;
  final Color bgColor;
  final Color textColor;
  AiCustomContainer({
    super.key,
    required this.text,
    required this.onTap,
    required this.bgColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 103.w,
        height: 38.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.r),
          color: bgColor,
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              right: 16.r,
              top: 10.h,
              bottom: 10.h,
            ),
            child: Text(
              text,
              style: Theme.of(
                context,
              ).textTheme.bodySmall!.copyWith(color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}
