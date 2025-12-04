// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:possy_app/core/constant/icons.dart';
import 'package:possy_app/core/constant/padding.dart';
import 'package:possy_app/core/routes/route_name.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_header.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_widgets.dart';
import 'package:possy_app/src/feature/home_screen/Riverpod/ans_provider.dart';
import 'package:possy_app/src/feature/home_screen/view/widget/animated_container/animated_pie.dart';
import 'package:possy_app/src/feature/home_screen/view/widget/bottomSheets/sheet_two/draft_bottomSheet.dart';

import '../widget/inputDecoration/inputDecor.dart';

class CustomHeaderHome extends StatefulWidget {
  const CustomHeaderHome({super.key});

  @override
  State<CustomHeaderHome> createState() => _CustomHeaderHomeState();
}

class _CustomHeaderHomeState extends State<CustomHeaderHome> {
  late final FocusNode focusNode;
  late final TextEditingController sendTextController;

  @override
  void initState() {
    focusNode = FocusNode();
    sendTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    sendTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //chat section starts here !
    return SizedBox(
      width: double.infinity,
      //  height: 356.h,
      child: Stack(
        children: [
          Container(
            //  height: 356.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xff9EBA72),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16.r),
                bottomRight: Radius.circular(16.r),
              ),
            ),
            child: Padding(
              padding: AppPadding.screenHorizontalPadding,
              child: Consumer(
                builder: (context, ref, _) {
                  final answerNotifier = ref.read(answerListProvider.notifier);
                  final isAnswerSent = ref.watch(isAnswerSentProvider);

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(height: 160.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 8.w),
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      AppIcons.scrapIcon,
                                      height: 18,
                                      width: 18,
                                      color: Color(0xff1D1F2C),
                                    ),
                                   SizedBox(width: 4.w,),
                                    Text(
                                      "Anchor Question",
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: Color(0xff1D1F2C),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ],
                                ),
                                Text(
                                  "Which family photo brings back the best memories, and what’s the story behind it?",
                                  overflow: TextOverflow.visible,
                                  style: TextStyle(
                                    fontSize: 22.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                

                                ),
                              ],
                            ),
                          ),
                          // Spacer(),
                          CountdownCircle(
                            progressColor: Color(0xff5D7937),
                            backgroundColor: Color(0xffEDF3E2),
                            textColor: Color(0xff000000),
                          ),
                        ],
                      ),

                      ///-----------------working area---------------------------
                      SizedBox(height: 18.h),
                      if (!isAnswerSent)
                        TextFormField(
                          controller: sendTextController,
                          focusNode: focusNode,
                          onTapOutside: (_) {
                            focusNode.unfocus();
                          },
                          decoration: customInputDecoration(
                            hintText: "Write your answer",
                            prefixIcon: GestureDetector(
                              onTap: () {
                                showDraftSheet(context);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 5.w,
                                  top: 15.h,
                                  bottom: 15.h,
                                ),
                                child: SvgPicture.asset(
                                  AppIcons.boardIcon,
                                  height: 10.h,
                                  width: 10.w,
                                ),
                              ),
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                final sendMsg = sendTextController.text.trim();

                                if (sendMsg.isNotEmpty) {
                                  answerNotifier.addAnswer(
                                    "Myra",
                                    true,
                                    sendMsg,
                                  );
                                  sendTextController.clear();
                                  debugPrint("\n msg add hoiseeee \n");
                                  ref
                                      .watch(isAnswerSentProvider.notifier)
                                      .state = true;
                                }
                              },
                              child: Image.asset(
                                "assets/images/parent_screen/next2.png",
                                height: 24,
                                width: 24,
                              ),
                            ),
                          ),
                        ),
                      SizedBox(height: 20.h),
                    ],
                  );
                },
              ),
            ),
          ),

          /// App bar
          CommonHeader(
            backgroundColor: Color(0xffF4F8ED),
            backgroundContainerHeight: 150.h,
            headerDesign: HeaderDesign.home,
            child: CommonWidgets.customAppBar(
              titleColor: Color(0xff18062C),
              context: context,
              title: "Angie’s Posse",
              subtitleColor: Color(0xff4A4C56),
              actionWidgets: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.push(RouteName.streakScreen);
                    },
                    child: Container(
                      height: 40.h,
                      width: 58.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.r),
                        color: const Color(0xFFFFFFFF),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/parent_screen/fire.png",
                            height: 14.h,
                            width: 14.w,
                          ),
                          const Text(
                            "7w",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      context.push(RouteName.moodMosaicScreen);
                    },
                    child: Container(
                      height: 40.h,
                      width: 58.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.r),
                        color: const Color(0xFFFFFFFF),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SvgPicture.asset(
                          AppIcons.moodboard,
                          height: 14.h,
                          width: 14.w,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  CommonWidgets.notificationButton(context: context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
