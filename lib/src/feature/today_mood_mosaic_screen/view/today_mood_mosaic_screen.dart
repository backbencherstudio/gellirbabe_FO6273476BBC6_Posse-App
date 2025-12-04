import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:possy_app/core/constant/padding.dart';
import 'package:possy_app/core/routes/route_name.dart';
import 'package:possy_app/src/common_widget_style/common_style/mood_mosaic_style/mood_mosaic_color.dart';
import 'package:possy_app/src/feature/today_mood_mosaic_screen/view/widgets/users_mood_container.dart';
import '../riverpod/today_mood_mosaic_riverpod.dart';

class TodayMoodMosaicScreen extends StatelessWidget {
  const TodayMoodMosaicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      body: Column(
        children: [
          /// Heading
          SafeArea(
            child: Padding(
              padding: AppPadding.screenHorizontalPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Today's Mood Mosaic",
                      style: textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.push(RouteName.parentsScreen);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xffA888FD),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Text(
                        "Done",
                        style: textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// Body
          Expanded(
            child: Padding(
              padding: AppPadding.screenHorizontalPadding,
              child: Consumer(
                builder: (_, ref, _) {
                  final todayMoodMosaicState = ref.watch(
                    todayMoodMosaicRiverpod,
                  );
                  return GridView.builder(
                    padding: EdgeInsets.only(bottom: 100.h, top: 24.h),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.w,
                      mainAxisSpacing: 8.h,
                    ),
                    itemCount: todayMoodMosaicState.usersMoodList!.length,
                    itemBuilder: (_, index) {
                      final userMood =
                          todayMoodMosaicState.usersMoodList![index];
                      return UserMoodShowContainer(usersMoodModel: userMood);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
