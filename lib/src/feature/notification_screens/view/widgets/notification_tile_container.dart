import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:possy_app/core/constant/padding.dart';
import 'package:possy_app/src/common_widget_style/common_style/notification_style/notification_color.dart';
import 'package:possy_app/src/feature/notification_screens/model/notification_model.dart';

class NotificationTileContainer extends StatelessWidget {
  final List<NotificationModel> notificationList;

  const NotificationTileContainer({super.key, required this.notificationList});

  @override
  Widget build(BuildContext context) {
    final titleTextStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
      color: NotificationColor.notificationReadTextColor,
    );
    final subTitleTextStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
      color: NotificationColor.notificationSubtitleTextColor,
    );

    final DateTime notificationDate = notificationList[0].dateTime;
    late final String dateHeading;
    final DateTime today = DateTime.now();
    if (notificationDate.day == today.day &&
        notificationDate.month == today.month &&
        notificationDate.year == today.year) {
      dateHeading = "Today";
    } else {
      dateHeading = DateFormat('dd MMM, yyyy').format(notificationDate);
    }

    return Padding(
      padding: AppPadding.screenHorizontalPadding,
      child: Column(
        spacing: 8.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Date Heading
          Text(
            dateHeading,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: NotificationColor.notificationTimeHeadingTextColor,
            ),
          ),

          /// List of same date notification
          Container(
            width: 358.w,
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: notificationList.length,
              itemBuilder: (_, index) {
                final notification = notificationList[index];
                return Column(
                  spacing: 12.h,
                  children: [
                    if (index != 0)
                      Column(
                        children: [
                          SizedBox(height: 12.h),
                          Divider(color: NotificationColor.dividerColor),
                        ],
                      ),

                    Row(
                      spacing: 12.w,
                      children: [
                        SizedBox(
                          width: 40.w,
                          height: 40.h,
                          child: ClipOval(
                            child: Image.asset(
                              notification.profilePicture,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 2.h,
                            children: [
                              SelectableText(
                                notification.title,
                                style: titleTextStyle,
                                maxLines: 2,
                                // overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                DateFormat(
                                  'dd MMM, yyyy',
                                ).format(notification.dateTime),
                                style: subTitleTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),

          SizedBox(height: 18.h),
        ],
      ),
    );
  }
}
