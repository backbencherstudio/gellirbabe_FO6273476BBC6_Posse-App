import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../../core/constant/icons.dart';
import '../../../../../../../core/constant/padding.dart';
import '../../../../../../../core/theme/src/theme_extension/color_pallete.dart';
import '../../../../../../common_widget_style/common_style/account_style/account_color.dart';
import '../../../../../../common_widget_style/common_widgets/common_header.dart';
import '../../../../../../common_widget_style/common_widgets/common_widgets.dart';
import '../../../../../../common_widget_style/common_widgets/spacer/auto_spacer.dart';

class EditPromptScreen extends StatelessWidget {
  const EditPromptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Column(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Edit Prompt', style: textTheme.labelLarge),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 100,
                      padding: EdgeInsets.zero,
                      itemBuilder: (BuildContext context, int index) {
                        return EditPromptBuilder();
                      },
                    ),
                  ),
                  AutoSpacer(space: 10.h),
                  CommonWidgets.primaryButton(
                    context: context,
                    title: 'Select',
                    color: AppColor.primaryColor,
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  AutoSpacer(space: 20.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EditPromptBuilder extends StatelessWidget {
  const EditPromptBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      margin: EdgeInsets.symmetric(vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text('What is a favorite family tradition you have?'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              AppIcons.editPrompt,
              color: Color(0xff777980),
              height: 18.w,
              width: 18.w,
            ),
            AutoSpacer(space: 16.w),
            SvgPicture.asset(AppIcons.deleteGray),
          ],
        ),
      ),
    );
  }
}
