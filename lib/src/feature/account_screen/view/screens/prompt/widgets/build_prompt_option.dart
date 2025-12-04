import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../core/theme/src/theme_extension/color_pallete.dart';
import '../../../../../../common_widget_style/common_widgets/spacer/auto_spacer.dart';

class BuildPromptOptions extends StatelessWidget {
  const BuildPromptOptions({
    super.key,
    required this.textTheme,
    required this.title,
    required this.imagePath,
    required this.onTap,
  });
  final VoidCallback onTap;
  final TextTheme textTheme;
  final String title;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(24.r),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            SvgPicture.asset(imagePath),
            AutoSpacer(space: 8.w),
            Text(title, style: textTheme.titleSmall),
          ],
        ),
      ),
    );
  }
}
