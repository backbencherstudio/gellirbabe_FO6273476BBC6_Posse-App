import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/src/feature/account_screen/model/posse_selection_model.dart';

import '../../../../../../../core/theme/src/theme_extension/color_pallete.dart';
import '../../../../../vibe_check_screen/widgets/avatar_stack.dart';

class PosseWidget extends StatelessWidget {
  const PosseWidget({
    super.key,
    required this.textTheme,
    required this.isSelected, required this.posse,
  });

  final TextTheme textTheme;
  final bool isSelected;
  final PosseSelectionModel posse;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 12.h),
      margin: EdgeInsets.symmetric(vertical: 5.h),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.all(Radius.circular(40.r)),
        border: Border.all(
          color: isSelected ? Color(0xffE8D7FF) : Colors.transparent,
          width: 2,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${posse.posseName}'s posse", style: textTheme.bodyLarge!.copyWith()),
              SizedBox(height: 10.h),
              AvatarStack(
                imageUrls: posse.peopleImage,
                maxDisplay: 4,
              ),
            ],
          ),
          Spacer(),
          isSelected
              ? Icon(
            Icons.check_circle,
            color: AppColor.primaryColor,
            size: 24.r,
          )
              : CircleAvatar(
            radius: 10.r,
            backgroundColor: AppColor.surfaceColor,
          ),
        ],
      ),
    );
  }
}