import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:possy_app/core/constant/icons.dart';
import 'package:possy_app/core/routes/route_name.dart';

import '../../../../../../../core/constant/padding.dart';
import '../../../../../../../core/theme/src/theme_extension/color_pallete.dart';
import '../../../../../../common_widget_style/common_style/account_style/account_color.dart';
import '../../../../../../common_widget_style/common_widgets/common_header.dart';
import '../../../../../../common_widget_style/common_widgets/common_widgets.dart';
import '../../../../../../common_widget_style/common_widgets/spacer/auto_spacer.dart';
import '../widgets/build_prompt_option.dart';

class PromptVaultScreen extends StatelessWidget {
  const PromptVaultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Column(
        children: [
          CommonHeader(
            backgroundColor: AccountColor.backgroundColor,
            backgroundContainerHeight: 130.h,
            child: CommonWidgets.customAppBar(
              context: context,
              title: 'Prompt Vault',
              titleColor: AppColor.white,
              isBackButton: true,
            ),
          ),
          AutoSpacer(space: 16.h),
          Padding(
            padding: AppPadding.screenHorizontalPadding,
            child: Column(
              children: [
                BuildPromptOptions(
                  textTheme: textTheme,
                  title: "Add a Prompt",
                  imagePath: AppIcons.addPrompt,
                  onTap: () {
                    context.push(RouteName.addPromptScreen);
                  },
                ),
                AutoSpacer(space: 8.h),
                BuildPromptOptions(
                  textTheme: textTheme,
                  title: "Edit Your Prompts",
                  imagePath: AppIcons.editPrompt,
                  onTap: () {
                    context.push(RouteName.editPromptScreen);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
