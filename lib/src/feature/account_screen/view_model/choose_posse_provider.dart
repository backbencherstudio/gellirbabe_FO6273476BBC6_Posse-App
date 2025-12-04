import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/posse_selection_model.dart';

class ChoosePosseNotifier extends StateNotifier<PosseSelectionModel?> {
  ChoosePosseNotifier() : super(null); // No posse is selected initially

  void selectPosse(PosseSelectionModel posse) {
    state = posse;
  }

  void clearSelection() {
    state = null;
  }

  bool isSelected(PosseSelectionModel posse) {
    return state?.posseID == posse.posseID;
  }
}
final choosePosseProvider =
StateNotifierProvider<ChoosePosseNotifier, PosseSelectionModel?>((ref) {
  return ChoosePosseNotifier();
});
