import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/src/common_widget_style/common_style/anchor_log_style/anchor_log_color.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_widgets.dart';

class SubscribeNowCard extends StatelessWidget {
  const SubscribeNowCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        spacing: 15.h,
        children: [
          Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("MyPosse",style: Theme.of(context).textTheme.titleMedium,),

              GestureDetector(
                onTap: () {},
                child: Container(
               //   width: 129.w,
                 // height: 29.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 5.h,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xff1D1F2C),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Text(
                    "Subscribe Now",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          Text(
            "Unlock voice, photo, and video replies to Anchor Questions, more Guess-Me quizzes, unlimited streak freezes, and more for all your posses with MyPosse Premium.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
