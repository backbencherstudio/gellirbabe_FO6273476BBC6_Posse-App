import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:possy_app/core/constant/icons.dart';
import 'package:possy_app/src/feature/parents_screens/riverpod_model/sheetCheck_provider.dart';

InputDecoration customInputDecoration({
  Widget? prefixIcon,
  Widget? suffixIcon,
  String? hintText,
}) {
  return InputDecoration(
    hintText: hintText,
    filled: true,
    fillColor: const Color(0xFFFFFFFF),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: Color(0xFFFFFFFF)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: Color.fromARGB(255, 108, 138, 85)),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: Color.fromARGB(255, 123, 25, 72)),
    ),
    prefixIcon: prefixIcon,
    suffixIcon: Consumer(
      builder: (_, ref, _) {
        // ignore: unused_local_variable
        final isChecked = ref.watch(isCheckedProvider);

        return suffixIcon ??
            Padding(
              padding: EdgeInsets.only(top: 60.h, right: 14.w),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      ref.read(isCheckedProvider.notifier).state =
                          !ref.read(isCheckedProvider.notifier).state;
                    },
                    child: SvgPicture.asset(
                      AppIcons.penIcon,
                      height: 24,
                      width: 24,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  GestureDetector(
                    onTap: () {
                      // attach action
                    },
                    child: SvgPicture.asset(
                      AppIcons.micIcon,
                      height: 24,
                      width: 24,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  GestureDetector(
                    onTap: () {
                      // camera action
                    },
                    child: SvgPicture.asset(
                      AppIcons.clipIcon,

                      height: 24,
                      width: 24,
                    ),
                  ),
                  SizedBox(width: 8.w),

                  GestureDetector(
                    onTap: () {
                      // camera action
                    },
                    child: SvgPicture.asset(
                      AppIcons.smileyIcon,
                      height: 24,
                      width: 24,
                    ),
                  ),
                ],
              ),
            );
      },
    ),
  );
}
