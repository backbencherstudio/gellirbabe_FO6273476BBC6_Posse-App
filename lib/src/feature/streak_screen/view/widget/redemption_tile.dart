import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/core/constant/icons.dart';
import 'package:possy_app/core/constant/padding.dart';
import 'package:possy_app/core/theme/src/theme_extension/color_pallete.dart';
import 'package:possy_app/src/feature/streak_screen/view/widget/box_tile.dart';
import 'package:possy_app/src/feature/streak_screen/view/widget/streak_redemption.dart';

class RedemptionTile extends StatelessWidget {
  const RedemptionTile({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: AppPadding.screenHorizontalPadding,
      child: Container(
        height: 262.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: const Color(0xffffffff),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Possy",
                style: textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Color(0xff1D1F2C),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "Missed a day? Use a redemption to keep your streak alive!",
                style: textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Color(0xff777980),
                ),
              ),
              SizedBox(height: 24.h),

              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 20.h,
                            ),
                            child: SingleChildScrollView(
                              reverse: true,
                              padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom,
                              ),
                              child: IntrinsicHeight(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(32),
                                  child: Container(
                                    padding: const EdgeInsets.all(24),
                                    decoration: const BoxDecoration(
                                      color: AppColor.white,
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(32),
                                        bottom: Radius.circular(32),
                                      ),
                                    ),
                                    child: Text("jkefh"),

                                    //  StreakRedemption(),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: BoxTile(
                      color: Color(0xffF5F3FF),
                      img: AppIcons.thunder,
                      title: "Free Redemption",
                      discription: "3 remaining",
                    ),
                  ),
                  SizedBox(width: 16.w),
                  BoxTile(
                    color: Color(0xffFAFAFA),
                    img: AppIcons.orangeCrown,
                    title: "Premium Redemption",
                    discription: "Unlimited",
                  ),
                ],
              ),

              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
