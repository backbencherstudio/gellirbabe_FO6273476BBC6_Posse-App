import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:possy_app/core/constant/icons.dart';
import 'package:possy_app/core/routes/route_name.dart';
import 'package:possy_app/src/common_widget_style/common_style/auth_style/auth_color_pallete.dart';
import 'package:possy_app/src/common_widget_style/common_style/auth_style/auth_input_decoration_theme.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_widgets.dart';
import 'package:possy_app/src/feature/auth_screens/view/create_group_screens/view/widgets/group_option_tile.dart';
import 'package:possy_app/src/feature/auth_screens/view/create_group_screens/view_model/create_group_provider.dart';

class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({super.key});

  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  String selectedGroup = 'Friends';
  final TextEditingController _groupNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    /// Text theme
    // final bodyLarge = Theme.of(context).textTheme.bodyLarge;
    final headlineSmall = Theme.of(context).textTheme.headlineSmall;
    final titleSmall = Theme.of(context).textTheme.titleSmall;
    final bodyLarge = Theme.of(context).textTheme.bodyLarge;

    return Scaffold(
      // appBar: Utils.appBarBackButton(context),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/images/create-group-bg.png", fit: BoxFit.cover),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 70.h),
                Container(
                  height: MediaQuery.of(context).size.height * 0.68,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 44.h,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 24.w),
                  decoration: BoxDecoration(
                    color: AuthColorPalette.cardBackground,
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Create a posse for', style: headlineSmall),
                      SizedBox(height: 44.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'What posse do you want to create?',
                          style: bodyLarge?.copyWith(
                            color: AuthColorPalette.titleColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      groupOptionTile(
                        label: 'Friends',
                        iconImage: AppIcons.fam,
                        context: context,
                      ),
                      SizedBox(height: 12.h),
                      groupOptionTile(
                        label: 'Family',
                        iconImage: AppIcons.grp,
                        context: context,
                      ),
                      SizedBox(height: 32.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Type your posse name',
                          style: bodyLarge?.copyWith(
                            color: AuthColorPalette.titleColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      TextFormField(
                        controller: _groupNameController,
                        decoration:
                            AuthInputDecorationTheme.lightInputDecorationTheme(
                              context: context,
                              hintText: "Enter your posse name",
                            ),
                      ),
                      SizedBox(height: 32.h),
                      Consumer(
                        builder: (context, ref, child) {
                          return CommonWidgets.primaryButton(
                            context: context,
                            title: "Done",
                            color: AuthColorPalette.primary,
                            textColor: AuthColorPalette.white,
                            onPressed: () async {
                              ref
                                  .read(createOrJoinPosseProvider.notifier)
                                  .createPosse(
                                    name: _groupNameController.text,
                                    type:
                                        ref
                                            .watch(createOrJoinPosseProvider)
                                            .selectedLabel,
                                  );

                        
                                context.pushNamed(
                                  RouteName.congratulationScreen,
                                );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
