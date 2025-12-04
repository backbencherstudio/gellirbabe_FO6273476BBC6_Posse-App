import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:possy_app/src/feature/home_screen/Riverpod/animated_countdown_provider.dart';
import 'package:possy_app/src/feature/home_screen/view/widget/animated_container/customPain_circle_container.dart';

class CountdownCircle extends ConsumerStatefulWidget {
  final Color progressColor;  
  final Color backgroundColor;  
  final Color textColor;
  const CountdownCircle({
    super.key,
    required this.progressColor,
    required this.backgroundColor,
    required this.textColor

  });

  @override
  ConsumerState<CountdownCircle> createState() => _CountdownCircleState();
}

class _CountdownCircleState extends ConsumerState<CountdownCircle> {
  double targetProgress = 0;
  String label = '';

  @override
  void initState() {
    super.initState();
    final countdown = ref.read(countdownProvider);
    targetProgress = countdown.progress;
    label = countdown.label;
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: targetProgress),
      duration: const Duration(seconds: 1),
      builder: (context, value, _) {
        return CustomPaint(
          painter: CountdownPainter(
            progress: value,
            progressColor: widget.progressColor,  
            backgroundColor: widget.backgroundColor,  
          ),
          child: Container(
            width: 64,
            height: 64,
            alignment: Alignment.center,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: widget.textColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
