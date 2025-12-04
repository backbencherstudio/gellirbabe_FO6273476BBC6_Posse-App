import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class Mybutton extends StatelessWidget {
  final Color color;
  final String text;
  final Color? textColor;
  void Function()? onTap;
  final double? width;

  Mybutton({
    super.key,
    required this.color,
    required this.text,
    required this.onTap,
    this.textColor,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width:width?? 173.w,
        height: 48.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(99),
          color: color,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500 ,color: textColor?? Color(0xff000000),)
          ),
        ),
      ),
    );
  }
}
