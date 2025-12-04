import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/core/utils/utils.dart';
import 'package:possy_app/src/common_widget_style/common_style/vibe_check_style/vibe_check_color.dart';
import '../model/quiz_option_Model.dart';
import '../view_model/question_provider.dart';
import 'avatar_stack.dart';
import 'build_bottom_sheet_widget.dart';

class QuestionOptionWidgets extends ConsumerWidget {
  final int index;
  final List<QuizOption> options;
  final TextTheme textTheme;

  const QuestionOptionWidgets({
    super.key,
    required this.index,
    required this.options,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentOption =
        ref.watch(QuestionNotifier.questionProvider(options))[index];
    final notifier = ref.read(
      QuestionNotifier.questionProvider(options).notifier,
    );

    return GestureDetector(
      onTap: () => notifier.select(index),
      child: Container(
        padding: EdgeInsets.all(16.w),
        margin: EdgeInsets.only(bottom: 12.h),
        decoration: BoxDecoration(
          color:
              currentOption.isSelected
                  ? VibeCheckColor.selectedOptionColor
                  : VibeCheckColor.unselectedOptionColor,
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
          border: Border.all(
            color:
                currentOption.isSelected
                    ? Colors.deepPurple
                    : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            currentOption.isSelected
                ? Icon(Icons.check_circle, color: Colors.deepPurple, size: 24.r)
                : SizedBox(),
            SizedBox(width: 10.w),

            /// Title
            Expanded(
              child: Text(
                currentOption.title,
                style: textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  color:
                      currentOption.isSelected
                          ? Colors.deepPurple
                          : Colors.black,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 10,
              ),
            ),

            /// Avatar Stack
            GestureDetector(
              onTap:
                  () => Utils.openBottomSheet(
                    context,
                    BuildBottomSheetWidget(imageUrls: currentOption.imageUrls),
                  ),

              ///showSelectorBottomSheet(context, currentOption.imageUrls),
              child: SizedBox(
                height: 40.h,
                width: 100.w,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: AvatarStack(
                    imageUrls: currentOption.imageUrls,
                    maxDisplay: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
