import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:possy_app/core/constant/icons.dart';
import 'package:possy_app/core/constant/padding.dart';
import '../../../../../../../core/theme/src/theme_extension/color_pallete.dart';
import '../../../../../../common_widget_style/common_style/account_style/account_color.dart';
import '../../../../../../common_widget_style/common_widgets/common_header.dart';
import '../../../../../../common_widget_style/common_widgets/common_widgets.dart';
import '../../../../../../common_widget_style/common_widgets/spacer/auto_spacer.dart';
import '../../../../../home_screen/view/widget/inputDecoration/inputDecor.dart';

class AddPromptScreen extends StatelessWidget {
  const AddPromptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonHeader(
            backgroundColor: AccountColor.backgroundColor,
            backgroundContainerHeight: 120.h,
            child: CommonWidgets.customAppBar(
              context: context,
              title: 'Prompt Vault',
              titleColor: AppColor.white,
              isBackButton: true,
            ),
          ),
          Expanded(
            child: Padding(
              padding: AppPadding.screenHorizontalPadding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSpacer(space: 16.h),
                      Text('Add a prompt', style: textTheme.labelLarge),

                      AutoSpacer(space: 16.h),
                      TextFormField(
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
                    ],
                  ),
                  CommonWidgets.primaryButton(
                    context: context,
                    title: 'Select',
                    color: AppColor.primaryColor,
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
          AutoSpacer(space: 50.h),
        ],
      ),
    );
  }
}
