// animation_helper.dart
import 'package:flutter/widgets.dart';

class AnimationHelper {
  late AnimationController titleController;
  late AnimationController descriptionController;
  late Animation<Offset> titleOffset;
  late Animation<Offset> descriptionOffset;

  // Initialize the controllers and animations
  void initAnimation(TickerProvider vsync) {
    titleController = AnimationController(
      vsync: vsync,
      duration: Duration(milliseconds: 500),
    );

    descriptionController = AnimationController(
      vsync: vsync,
      duration: Duration(milliseconds: 500),
    );

    titleOffset = Tween<Offset>(
      begin: Offset(1.0, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: titleController, curve: Curves.easeInOut));

    descriptionOffset = Tween<Offset>(
      begin: Offset(1.0, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: descriptionController, curve: Curves.easeInOut));
  }

  // Trigger the animation when necessary
  void startAnimation() {
    titleController.forward(from: 0.0);
    descriptionController.forward(from: 0.0);
  }

  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
  }
}
