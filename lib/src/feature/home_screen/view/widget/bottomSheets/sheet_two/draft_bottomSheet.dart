// ignore_for_file: unnecessary_import
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/src/feature/home_screen/Riverpod/ans_provider.dart';
import 'package:possy_app/src/feature/home_screen/view/widget/bottomSheets/sheet_two/sub_widgets/custom_selection.dart';
import 'package:possy_app/src/feature/home_screen/view/widget/buttons/button.dart';
import 'package:possy_app/src/feature/home_screen/view/widget/inputDecoration/inputDecor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:possy_app/src/feature/home_screen/view/widget/sheet_header/custom_sheet_header.dart';
import 'package:possy_app/src/feature/parents_screens/riverpod_model/sheetCheck_provider.dart';

void showDraftSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      TextEditingController sendtext = TextEditingController();
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
                  color: Color(0xFFF4F8ED),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(32),
                    bottom: Radius.circular(32),
                  ),
                ),
                child: Consumer(
                  builder: (context, ref, _) {
                    final msg = ref.read(answerListProvider.notifier);
                    ref.watch(answerListProvider);
                    ref.watch(isAnswerSentProvider);
                    final isChecked = ref.watch(isCheckedProvider);

                    return Column(
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
                        SizedBox(height: 18.h),
                        CustomSheetHeader(),
                        Image.asset("assets/images/parent_screen/q1.png"),
                        SizedBox(height: 10.h),
                        Text(
                          "If your relationship was kitchen appliance, what would it be?",
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff1D1F2C),
                          ),
                        ),

                        SizedBox(height: 56.h),

                        SizedBox(
                          width: 326.w,
                          height: 127.h,
                          child: TextFormField(
                            controller: sendtext,
                            expands: false,
                            maxLines: 5,
                            minLines: 3,

                            textAlignVertical: TextAlignVertical.top,
                            decoration: customInputDecoration(
                              hintText: "Write your answer",
                            ),
                          ),
                        ),
                        if (isChecked) CustomSelection(),

                        SizedBox(height: 16),

                        Row(
                          children: [
                            Expanded(
                              child: Mybutton(
                                color: const Color(0xffECEFF3),
                                text: "Save Draft",
                                onTap: () => Navigator.pop(context),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: Mybutton(
                                color: const Color(0xff9EBA72),
                                text: "Publish",
                                onTap: () {
                                  final sendMsg = sendtext.text.trim();

                                  if (sendMsg.isNotEmpty) {
                                    msg.addAnswer("myra", true, sendMsg);
                                    sendtext.clear();
                                    debugPrint("\n msg add hoiseeee \n");
                                    ref
                                        .watch(isAnswerSentProvider.notifier)
                                        .state = true;
                                    Navigator.pop(context);
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 28.h),
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
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
