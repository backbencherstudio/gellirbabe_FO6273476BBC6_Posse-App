import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTitlePosition extends StatelessWidget {
  final String text;
  final String solved;
  final String img;
  final double left;
  final double right;
  final double top;
  final double bottom;
  final String madelImg;

  const CustomTitlePosition({
    super.key,
    required this.text,
    required this.solved,
    required this.img,
    required this.right,
    required this.left,
    required this.top,
    required this.bottom,
    required this.madelImg,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: Stack(
        children: [
          Column(
            children: [
              Image.asset(img, height: 72.h, width: 72.w),

              SizedBox(height: 4.h),
              Text(
                text,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff1D1F2C),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                solved,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff6949FF),
                ),
              ),
            ],
          ),
          Positioned(
            top: 55.h,
            left: 23.w,
            child: SvgPicture.asset(madelImg, height: 29.h, width: 29.w),
          ),
        ],
      ),
    );
  }
}
