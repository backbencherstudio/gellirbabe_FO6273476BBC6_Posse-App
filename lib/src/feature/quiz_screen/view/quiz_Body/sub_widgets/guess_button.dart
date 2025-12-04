import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class GuessButton extends StatelessWidget {
  void Function()? onTap;
  GuessButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Color(0xffA888FD),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
              left: 10.w,
              right: 10.w,
              top: 6.h,
              bottom: 6.h,
            ),
            child: Text(
              "Guess",
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                fontWeight: FontWeight.w500,
                color: Color(0xffffffff),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
