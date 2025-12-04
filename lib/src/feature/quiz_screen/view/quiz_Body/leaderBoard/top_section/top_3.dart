import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:possy_app/core/constant/icons.dart';
import 'package:possy_app/core/constant/images.dart';
import 'package:possy_app/src/feature/quiz_screen/view/quiz_Body/leaderBoard/top_section/subWidget/custom_title_position.dart';

class TopThree extends StatelessWidget {
  const TopThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //leaderboard
        Positioned(
          top: 150.h,
          left: 10.w,
          right: 10.w,
          child: SvgPicture.asset(AppImages.leaderBoard),
        ),
        CustomTitlePosition(
          text: "Andrew",
          solved: "6/8",
          img: AppIcons.pola,
          right: 20.w,
          left: 35.w,
          top: 50.h,
          bottom: 0.0,
          madelImg: AppIcons.secondPlaceIcon,
        ),
        CustomTitlePosition(
          text: "Pedro",
          solved: "7/8",
          img: AppIcons.ceo,
          right: 0.0,
          left: 145.0.w,
          top: 15.h,
          bottom: 0.0,
          madelImg: AppIcons.firstPlaceIcon,
        ),
        CustomTitlePosition(
          text: "Freida",
          solved: "5/8",
          img: AppIcons.maiya,
          right: 0.w,
          left: 255.w,
          top: 85.h,
          bottom: 0.0,
          madelImg: AppIcons.thirdPlaceIcon,
        ),
      ],
    );
  }
}
