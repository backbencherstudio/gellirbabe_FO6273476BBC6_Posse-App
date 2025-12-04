import 'package:flutter_riverpod/flutter_riverpod.dart';

final highlightedDatesProvider = Provider<Set<DateTime>>((ref) {
  return {DateTime(2025, 8, 5), DateTime(2025, 8, 17)};
});

final selectedDayProvider = StateProvider<DateTime?>((ref) => null);

final focusedDayProvider = StateProvider<DateTime>(
  (ref) => DateTime(2025, 8, 5),
);
