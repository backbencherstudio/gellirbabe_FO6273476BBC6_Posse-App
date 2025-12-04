import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:possy_app/src/feature/account_screen/data/posse_category_dummy_data.dart';
import 'package:possy_app/src/feature/account_screen/model/posse_category_selection_model.dart';
import 'package:flutter/material.dart';

final posseCategorySelectionProvider = StateNotifierProvider<
  PosseCategoryNotifier,
  List<PosseCategorySelectionModel>
>((ref) {
  return PosseCategoryNotifier();
});

class PosseCategoryNotifier
    extends StateNotifier<List<PosseCategorySelectionModel>> {
  PosseCategoryNotifier()
    : super(
        posseCategory
            .map((item) => PosseCategorySelectionModel.fromJson(item))
            .toList(),
      );

  void toggleSelection(int index, BuildContext context) {
    int selectedCount = state.where((item) => item.isSelected).toList().length;

    if (selectedCount < 5 || state[index].isSelected) {
      state = [
        for (var i = 0; i < state.length; i++)
          if (i == index)
            state[i].copyWith(isSelected: !state[i].isSelected)
          else
            state[i],
      ];
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('You can select a maximum 5 categories.')),
      );
    }
  }
}
