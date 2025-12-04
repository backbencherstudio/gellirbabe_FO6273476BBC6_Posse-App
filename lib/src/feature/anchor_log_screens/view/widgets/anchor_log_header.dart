import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/src/common_widget_style/common_style/anchor_log_style/anchor_log_color.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_header.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_widgets.dart';

class AnchorLogHeader extends StatelessWidget {
  final bool? isBackButton;
  final String titleText;
  final String? subtitleText;
  const AnchorLogHeader({
    super.key,
    this.isBackButton,
    required this.titleText,
    this.subtitleText,
  });

  @override
  Widget build(BuildContext context) {
    return CommonHeader(
      backgroundContainerHeight: 140.h,
      backgroundColor: AnchorLogColor.appBarBackgroundColor,
      child: CommonWidgets.customAppBar(
        backButtonColor: Colors.white,
        isBackButton: isBackButton,
        context: context,
        title: titleText,
        titleColor: Colors.white,
        subtitle: subtitleText,
        subtitleColor: Colors.white,
        actionWidgets: CommonWidgets.notificationButton(context: context),
      ),
    );
  }
}
