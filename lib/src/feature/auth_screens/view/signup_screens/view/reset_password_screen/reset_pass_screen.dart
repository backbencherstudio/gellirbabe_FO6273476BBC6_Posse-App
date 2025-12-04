import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:possy_app/core/constant/icons.dart';
import 'package:possy_app/core/constant/padding.dart';
import 'package:possy_app/core/routes/route_name.dart';
import 'package:possy_app/src/common_widget_style/common_style/auth_style/auth_color_pallete.dart';
import 'package:possy_app/src/common_widget_style/common_style/auth_style/auth_input_decoration_theme.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_widgets.dart';
import 'package:possy_app/src/feature/auth_screens/view/signup_screens/view_model/sign_up_provider.dart';

import '../../../signin_screens/view_model/sign_in_provider.dart';

class ResetPassScreen extends StatefulWidget {
  const ResetPassScreen({super.key});

  @override
  State<ResetPassScreen> createState() => _ResetPassScreenState();
}

class _ResetPassScreenState extends State<ResetPassScreen> {
  String selectedGroup = 'Friends';
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _ConfirmpasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    /// Text theme
    // final bodyLarge = Theme.of(context).textTheme.bodyLarge;
    final headlineSmall = Theme.of(context).textTheme.headlineSmall;
    final bodyLarge = Theme.of(context).textTheme.bodyLarge;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      // appBar: Utils.appBarBackButton(context),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/images/create-group-bg.png", fit: BoxFit.cover),
          Padding(
            padding: AppPadding.screenHorizontalPadding,
            child: Column(
              children: [
                SizedBox(height: 70.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Set Your New Password', style: headlineSmall),
                    Text(
                      'Choose and confirm your new password',
                      style: textTheme.bodyMedium,
                    ),
                    SizedBox(height: 44.h),

                    Text('New Password', style: headlineSmall),
                    Consumer(
                      builder: (context, ref, child) {
                        final isPasswordVisible =
                            ref.watch(signUpProvider).isPasswordVisible;
                        final notifier = ref.read(signUpProvider.notifier);
                        return TextFormField(
                          obscureText: !isPasswordVisible,
                          decoration:
                              AuthInputDecorationTheme.lightInputDecorationTheme(
                                context: context,
                                hintText: "Enter new password",
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(
                                    left: 16.w,
                                    right: 4.w,
                                  ),
                                  child: SvgPicture.asset(AppIcons.lockIcon),
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    notifier.togglePasswordVisibility();
                                    debugPrint(
                                      "\n\ntoggle password visibility: $isPasswordVisible\n",
                                    );
                                  },
                                  child: Icon(
                                    isPasswordVisible
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    size: 20.r,
                                    color: Color(0xFF777980),
                                  ),
                                ),
                              ),
                        );
                      },
                    ),
                    SizedBox(height: 16.h),
                    Consumer(
                      builder: (context, ref, child) {
                        final isConfirmPasswordVisible =
                            ref.watch(signUpProvider).isConfirmPasswordVisible;
                        final notifier = ref.read(signUpProvider.notifier);

                        return TextFormField(
                          obscureText: !isConfirmPasswordVisible,
                          decoration:
                              AuthInputDecorationTheme.lightInputDecorationTheme(
                                context: context,
                                hintText: "Confirm password",
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(
                                    left: 16.w,
                                    right: 4.w,
                                  ),
                                  child: SvgPicture.asset(AppIcons.lockIcon),
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    notifier.toggleConfirmPasswordVisibility();
                                  },
                                  child: Icon(
                                    isConfirmPasswordVisible
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    size: 20.r,
                                    color: Color(0xFF777980),
                                  ),
                                ),
                              ),
                        );
                      },
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Consumer(
                          builder: (context, ref, child) {
                            final isRemember = ref.watch(signInProvider).isRemember;
                            final notifier = ref.read(signInProvider.notifier);

                            return GestureDetector(
                              onTap: () {
                                notifier.toggleIsRemember();
                              },
                              child: Icon(
                                isRemember
                                    ? Icons.check_circle_rounded
                                    : Icons.circle_outlined,
                                color: AuthColorPalette.selectionBlue,
                              ),
                            );
                          },
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          "Stay logged in",
                          style: bodyLarge?.copyWith(
                            color: AuthColorPalette.textColorGrey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    CommonWidgets.primaryButton(
                      context: context,
                      title: "Reset Password",
                      color: AuthColorPalette.primary,
                      textColor: AuthColorPalette.white,
                      onPressed: () {
                        context.pushNamed(RouteName.congratulationScreen);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
