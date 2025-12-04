import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectionNotifier extends StateNotifier<Map<String, bool>> {
  SelectionNotifier()
    : super({"Tone": false, "Clarity": false, "Context": false});

  void toggle(String key) {
    state = {...state, key: !(state[key] ?? false)};
  }

  bool isSelected(String key) => state[key] ?? false;
}

final isSelected = StateNotifierProvider<SelectionNotifier, Map<String, bool>>(
  (ref) => SelectionNotifier(),
);
