import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:m_calendar/m_calendar.dart';
import 'package:m_calendar/model/marked_date_model.dart';

import '../../../../../core/constant/icons.dart';
import '../../../../../core/theme/src/theme_extension/color_pallete.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../common_widget_style/common_widgets/spacer/auto_spacer.dart';
import '../../../../common_widget_style/streak_style/streak_colors.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: AppColor.surfaceColor,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            spreadRadius: 2,
            blurRadius: 20,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.arrow_back_ios),
              Text(
                Utils.formatDate(
                  dateTime: DateTime.now(),
                  formatType: 'MMM yyyy',
                ),
                style: textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
          AutoSpacer(space: 10.h),
          SizedBox(
            width: double.infinity,
            //height: 400,
            child: MCalendar(
              isRangeSelection: true,
              selectedMonth: DateTime(2025, 5, 21),
              defaultChild: SizedBox(height: 15.h, width: 15.w),
              decoration: BoxDecoration(
                color: StreakColors.cellDefaultColor,
                borderRadius: BorderRadius.circular(100),
                //shape: BoxShape.circle
              ),
              userPickedDecoration: BoxDecoration(
                color: StreakColors.userPickedColor,
                borderRadius: BorderRadius.circular(100),
                //shape: BoxShape.circle
              ),
              weekNameHeaderStyle: const TextStyle(
                fontSize: 20,
                color: Colors.black54,
              ),
              cellPadding: EdgeInsets.all(12),
              userPickedChild: Container(
                margin: EdgeInsets.all(3),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: StreakColors.userPickedColor,
                ),
                child: SvgPicture.asset(
                  AppIcons.fireIndicatorCalendar,
                  height: 25,
                  width: 25,
                ),
              ),
              markedDaysList: [
                MarkedDaysModel(
                  selectedDateList: [
                    DateTime(2025, 5, 17),
                    DateTime(2025, 5, 20),
                    DateTime(2025, 5, 10),
                    DateTime(2025, 5, 12),
                  ],
                  decoration: BoxDecoration(
                    color: StreakColors.userPickedColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
              onUserPicked: (value) {
                debugPrint(value.toString());
              },
            ),
          ),
        ],
      ),
    );
  }
}
