import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routes/route_name.dart';
import '../../../../../core/theme/src/theme_extension/color_pallete.dart';
import '../../../../common_widget_style/common_widgets/common_widgets.dart';
import '../../../../common_widget_style/common_widgets/spacer/auto_spacer.dart';
import '../../view_model/animation helper.dart';
import '../../view_model/welcome_provider.dart';
class NextSkipButton extends StatelessWidget {
  const NextSkipButton({
    super.key,
    required AnimationHelper animationHelper,
    required this.index,
    required this.ref,
  }) : _animationHelper = animationHelper;

  final AnimationHelper _animationHelper;
  final int index;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CommonWidgets.primaryButton(
                onPressed: () {
                  // Skip functionality
                  context.go(RouteName.onboardingScreen);
                },
                color: AppColor.surfaceColor,
                title: 'Skip',
                textColor: AppColor.bodyTextColor,
                context: context,
              ),
            ),
            AutoSpacer(space: 10),
            Expanded(
              child: CommonWidgets.primaryButton(
                onPressed: () {
                  // Animate the transition when pressing next
                  _animationHelper.startAnimation();

                  // Increase index or navigate
                  if (index < 2) {
                    ref
                        .read(welcomeScreenIndexProvider.notifier)
                        .state++;
                  } else {
                    context.go(RouteName.onboardingScreen);
                  }
                },
                color: AppColor.primaryColor,
                title: 'Next',
                textColor: AppColor.white,
                context: context,
              ),
            ),
          ],
        ),
        AutoSpacer(space: 20.h)
      ],
    );
  }
}