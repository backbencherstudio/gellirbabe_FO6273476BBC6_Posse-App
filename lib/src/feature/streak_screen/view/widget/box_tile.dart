import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BoxTile extends StatelessWidget {
  final Color color;
  final String title;
  final String discription;
  final String img;
  const BoxTile({
    super.key,
    required this.color,
    required this.img,
    required this.title,
    required this.discription,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 117.h,
      width: 155.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(img),
          SizedBox(height: 12.h),
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Color(0xff212121),
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            discription,
            style: Theme.of(
              context,
            ).textTheme.labelSmall!.copyWith(fontSize: 10.sp),
          ),
        ],
      ),
    );
  }
}
