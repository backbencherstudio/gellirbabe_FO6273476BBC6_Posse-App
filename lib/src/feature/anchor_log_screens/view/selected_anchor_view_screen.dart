import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/core/constant/images.dart';
import 'package:possy_app/src/common_widget_style/common_style/anchor_log_style/anchor_log_color.dart';
import 'package:possy_app/src/feature/anchor_log_screens/view/widgets/anchor_log_common_container.dart';
import 'package:possy_app/src/feature/anchor_log_screens/view/widgets/anchor_log_divider.dart';
import 'package:possy_app/src/feature/anchor_log_screens/view/widgets/anchor_log_header.dart';
import 'package:possy_app/src/feature/anchor_log_screens/view/widgets/selected_anchor_view_body.dart';

class SelectedAnchorViewScreen extends StatelessWidget {
  const SelectedAnchorViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AnchorLogColor.screenBackgroundColor,
      body: Column(
        children: [
          AnchorLogHeader(titleText: "Anchor Log", isBackButton: true),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 16.h),

                  AnchorLogDivider(dividerText: "Last Week"),

                  SizedBox(height: 16.h),

                  SelectedAnchorViewBody(),

                  SizedBox(height: 150.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
