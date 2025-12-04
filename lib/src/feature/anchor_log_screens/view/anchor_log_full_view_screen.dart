import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/src/common_widget_style/common_style/anchor_log_style/anchor_log_color.dart';
import 'package:possy_app/src/feature/anchor_log_screens/view/widgets/anchor_log_body.dart';
import 'package:possy_app/src/feature/anchor_log_screens/view/widgets/anchor_log_header.dart';

class AnchorLogFullViewScreen extends StatelessWidget {
  const AnchorLogFullViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AnchorLogColor.screenBackgroundColor,
      body: Column(
        children: [
          /// App Bar
          AnchorLogHeader(isBackButton: true, titleText: "Anchor log"),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [AnchorLogBody(), SizedBox(height: 150.h)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
