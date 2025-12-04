import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:possy_app/core/constant/icons.dart';
import 'package:possy_app/src/feature/home_screen/view/widget/animated_container/animated_pie.dart';

class CustomSheetHeader extends StatelessWidget {
  const CustomSheetHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64.h,
      width: 326.w,
      child: Row(
        children: [
          SvgPicture.asset(AppIcons.left),
          SizedBox(width: 22.w),
          CountdownCircle(progressColor: Color(0xffB2CA8C), backgroundColor: Color(0xffEDF3E2), textColor: Color(0xff5D7937),),
          Spacer(),
          SvgPicture.asset(AppIcons.right),
          SizedBox(width: 2.w),
        ],
      ),
    );
  }
}
