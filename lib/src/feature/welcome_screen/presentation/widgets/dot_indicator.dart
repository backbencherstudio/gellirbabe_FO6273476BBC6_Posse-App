import 'package:flutter/material.dart';

import '../../../../../core/theme/src/theme_extension/color_pallete.dart';
class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3, // Total number of pages
            (dotIndex) => Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
            dotIndex == index
                ? AppColor.primaryColor
                : Colors.grey,
          ),
        ),
      ),
    );
  }
}
