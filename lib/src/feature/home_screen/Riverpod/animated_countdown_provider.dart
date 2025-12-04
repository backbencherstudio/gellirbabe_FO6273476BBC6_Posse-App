import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:possy_app/src/feature/home_screen/state_model/animated_state_model.dart';

class CountdownNotifier extends StateNotifier<CountdownState> {
  CountdownNotifier()
    : super(
        CountdownState(
          totalDays: 7,
          startDate: DateTime.now().subtract(const Duration(days: 4)),
        ),
      );
}

final countdownProvider =
    StateNotifierProvider<CountdownNotifier, CountdownState>(
      (ref) => CountdownNotifier(),
    );
