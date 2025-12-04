import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:possy_app/core/constant/padding.dart';
import 'package:possy_app/core/routes/route_name.dart';
import 'package:possy_app/src/common_widget_style/common_style/mood_mosaic_style/mood_mosaic_color.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_widgets.dart';
import 'package:possy_app/src/feature/mood_mosaic_screen/riverpod/mood_mosaic_riverpod.dart';

class MoodMosaicScreen extends ConsumerStatefulWidget {
  const MoodMosaicScreen({super.key});

  @override
  ConsumerState<MoodMosaicScreen> createState() => _MoodMosaicScreenState();
}

class _MoodMosaicScreenState extends ConsumerState<MoodMosaicScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final moodMosaicNotifier = ref.read(moodMosaicRiverpod.notifier);
    final moodMosaicState = ref.watch(moodMosaicRiverpod);

    return Scaffold(
      backgroundColor: moodMosaicState.backgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
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
                        textTheme: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white)
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25.h),
                SizedBox(
                  height: 450.h,
                  child: PageView(
                    onPageChanged: (index) {
                      moodMosaicNotifier.onPageChange(index);
                    },
                    controller: _pageController,
                    children: moodMosaicNotifier.moodsWidgetList,
                  ),
                ),

                SizedBox(height: 14.h),

                /// Building Custom dots indicator
                SizedBox(
                  height: 57.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(6, (index) {
                      bool isSelected = index == moodMosaicState.currentPage;

                      return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                        width: isSelected ? 56.w : 16.w,
                        height: isSelected ? 56.w : 16.w,
                        decoration: BoxDecoration(
                          color: moodMosaicNotifier.moodsColor[index],
                          shape: BoxShape.circle,
                        ),
                      );
                    }),
                  ),
                ),

                SizedBox(height: 14.h),

                Padding(
                  padding: AppPadding.screenHorizontalPadding,
                  child: CommonWidgets.primaryButton(
                    context: context,
                    title: "Record mood",
                    color: MoodMosaicColor.buttonColor,
                    textColor: moodMosaicNotifier.handleScreenBackgroundColor(),
                    onPressed: () {
                      moodMosaicNotifier.onSelected();
                      context.push(RouteName.moodConfirmScreen);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
