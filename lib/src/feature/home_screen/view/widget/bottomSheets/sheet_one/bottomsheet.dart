// ignore_for_file: unused_local_variable
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/src/feature/home_screen/view/widget/animated_container/animated_progressBar.dart';
import 'package:possy_app/src/feature/home_screen/view/widget/buttons/custom_Button.dart';
import 'package:possy_app/src/feature/home_screen/view/widget/bottomSheets/sheet_two/draft_bottomSheet.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:possy_app/src/feature/home_screen/view/widget/bottomSheets/sheet_three/sit_this_one_bottomsheet.dart';
import 'package:possy_app/src/feature/home_screen/view/widget/sheet_header/custom_sheet_header.dart';

void showCustomSheet(BuildContext context) {
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
                        SizedBox(height: 28.h),
                        CustomSheetHeader(),
                        Image.asset("assets/images/parent_screen/q1.png"),

                        Text(
                          "If your relationship was kitchen appliance, what would it be?",
                          style: Theme.of(
                            context,
                          ).textTheme.headlineSmall!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Color(0xff1D1F2C),
                          ),
                        ),
                        SizedBox(height: 15.h),
                        CustomProgressContainer(responded: 7, total: 8),
                        SizedBox(height: 56.h),
                        CustomButton(
                          color: Color(0xff9EBA72),
                          text: "Answer Now",
                          textColor: Color(0xffffffff),
                          onTap: () {
                            Navigator.pop(context);

                            showDraftSheet(context);
                          },
                        ),
                        SizedBox(height: 16.h),
                        CustomButton(
                          color: Color(0xffffffff),
                          text: "Answer Later",
                          textColor: Color(0xff000000),
                          onTap: () {
                            Navigator.pop(context);
                            showSaveDraftCalenderSheet(context);
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
