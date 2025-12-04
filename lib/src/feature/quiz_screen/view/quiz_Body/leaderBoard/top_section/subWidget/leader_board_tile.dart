import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/core/constant/icons.dart';

class LeaderBoardTile extends StatelessWidget {
  const LeaderBoardTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(left: 12.w, right: 12.w),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: Color(0xffFAFAFA),
            ),
            width: 326.w,
            height: 105.h,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "${index + 4}",
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Color(0xff212121),
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Image.asset(AppIcons.ceo, height: 48.h, width: 48.w),
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
            ),
          ),
        );
      },
    );
  }
}
