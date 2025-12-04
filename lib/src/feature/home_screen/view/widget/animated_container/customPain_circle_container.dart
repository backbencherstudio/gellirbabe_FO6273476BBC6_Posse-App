import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CountdownPainter extends CustomPainter {
  final double progress;
  final Color progressColor;  
  final Color backgroundColor;  

  CountdownPainter({
    required this.progress,
    required this.progressColor,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPaint = Paint()
      ..color = backgroundColor  
      ..style = PaintingStyle.fill;

    final progressPaint = Paint()
      ..color = progressColor  
      ..style = PaintingStyle.fill;

    final rect = Offset.zero & size;
    canvas.drawCircle(rect.center, size.width / 2, backgroundPaint);

    double sweepAngle = 2 * pi * progress;

    Path path = Path()
      ..moveTo(rect.center.dx, rect.center.dy)
      ..arcTo(
        Rect.fromCircle(center: rect.center, radius: size.width / 2),
        -pi / 2,
        sweepAngle,
        false,
      )
      ..close();

    canvas.drawPath(path, progressPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
