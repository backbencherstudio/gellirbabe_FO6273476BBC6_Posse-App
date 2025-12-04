import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:possy_app/core/constant/padding.dart';
import 'package:possy_app/core/routes/route_name.dart';
import 'package:possy_app/src/common_widget_style/common_style/auth_style/auth_color_pallete.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_widgets.dart';
import 'package:possy_app/src/feature/auth_screens/view/create_group_screens/riverpod/selection_provider.dart';
import 'package:possy_app/src/feature/auth_screens/view/create_group_screens/view/widgets/select_tile.dart';

class SelectCategoryScreen extends StatefulWidget {
  const SelectCategoryScreen({super.key});

  @override
  State<SelectCategoryScreen> createState() => _SelectCategoryScreenState();
}

class _SelectCategoryScreenState extends State<SelectCategoryScreen> {
  String selectedGroup = 'Friends';

  @override
  Widget build(BuildContext context) {
    /// Text theme
    // final bodyLarge = Theme.of(context).textTheme.bodyLarge;
    final headlineSmall = Theme.of(context).textTheme.headlineSmall;
    final titleSmall = Theme.of(context).textTheme.titleSmall;
    final bodyLarge = Theme.of(context).textTheme.bodyLarge;

    List<String> names = [
      "games",
      "camera",
      "music",
      "dance",
      "utopia",
      "DC",
      "comics",
      "MIA",
      "trap",
      "LA",
      "Rain",
      "Food",
    ];

    

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/images/create-group-bg.png", fit: BoxFit.cover),
          Padding(
            padding: AppPadding.screenHorizontalPadding,
            child: Column(
              children: [
                SizedBox(height: 80.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Hi! Maren Workman',
                    style: headlineSmall?.copyWith(
                      color: AuthColorPalette.titleColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,

                  child: Text(
                    "Select Up to 5 Prompts for your Possy ",
                    style: titleSmall?.copyWith(
                      color: AuthColorPalette.textColorGreyscale,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 108.h),
                Expanded(
                  child: Consumer(
                    builder: (context, ref, _) {
                      final isSelected = ref.watch(selectionProvider);
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4, // Number of columns
                              crossAxisSpacing: 12.0, // Space between columns
                              mainAxisSpacing: 16.0, // Space between rows
                              childAspectRatio:
                                  2.1, // Width/height ratio of each tile
                            ),
                        itemCount: names.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              ref
                                  .watch(selectionProvider.notifier)
                                  .toggleSelection(names[index]);
                            },
                            child: SelectTile(
                              text: names[index],

                              isSelected: isSelected.contains(names[index]),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),

                CommonWidgets.primaryButton(
                  context: context,
                  title: "Done",
                  color: AuthColorPalette.primary,
                  textColor: AuthColorPalette.white,
                  onPressed: () {
                    context.pushNamed(RouteName.congratulationScreen);
                  },
                ),
                SizedBox(height: 200.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
