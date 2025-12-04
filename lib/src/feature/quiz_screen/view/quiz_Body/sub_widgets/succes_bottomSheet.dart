import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/core/constant/images.dart';
import 'package:possy_app/src/feature/home_screen/view/widget/buttons/custom_Button.dart';

void showSuccessBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
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
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(32),
                    bottom: Radius.circular(32),
                  ),
                ),

                child: Column(
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
                    SizedBox(height: 24.h),
                    Image.asset(AppImages.successfullyResetPassword),
                    SizedBox(height: 16.h),

                    Text(
                      "You Are Done!",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Color(0xff131313),
                      ),
                    ),
                    SizedBox(height: 16.h),

                    Text(
                      "Waiting for 3 of 6 players to finish.",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Color(0xff9CA4AB),
                      ),
                    ),
                    SizedBox(height: 16.h),

                    Image.asset("assets/images/quizscreen/peep.png"),
                    SizedBox(height: 16.h),

                    CustomButton(
                      color: Color(0xffA888FD),
                      text: "Go Back",
                      textColor: Color(0xffffffff),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(height: 16.h),
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
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
