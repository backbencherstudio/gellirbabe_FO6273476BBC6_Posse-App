import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:possy_app/core/constant/imojis.dart';
import 'package:possy_app/src/common_widget_style/common_style/notification_style/notification_color.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_header.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_widgets.dart';
import 'package:possy_app/src/feature/notification_screens/model/notification_model.dart';
import 'package:possy_app/src/feature/notification_screens/riverpod/notification_riverpod.dart';
import 'package:possy_app/src/feature/notification_screens/view/widgets/notification_tile_container.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CommonHeader(
            backgroundContainerHeight: 130.h,
            backgroundColor: NotificationColor.appBarColor,
            child: CommonWidgets.customAppBar(
              context: context,
              title: "Notifications",
              titleColor: Colors.white,
              isBackButton: true,
            ),
          ),

          Expanded(
            child: Consumer(
              builder: (_, ref, _) {
                final notificationState = ref.watch(notificationRiverpod);
                final notificationList = notificationState.notificationList;
                return notificationList == null
                    ? Center(
                      child: CircularProgressIndicator(
                        color: NotificationColor.appBarColor,
                      ),
                    )
                    : notificationList.isEmpty
                    ? Column(
                      spacing: 10.h,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppImoji.sad),

                        Text(
                          "No notifications yet",
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(color: Color(0xff4A4C56)),
                        ),
                      ],
                    )
                    : ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      itemCount: notificationList.length,
                      itemBuilder: (_, index) {
                        final List<NotificationModel> notificationSubList =
                            notificationList[index];
                        return NotificationTileContainer(
                          notificationList: notificationSubList,
                        );
                      },
                    );
              },
            ),
          ),
        ],
      ),
    );
  }
}
