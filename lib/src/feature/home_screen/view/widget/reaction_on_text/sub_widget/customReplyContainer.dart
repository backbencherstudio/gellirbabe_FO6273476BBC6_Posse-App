import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomReplyContainer extends StatelessWidget {
  final String text;
  void Function()? onTap;
  final bool isSelected;
  CustomReplyContainer({
    super.key,
    required this.text,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(bottom: 8.h),
        child: Container(
          width: 326.w,
          height: 45.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: isSelected ? Color(0xff9EBA72) : Color(0xFFFFFFFF),
          ),
          child: Center(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w600,
                color: isSelected ? Color(0xffffffff) : Color(0xff000000),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
