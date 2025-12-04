import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common_widget_style/common_widgets/spacer/auto_spacer.dart';
import 'dot_indicator.dart';
class DescribeWidget extends StatelessWidget {
  const DescribeWidget({
    super.key,
    required this.index,
    required Animation<Offset> descriptionOffset,
    required this.question,
    required this.descriptions,
  }) : _descriptionOffset = descriptionOffset;

  final int index;
  final Animation<Offset> _descriptionOffset;
  final List<String> question;
  final List<String> descriptions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///dot indicator

        DotIndicator(index: index),


        AutoSpacer(space: 20.h),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: SlideTransition(
            position: _descriptionOffset,
            child: Text(
              question[index],
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SlideTransition(
          position: _descriptionOffset,
          child: Text(
            descriptions[index],
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),

      ],
    );
  }
}