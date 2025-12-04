// ignore_for_file: unused_local_variable
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:possy_app/core/constant/icons.dart';
import 'package:possy_app/src/feature/home_screen/Riverpod/ans_provider.dart';
import 'package:possy_app/src/feature/home_screen/view/widget/calenders/sheetCalender.dart';
import 'package:possy_app/src/feature/home_screen/view/widget/buttons/custom_Button.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

void showSaveDraftCalenderSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      TextEditingController sendtext = TextEditingController();
      return Padding(
        padding: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 20.h),
        child: SingleChildScrollView(
          reverse: true,
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),

          child: IntrinsicHeight(
            child: ClipPath(
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  color: Color(0xFFF4F8ED),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(32),
                    bottom: Radius.circular(32),
                  ),
                ),
                child: Consumer(
                  builder: (context, ref, _) {
                    final msg = ref.read(answerListProvider.notifier);
                    final msgg = ref.watch(answerListProvider);
                    final isAnsSent = ref.watch(isAnswerSentProvider);
                    return Column(
                      children: [
                        Center(
                          child: Container(
                            height: 5.w,
                            width: 40.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: const Color(0xff171717),
                            ),
                          ),
                        ),

                        SizedBox(height: 18.h),
                        Image.asset(
                          "assets/images/parent_screen/bb.png",
                          height: 68.88.h,
                          width: 342.w,
                        ),
                        Text(
                          "Sit This One Out",
                          style: Theme.of(context).textTheme.headlineSmall!
                              .copyWith(color: Color(0xff1D1F2C)),
                        ),
                        SizedBox(height: 15.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppIcons.stopIcon),
                            SizedBox(width: 8.w),
                            Text(
                              "Try not to skip twice in a row.",
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(color: Color(0xff1D1F2C)),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.h),
                        Expanded(
                          child: SizedBox(
                            height: 460.h,
                            child: HighlightedCalendar(),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        CustomButton(
                          color: Color(0xffffffff),
                          text: "Close ",
                          textColor: Color(0xff000000),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),

                        SizedBox(height: 28.h),
                        Center(
                          child: Container(
                            height: 5.w,
                            width: 140.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: const Color(0xff171717),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
