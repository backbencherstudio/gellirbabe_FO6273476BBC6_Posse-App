import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:possy_app/core/constant/icons.dart';
import 'package:possy_app/src/common_widget_style/common_style/anchor_log_style/anchor_log_color.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_widgets.dart';
import 'anchor_log_common_container.dart';

class StreakShow extends StatefulWidget {
  const StreakShow({super.key, this.isDayStreakShow = false});

  final bool isDayStreakShow;

  @override
  State<StreakShow> createState() => _StreakShowState();
}

class _StreakShowState extends State<StreakShow> {
  late final ScrollController _streakScrollController;

  @override
  void initState() {
    _streakScrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _streakScrollController.jumpTo(
        _streakScrollController.position.maxScrollExtent,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _streakScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnchorLogCommonContainer(
      // height: 102.h,
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Column(
        children: [
          /// week streak horizontal list
          SizedBox(
            height: 80.h,
            child: ListView.builder(
              controller: _streakScrollController,
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              itemBuilder: (_, index) {
                return Padding(
                  padding: EdgeInsets.all(8.r),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 8.h,
                    children: [
                      CommonWidgets.circleButton(
                        backgroundColor:
                            index > 7
                                ? AnchorLogColor.streakDeActiveBackgroundColor
                                : AnchorLogColor.streakActiveBackgroundColor,
                        color:
                            index > 7
                                ? AnchorLogColor.streakDeActiveForegroundColor
                                : null,
                        padding: EdgeInsets.all(8.r),
                        imgPath: AppIcons.fireIcon,
                        onTap: () {},
                      ),

                      Text(
                        "June ${index + 1}",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color:
                              index > 3
                                  ? AnchorLogColor.streakDeActiveForegroundColor
                                  : AnchorLogColor.labelTextColor,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          if (widget.isDayStreakShow)
            Column(
              children: [
                SizedBox(height: 24.h),
                SvgPicture.asset(AppIcons.fireIcon, width: 53.w, height: 72.h),
                SizedBox(height: 12.h),
                Text(
                  "7 Day Streak!",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
