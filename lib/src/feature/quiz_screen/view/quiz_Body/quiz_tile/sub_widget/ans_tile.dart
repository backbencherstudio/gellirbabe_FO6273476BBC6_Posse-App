import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/src/feature/home_screen/Riverpod/selection_provider.dart';

// ignore: must_be_immutable
class AnsTile extends StatelessWidget {
  final String text;
  final bool isSelected;

  void Function()? onTap;
  AnsTile({
    super.key,
    required this.text,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final themeCall = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 326.w,
        height: 80.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: isSelected ? const Color(0xffF075BD) : const Color(0xffF6F8FA),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 24.w,
            right: 24.w,
            top: 18.h,
            bottom: 18.h,
          ),
          child: Text(
            text,
            style: themeCall.titleSmall!.copyWith(color: Color(0xff070707)),
          ),
        ),
      ),
    );
  }
}
