import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:possy_app/core/constant/padding.dart';
import '../../../../../../core/theme/src/theme_extension/color_pallete.dart';
import '../../../../../common_widget_style/common_widgets/common_header.dart';
import '../../../../../common_widget_style/common_widgets/common_widgets.dart';
import '../../../data/posse_dummt_data.dart';
import '../../../model/posse_selection_model.dart';
import '../../../view_model/choose_posse_provider.dart';
import 'widgets/posse_widgets.dart';

class ChangeMyPosse extends ConsumerWidget {
  const ChangeMyPosse({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextTheme textTheme = Theme.of(context).textTheme;
    final selectedPosse = ref.watch(choosePosseProvider);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonHeader(
            backgroundColor: AppColor.primaryColor,
            backgroundContainerHeight: 120,
            child: CommonWidgets.customAppBar(
              context: context,
              title: 'Change myPosse',
              titleColor: AppColor.white,
              isBackButton: true,
            ),
          ),

          Padding(
            padding: AppPadding.screenHorizontalPadding,
            child: Column(
              children: [
                SizedBox(height: 20),
                ...posseData.map((json) {
                  final posse = PosseSelectionModel.fromJson(json);
                  final isSelected = selectedPosse?.posseID == posse.posseID;

                  return GestureDetector(
                    onTap: () {
                      ref.read(choosePosseProvider.notifier).selectPosse(posse);
                    },
                    child: PosseWidget(
                      textTheme: textTheme,
                      posse: posse,
                      isSelected: isSelected,
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
