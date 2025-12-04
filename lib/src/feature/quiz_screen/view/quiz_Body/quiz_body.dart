import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:possy_app/core/constant/icons.dart';
import 'package:possy_app/core/constant/padding.dart';
import 'package:possy_app/src/feature/quiz_screen/view/quiz_Body/sub_widgets/gridview.dart';

class QuizBody extends StatelessWidget {
  const QuizBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.screenHorizontalPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          Row(
            children: [
              SvgPicture.asset(AppIcons.q),
              SizedBox(width: 4.w),
              Text(
                "Guess-Me",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Color(0xffFF77C7),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Expanded(child: GridviewTile(iShowPeeps: false)),
        ],
      ),
    );
  }
}
