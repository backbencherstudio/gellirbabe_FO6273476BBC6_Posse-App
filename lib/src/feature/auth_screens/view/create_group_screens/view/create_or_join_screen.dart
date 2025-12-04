  import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:possy_app/core/routes/route_name.dart';
import 'package:possy_app/src/common_widget_style/common_style/auth_style/auth_color_pallete.dart';
import 'package:possy_app/src/common_widget_style/common_style/auth_style/auth_input_decoration_theme.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_widgets.dart';
import 'package:possy_app/src/feature/auth_screens/view/auth_widgets/footer_text.dart';

import '../../../../../../core/constant/images.dart';

class CreateOrJoinScreen extends StatelessWidget {
  const CreateOrJoinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// Text Theme
    final headlineSmall = Theme.of(context).textTheme.headlineSmall;
    final bodyMedium = Theme.of(context).textTheme.bodyMedium;
    final titleSmall = Theme.of(context).textTheme.titleSmall;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: SizedBox(
              height: ScreenUtil().screenHeight,
              width: ScreenUtil().screenWidth,
              child: Image.asset(
                'assets/images/create-group-bg.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(24.r),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi! Maren Workman',
                      style: headlineSmall?.copyWith(
                        color: AuthColorPalette.titleColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Become a member of our community!",
                      style: titleSmall?.copyWith(
                        color: AuthColorPalette.textColorGreyscale,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 108.h),
                    /*TextFormField(
                      decoration:
                          AuthInputDecorationTheme.lightInputDecorationTheme(
                            context: context,
                            hintText: "Enter reference posse Code",
                            fillColor: AuthColorPalette.referenceBackground,
                          ),
                    ),*/
                    SizedBox(height: 16.h),
                    CommonWidgets.primaryButton(
                      context: context,
                      title: "Create a Posse",
                      color: AuthColorPalette.primary,
                      textColor: AuthColorPalette.white,
                      onPressed: () {
                        context.go(RouteName.createGroupScreen);
                      },
                    ),
                    SizedBox(height: 14.h,),
                    Text('Invite your family or friends, and start your first Anchor Question',style: bodyMedium?.copyWith(
                      color: AuthColorPalette.textColorGreyscale,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,),
                    SizedBox(height: 34.h),
                    CommonWidgets.primaryButton(
                      context: context,
                      title: "Join a Posse",
                      color: AuthColorPalette.secondary,
                      textColor: Colors.black,
                      onPressed: () {
                        context.go(RouteName.moodMosaicScreen);
                      },
                    ),
                    SizedBox(height: 14.h,),
                    Text('Invite your family or friends, and start your first Anchor Question',style: bodyMedium?.copyWith(
                      color: AuthColorPalette.textColorGreyscale,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
