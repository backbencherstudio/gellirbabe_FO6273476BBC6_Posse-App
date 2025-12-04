import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/core/constant/padding.dart';
import 'package:possy_app/core/theme/src/theme_extension/color_pallete.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_header.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_widgets.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/spacer/auto_spacer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../view_model/posse_category_selection_provider.dart';
import 'widgets/posse_option_widgets.dart';

class PromptSelection extends ConsumerWidget {
  const PromptSelection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextTheme textTheme = Theme.of(context).textTheme;

    final categories = ref.watch(posseCategorySelectionProvider);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonHeader(
            backgroundColor: AppColor.primaryColor,
            backgroundContainerHeight: 120,
            child: CommonWidgets.customAppBar(
              context: context,
              title: 'Prompt Selection',
              titleColor: AppColor.white,
              isBackButton: true,
            ),
          ),

          Expanded(
            child: Padding(
              padding: AppPadding.screenHorizontalPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSpacer(space: 24.h),
                  Text(
                    'Select Up to 5 Prompts for your Posse',
                    style: textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  AutoSpacer(space: 32.h),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: AppPadding.screenHorizontalPadding,
                        child: Wrap(
                          spacing: 6.w,
                          runSpacing: 8.h,
                          children: List.generate(categories.length, (index) {
                            final category = categories[index];

                            return GestureDetector(
                              onTap: () {
                                ref
                                    .read(
                                      posseCategorySelectionProvider.notifier,
                                    )
                                    .toggleSelection(index, context);
                              },
                              child: PosseOptionWidget(
                                isSelected: category.isSelected,
                                category: category.categoryName,
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ),

                  CommonWidgets.primaryButton(
                    context: context,
                    title: 'Submit',
                    color: AppColor.primaryColor,
                    textColor: Colors.white,
                    onPressed: () {},
                  ),
                  AutoSpacer(space: 30.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
