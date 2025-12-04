import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/src/feature/home_screen/view/widget/buttons/button.dart';
import 'package:possy_app/src/feature/quiz_screen/view/quiz_Body/quiz_tile/sub_widget/ans_tile.dart';
import 'package:possy_app/src/feature/quiz_screen/Riverpod/quiz_provider.dart';


class QuizContainer extends ConsumerWidget {
  const QuizContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeCall = Theme.of(context).textTheme;
    final selectedIndex = ref.watch(isSelectedProvider);

    final answers = [
      "Lounging on the beach with a cold drink",
      "Exploring local markets and tasting new foods",
      "Hiking scenic trails and taking nature photos",
      "Relaxing at a spa or wellness retreat",
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: 358.w,
            height: 565.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "When you’re on a family getaway, which of these are you most likely to be doing?",
                    style: themeCall.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Color(0xff1D1F2C),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  // Row(
                  //   children: [
                  //     SvgPicture.asset(AppIcons.clock),
                  //     SizedBox(width: 8.w),
                  //     Text(
                  //       "Ends in 2 hrs",
                  //       style: themeCall.bodySmall!.copyWith(
                  //         fontWeight: FontWeight.w600,
                  //         color: Color(0xff1A9882),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(height: 24.h),
                  ...List.generate(answers.length, (index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: AnsTile(
                        text: answers[index],
                        isSelected: selectedIndex == index,
                        onTap: () {
                          ref.read(isSelectedProvider.notifier).state = index;
                        },
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            "1/6 Questions",
            style: Theme.of(
              context,
            ).textTheme.bodySmall!.copyWith(color: Color(0xff777980)),
          ),
          SizedBox(height: 20.h),
          Mybutton(
            color: Color(0xffF075BD),
            width: 353.w,
            text: "next",
            textColor: Color(0xffffffff),
            onTap: () {},
          ),
          SizedBox(height: 200.h,)
        ],
      ),
    );
  }
}
