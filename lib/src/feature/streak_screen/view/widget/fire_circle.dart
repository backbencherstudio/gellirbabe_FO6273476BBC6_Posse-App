import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:possy_app/core/constant/icons.dart';

class FireCircle extends StatelessWidget {
  final bool isLit;
  final String day;
  const FireCircle({super.key, required this.isLit, required this.day});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Column(
      children: [
        Container(
          height: 32.h,
          width: 32.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isLit ? Color(0xffFFCE51) : Color(0xffF9F9F9),
          ),

          child:
              isLit
                  ? Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SvgPicture.asset(AppIcons.fireIcon),
                  )
                  : Center(
                    child: Text(
                      "6",
                      style: textStyle.titleSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Color(0xff1D1F2C),
                      ),
                    ),
                  ),
        ),
        SizedBox(height: 4.h),
        Text(
          day,
          softWrap: true,
          style: textStyle.bodySmall!.copyWith(
            fontWeight: FontWeight.w400,
            color: Color(0xff959D99),
          ),
        ),
      ],
    );
  }
}
