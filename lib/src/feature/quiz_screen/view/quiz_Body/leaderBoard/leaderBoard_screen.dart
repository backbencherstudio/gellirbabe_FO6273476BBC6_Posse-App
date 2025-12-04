import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/src/feature/quiz_screen/view/quiz_Body/leaderBoard/top_section/subWidget/leader_board_tile.dart';
import 'package:possy_app/src/feature/quiz_screen/view/quiz_Body/leaderBoard/top_section/top_3.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32.r),
              color: Color(0xffffffff),
            ),
            child: Column(
              children: [
                SizedBox(height: 360.h, child: Stack(children: [TopThree()])),
                LeaderBoardTile(),

                SizedBox(height: 20.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
