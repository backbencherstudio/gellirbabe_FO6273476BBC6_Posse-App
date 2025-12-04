import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/core/theme/src/theme_extension/color_pallete.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/spacer/auto_spacer.dart';
import '../../../../core/constant/images.dart';
import '../view_model/animation helper.dart';
import '../view_model/welcome_provider.dart';
import 'widgets/welcome_bottom_sheet.dart';

class WelcomeScreen extends ConsumerStatefulWidget {
  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends ConsumerState<WelcomeScreen>
    with TickerProviderStateMixin {
  late AnimationHelper _animationHelper;

  @override
  void initState() {
    super.initState();
    _animationHelper = AnimationHelper();
    _animationHelper.initAnimation(this);
    _animationHelper.startAnimation();
  }

  @override
  void dispose() {
    _animationHelper.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final index = ref.watch(welcomeScreenIndexProvider);
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppImages.screenBackgroundImage,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppImages.logo, height: 140.h, width: 140.w),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                child: SlideTransition(
                  position: _animationHelper.titleOffset,
                  child: Text(
                    titles[index],
                    style: textTheme.headlineLarge!.copyWith(
                      color: AppColor.white,
                      fontSize: 32.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              AutoSpacer(space: 150.h),

              // Dynamic description
              WelcomeBottomSheet(
                index: index,
                animationHelper: _animationHelper,
                ref: ref,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
