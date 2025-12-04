import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:possy_app/core/constant/padding.dart';
import 'package:possy_app/core/routes/route_name.dart';
import 'package:possy_app/core/utils/utils.dart';
import 'package:possy_app/src/common_widget_style/common_style/anchor_log_style/anchor_log_color.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_widgets.dart';
import 'package:possy_app/src/feature/anchor_log_screens/view/widgets/anchor_log_body.dart';
import 'package:possy_app/src/feature/anchor_log_screens/view/widgets/anchor_log_common_container.dart';
import 'package:possy_app/src/feature/anchor_log_screens/view/widgets/anchor_log_divider.dart';
import 'package:possy_app/src/feature/anchor_log_screens/view/widgets/anchor_log_header.dart';
import 'package:possy_app/src/feature/anchor_log_screens/view/widgets/anchor_log_streak_show.dart';
import 'package:possy_app/src/feature/anchor_log_screens/view/widgets/subscribe_now_card.dart';

import '../../streak_screen/view/widget/premium_Possy_tile.dart';

class AnchorLogScreen extends StatelessWidget {
  const AnchorLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AnchorLogColor.screenBackgroundColor,
      body: Stack(
        children: [
          /// Main body
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /// App Bar
              AnchorLogHeader(
                titleText: "Angie's Posse",
              ),

              SizedBox(height: 10.h),

              Padding(
                padding: AppPadding.screenHorizontalPadding,
                child: Row(
                  spacing: 5.w,
                  children: [
                    SvgPicture.asset(
                      'assets/images/anchor_log/anchor_journal.svg',
                      width: 20.w,
                      height: 20.h,
                    ),
                    Text(
                      "Anchor Journal",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AnchorLogColor.appBarBackgroundColor,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),

                      /// Premium Posse tile
                      Padding(
                        padding: AppPadding.screenHorizontalPadding,
                        child: SubscribeNowCard(),

                        ///PremiumPossyTile(),
                      ),

                      SizedBox(height: 16.h),

                      /// Streak Show
                      StreakShow(),

                      /// Anchor log list view
                      AnchorLogBody(),

                      SizedBox(height: 150.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
