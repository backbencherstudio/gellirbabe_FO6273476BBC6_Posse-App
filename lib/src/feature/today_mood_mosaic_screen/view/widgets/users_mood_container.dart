import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/src/feature/today_mood_mosaic_screen/model/user_mood_model.dart';

class UserMoodShowContainer extends StatelessWidget {
  final UsersMoodModel usersMoodModel;

  const UserMoodShowContainer({super.key, required this.usersMoodModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: usersMoodModel.moodBackgroundColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 16.h,
        children: [
          Image.asset(usersMoodModel.avatarPath!, width: 60.w, height: 60.h),

          Text(
            "${usersMoodModel.userName} feels ${usersMoodModel.mood}",
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w800),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
