import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_header.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_widgets.dart';
import 'package:possy_app/src/feature/quiz_screen/view/quiz_Body/quiz_tile/sub_widget/quiz_container.dart';
import 'package:possy_app/src/feature/quiz_screen/Riverpod/quiz_provider.dart';

class QuizTile extends StatelessWidget {
  final int index;
  const QuizTile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //header part bhai
          Consumer(
            builder: (context, ref, _) {
              final quizList = ref.watch(quizListProvider);

              return CommonHeader(
                backgroundColor: const Color(0xffF5A3D3),
                backgroundContainerHeight: 140.h,
                child: CommonWidgets.customAppBar(
                  isBackButton: true,
                  margin: EdgeInsets.all(0),
                  context: context,
                  title: quizList[index].title,
                  titleColor: Colors.white,
                  actionWidgets: Container(
                    margin: const EdgeInsets.only(right: 16),
                    child: CommonWidgets.notificationButton(context: context),
                  ),
                ),
              );
            },
          ),
          SizedBox(height:16.h,),
          Expanded(child: QuizContainer()),
        ],
      ),
    );
  }
}
