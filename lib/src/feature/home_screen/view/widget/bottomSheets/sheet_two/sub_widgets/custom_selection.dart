import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/src/feature/home_screen/Riverpod/selection_provider.dart';
import 'package:possy_app/src/feature/home_screen/view/widget/bottomSheets/sheet_two/sub_widgets/ai_custom_container.dart';

class CustomSelection extends StatelessWidget {
  const CustomSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final selected = ref.watch(isSelected);

        return Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Select what you'd like the AI to assist with:",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Expanded(
                  child: AiCustomContainer(
                    text: "Tone",
                    bgColor:
                        selected["Tone"] == true
                            ? const Color(0xff9EBA72)
                            : const Color(0xffffffff),
                    textColor:
                        selected["Tone"] == true
                            ? const Color(0xffffffff)
                            : const Color(0xff000000),
                    onTap: () {
                      ref.read(isSelected.notifier).toggle("Tone");
                    },
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: AiCustomContainer(
                    text: "Clarity",
                    bgColor:
                        selected["Clarity"] == true
                            ? const Color(0xff9EBA72)
                            : const Color(0xffffffff),
                    textColor:
                        selected["Clarity"] == true
                            ? const Color(0xffffffff)
                            : const Color(0xff000000),
                    onTap: () {
                      ref.read(isSelected.notifier).toggle("Clarity");
                    },
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: AiCustomContainer(
                    text: "Context",
                    bgColor:
                        selected["Context"] == true
                            ? const Color(0xff9EBA72)
                            : const Color(0xffffffff),
                    textColor:
                        selected["Context"] == true
                            ? const Color(0xffffffff)
                            : const Color(0xff000000),
                    onTap: () {
                      ref.read(isSelected.notifier).toggle("Context");
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
