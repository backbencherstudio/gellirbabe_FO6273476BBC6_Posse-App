import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/src/common_widget_style/common_style/account_style/account_color.dart';

import '../../../../../core/constant/padding.dart';
import '../../../../../core/theme/src/theme_extension/color_pallete.dart';
import '../../../../common_widget_style/common_widgets/common_header.dart';

class AccountHeader extends StatelessWidget {
  const AccountHeader({super.key, required this.textTheme});

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return CommonHeader(
      backgroundColor: AccountColor.backgroundColor,
      backgroundContainerHeight: 155.h,
      child: Column(
        children: [
          Padding(
            padding: AppPadding.screenHorizontalPadding,
            child: Row(
              spacing: 12.w,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 56.w,
                  width: 56.w,
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://randomuser.me/api/portraits/men/9.jpg',
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Brooklyn Simmons",
                      style: textTheme.titleMedium!.copyWith(
                        color: AppColor.white,
                      ),
                    ),
                    Text(
                      "Angie’s posse",
                      style: textTheme.bodyLarge!.copyWith(
                        color: AppColor.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
