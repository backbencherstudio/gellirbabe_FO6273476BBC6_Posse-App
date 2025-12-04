import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProgressContainer extends StatefulWidget {
  final int responded;
  final int total;

  const CustomProgressContainer({
    Key? key,
    required this.responded,
    required this.total,
  }) : super(key: key);

  @override
  State<CustomProgressContainer> createState() =>
      _CustomProgressContainerState();
}

class _CustomProgressContainerState extends State<CustomProgressContainer> {
  late double progressRatio;

  @override
  void initState() {
    super.initState();
    progressRatio = widget.total == 0 ? 0 : widget.responded / widget.total;
  }

  @override
  Widget build(BuildContext context) {
    final fullWidth = 326.w;
    final filledWidth = fullWidth * progressRatio;

    return Container(
      height: 24.h,
      width: fullWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32.r),
        color: const Color(0xffECEFF3),
      ),
      child: Stack(
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0.0, end: filledWidth),
            duration: const Duration(milliseconds: 600),
            builder: (context, value, child) {
              return Container(
                height: 24.h,
                width: value,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.r),
                  color: const Color(0xffB2CA8C),
                ),
                padding: EdgeInsets.only(left: 8.w, top: 2.h, bottom: 2.h),
                alignment: Alignment.centerLeft,
                child: Text(
                  "${widget.responded}/${widget.total} Responded",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
