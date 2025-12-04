import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:possy_app/core/constant/icons.dart';
import 'package:possy_app/core/routes/route_name.dart';
import 'package:possy_app/src/feature/quiz_screen/view/quiz_Body/sub_widgets/guess_button.dart';

void showGuessBottomSheet(BuildContext context) {
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
                    SizedBox(height: 5.h),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 500.h,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    left: 8.w,
                                    right: 8.w,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            AppIcons.ceo,
                                            height: 48.h,
                                            width: 48.w,
                                          ),
                                          SizedBox(width: 15.w),
                                          Text(
                                            "Wednesday Adams",
                                            style: Theme.of(
                                              context,
                                            ).textTheme.titleMedium!.copyWith(
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xff212121),
                                            ),
                                          ),
                                          Spacer(),
                                          GuessButton(
                                            onTap: () {
                                              context.push(
                                                "${RouteName.quiztile}/$index",
                                              );
                                            },
                                          ),
                                          SizedBox(width: 2.w),
                                        ],
                                      ),
                                      SizedBox(height: 12.h),
                                      Divider(
                                        thickness: 1,
                                        color: Color(0xffE9E9EA),
                                        indent: 12,
                                        endIndent: 12,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
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
