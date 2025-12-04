import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/src/common_widget_style/common_style/account_style/account_color.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_header.dart';
import 'package:possy_app/src/feature/streak_screen/view/widget/premium_Possy_tile.dart';
import 'package:possy_app/src/feature/streak_screen/view/widget/redemption_tile.dart';
import 'package:possy_app/src/feature/streak_screen/view/widget/streak_container.dart';

import '../../../../core/constant/padding.dart' show AppPadding;
import '../../../../core/theme/src/theme_extension/color_pallete.dart';
import '../../../common_widget_style/common_widgets/common_widgets.dart';
import 'widget/streak_redemption.dart';

class StreakScreen extends StatelessWidget {
  const StreakScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CommonHeader(
              backgroundColor: AccountColor.backgroundColor,
              backgroundContainerHeight: 120.h,
              child: CommonWidgets.customAppBar(
                context: context,
                title: "Streak",
                titleColor: AppColor.white,
                isBackButton: true,
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: AppPadding.screenHorizontalPadding,
              child: PremiumPossyTile(),
            ),
            SizedBox(height: 16.h),
            StreakContainer(),
            SizedBox(height: 16.h),
            RedemptionTile(),
          ],
        ),
      ),
    );
  }
}
