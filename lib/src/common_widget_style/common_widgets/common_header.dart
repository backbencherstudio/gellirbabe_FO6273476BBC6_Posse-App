import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

enum HeaderDesign { home, vibeCheck }

class CommonHeader extends StatelessWidget {
  const CommonHeader({
    super.key,
    required this.backgroundColor,
    this.child,
    this.backgroundContainerHeight,
    this.headerDesign,
  });

  final HeaderDesign? headerDesign;
  final Color backgroundColor;
  final Widget? child;
  final double? backgroundContainerHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5.h),
      height: backgroundContainerHeight ?? 210.h,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24.r),
          bottomRight: Radius.circular(24.r),
        ),
      ),
      child: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                width: 101.w,
                height: 109.h,
                child: Image.asset(
                  "assets/app_logo_background.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // Optional child widget placed on top
            if (child != null)
              Positioned(top: 20.h, left: 0, right: 0, child: child!),
          ],
        ),
      ),
    );
  }
}
