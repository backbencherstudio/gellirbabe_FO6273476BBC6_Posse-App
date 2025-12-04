import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/src/theme_extension/color_pallete.dart';
import '../../view_model/animation helper.dart';
import '../../view_model/welcome_provider.dart';
import 'describe_widget.dart';
import 'next_skip_button.dart';
class WelcomeBottomSheet extends StatelessWidget {
  const WelcomeBottomSheet({
    super.key,
    required this.index,
    required AnimationHelper animationHelper,
    required this.ref,
  }) : _animationHelper = animationHelper;

  final int index;
  final AnimationHelper _animationHelper;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 390.h,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DescribeWidget(
              index: index,
              descriptionOffset: _animationHelper.descriptionOffset,
              question: question,
              descriptions: descriptions,
            ),

            // Navigation buttons
            NextSkipButton(
              animationHelper: _animationHelper,
              index: index,
              ref: ref,
            ),
          ],
        ),
      ),
    );
  }
}