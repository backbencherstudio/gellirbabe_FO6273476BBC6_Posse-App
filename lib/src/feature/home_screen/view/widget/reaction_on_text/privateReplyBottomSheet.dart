// ignore_for_file: unnecessary_import
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:possy_app/core/constant/icons.dart';
import 'package:possy_app/src/feature/home_screen/Riverpod/private_reply_provider.dart';
import 'package:possy_app/src/feature/home_screen/view/widget/buttons/custom_Button.dart';
import 'package:possy_app/src/feature/home_screen/view/widget/inputDecoration/inputDecor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:possy_app/src/feature/home_screen/view/widget/reaction_on_text/sub_widget/customReplyContainer.dart';

void privateReplyBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      final sendText = TextEditingController();

      return Consumer(
        builder: (context, ref, _) {
          final selected = ref.watch(selectedReplyProvider);

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
                    child: Column(
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
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Reply Privately To Angie:",
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        SizedBox(
                          width: 326.w,
                          height: 127.h,
                          child: TextFormField(
                            controller: sendText,
                            expands: false,
                            maxLines: 5,
                            minLines: 3,
                            textAlignVertical: TextAlignVertical.top,
                            decoration: customInputDecoration(
                              hintText: "Write your answer",
                              suffixIcon: Padding(
                                padding: EdgeInsets.only(top: 50.h),
                                child: SvgPicture.asset(AppIcons.smileyIcon),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),

                        // Replies - written individually (no map)
                        CustomReplyContainer(
                          text: "I’m here if you need me.",
                          isSelected: selected == "I’m here if you need me.",
                          onTap: () {
                            ref.read(selectedReplyProvider.notifier).state =
                                "I’m here if you need me.";
                            sendText.text = "I’m here if you need me.";
                          },
                        ),
                        CustomReplyContainer(
                          text: "Tell me more about this.",
                          isSelected: selected == "Tell me more about this.",
                          onTap: () {
                            ref.read(selectedReplyProvider.notifier).state =
                                "Tell me more about this.";
                            sendText.text = "Tell me more about this.";
                          },
                        ),
                        CustomReplyContainer(
                          text: "That made me smile!",
                          isSelected: selected == "That made me smile!",
                          onTap: () {
                            ref.read(selectedReplyProvider.notifier).state =
                                "That made me smile!";
                            sendText.text = "That made me smile!";
                          },
                        ),
                        CustomReplyContainer(
                          text: "Thank you for sharing",
                          isSelected: selected == "Thank you for sharing",
                          onTap: () {
                            ref.read(selectedReplyProvider.notifier).state =
                                "Thank you for sharing";
                            sendText.text = "Thank you for sharing";
                          },
                        ),
                        CustomReplyContainer(
                          text: "Let’s talk when you’re ready.",
                          isSelected:
                              selected == "Let’s talk when you’re ready.",
                          onTap: () {
                            ref.read(selectedReplyProvider.notifier).state =
                                "Let’s talk when you’re ready.";
                            sendText.text = "Let’s talk when you’re ready.";
                          },
                        ),

                        SizedBox(height: 20.h),
                        CustomButton(
                          color: const Color(0xff9EBA72),
                          text: "Send",
                          textColor: Colors.white,
                          onTap: () {
                            debugPrint("Sent: ${sendText.text}");
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
