import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/core/constant/padding.dart';
import 'package:possy_app/src/feature/home_screen/view/widget/buttons/button.dart';
import 'package:possy_app/src/feature/quiz_screen/Riverpod/one_lieftime_lockIn.dart';

void showLockInSheet(BuildContext context) {
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
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(32),
                    bottom: Radius.circular(32),
                  ),
                ),
                child: Padding(
                  padding: AppPadding.screenHorizontalPadding,
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
                      Text(
                        "Let’s Play Guess-Me",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Color(0xff131313),
                        ),
                      ),
                      SizedBox(height: 24.h),

                      Text(
                        "1. First, answer the quiz from your point of view.",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Color(0xff9CA4AB),
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(height: 8.h),

                      Text(
                        "2. Then, let your posse guess your answers and see who knows you best!",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Color(0xff9CA4AB),
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(height: 8.h),

                      Text(
                        "3. Don’t forget—you get to guess their answers too!",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Color(0xff9CA4AB),
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(height: 16.h),

                      Row(
                        children: [
                          Expanded(
                            child: Mybutton(
                              color: const Color(0xffECEFF3),
                              text: "Back",

                              onTap: () => Navigator.pop(context),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: Consumer(
                              builder: (context,ref,_) {
                                final isLocked = ref.watch(isLockedIn);
                                return Mybutton(
                                  color: const Color(0xffF075BD),
                                  text: "Lock In",
                                  textColor: Color(0xffffffff),
                                  onTap: () {
                                    ref.read(isLockedIn.notifier).state = false;
                                    debugPrint("\\n\n\n\n\n\ $isLocked \n\\n\n\n");
                                    Navigator.pop(context);
                                  },
                                );
                              }
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h,)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
