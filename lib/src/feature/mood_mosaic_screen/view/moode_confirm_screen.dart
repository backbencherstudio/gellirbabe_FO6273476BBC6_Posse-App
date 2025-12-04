import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:possy_app/core/constant/padding.dart';
import 'package:possy_app/core/routes/route_name.dart';
import 'package:possy_app/src/common_widget_style/common_style/mood_mosaic_style/mood_mosaic_color.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_widgets.dart';
import 'package:possy_app/src/feature/mood_mosaic_screen/view/widgets/mood_mosaic_container.dart';

import '../riverpod/mood_mosaic_riverpod.dart';

class MoodConfirmScreen extends StatelessWidget {
  const MoodConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, _) {
        final moodState = ref.watch(moodMosaicRiverpod);
        final moodNotifier = ref.read(moodMosaicRiverpod.notifier);
        return Scaffold(
          backgroundColor: moodNotifier.handleScreenBackgroundColor(),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: AppPadding.screenHorizontalPadding,
                  child: SizedBox(
                    width: 60.w,
                    height: 30.h,
                    child: CommonWidgets.primaryButton(
                      context: context,
                      title: "Skip",
                      color: Color(0xffA888FD),
                      textColor: Colors.white,
                      onPressed: () {
                        context.go(RouteName.parentsScreen);
                      },
                      textTheme: Theme.of(
                        context,
                      ).textTheme.labelLarge?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25.h),

              MoodMosaicContainer(
                moodName: ref.read(moodMosaicRiverpod.notifier).getMoodName(),
                moodColor:
                    ref.read(moodMosaicRiverpod.notifier).handleMoodColor(),
                textColor:
                    ref.read(moodMosaicRiverpod.notifier).handleTextColor(),
                gifPath: ref.read(moodMosaicRiverpod.notifier).gifPath(),
              ),
              SizedBox(height: 38.h),
              Padding(
                padding: AppPadding.screenHorizontalPadding,
                child: CommonWidgets.primaryButton(
                  context: context,
                  title: "Confirm Mood as ${moodNotifier.getMoodName()}",
                  color: moodNotifier.handleMoodColor(),
                  textColor: MoodMosaicColor.buttonColor,
                  onPressed: () {
                    moodNotifier.onSelected();
                    context.go(RouteName.todayMoodMosaicScreen);
                  },
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: AppPadding.screenHorizontalPadding,
                child: CommonWidgets.primaryButton(
                  context: context,
                  title: "Go Back",
                  color: Colors.white,
                  textColor: MoodMosaicColor.buttonColor,
                  onPressed: () {
                    context.pop();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
