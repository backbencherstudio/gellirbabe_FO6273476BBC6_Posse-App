import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:possy_app/core/constant/icons.dart';
import 'package:possy_app/src/feature/home_screen/view/widget/reaction_on_text/privateReplyBottomSheet.dart';

void showReactionMenu(BuildContext context, Offset position) {
  final RenderBox overlay =
      Overlay.of(context).context.findRenderObject() as RenderBox;

  showMenu<String>(
    context: context,
    color: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
    position: RelativeRect.fromRect(
      position & const Size(40, 40),
      Offset.zero & overlay.size,
    ),
    items: [
      PopupMenuItem<String>(
        enabled: false,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "assets/images/parent_screen/e1.png",
              height: 24,
              width: 24,
            ),
            SizedBox(width: 12.w),
            Image.asset(
              "assets/images/parent_screen/e2.png",
              height: 24,
              width: 24,
            ),
            SizedBox(width: 12.w),
            Image.asset(
              "assets/images/parent_screen/e3.png",
              height: 24,
              width: 24,
            ),
            SizedBox(width: 12.w),
            Image.asset(
              "assets/images/parent_screen/e4.png",
              height: 24,
              width: 24,
            ),
            SizedBox(width: 12.w),
            Image.asset(
              "assets/images/parent_screen/e5.png",
              height: 24,
              width: 24,
            ),
          ],
        ),
      ),
      const PopupMenuDivider(),
      PopupMenuItem<String>(
        value: "copy",
        child: GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              SvgPicture.asset(AppIcons.copyIcon, height: 18, width: 18),
              const SizedBox(width: 8),
              const Text("Copy"),
            ],
          ),
        ),
      ),
      const PopupMenuDivider(),
      PopupMenuItem<String>(
        value: "bookmark",
        child: GestureDetector(
          onTap: () {
            privateReplyBottomSheet(context);
          },
          child: Row(
            children: [
              SvgPicture.asset(
                AppIcons.replyPrivateIcon,
                height: 18,
                width: 18,
              ),
              const SizedBox(width: 8),
              const Text("Reply Privately"),
            ],
          ),
        ),
      ),
    ],
  ).then((String? value) {
    if (value == "copy") {
      debugPrint("\nCopy tapped\n");
    } else if (value == "bookmark") {
      debugPrint("\nBookmark tapped\n");
    }
  });
}
