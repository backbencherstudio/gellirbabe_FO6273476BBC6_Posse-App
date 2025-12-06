import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:possy_app/core/theme/src/theme_extension/color_pallete.dart';
import 'package:possy_app/core/utils/utils.dart';

import '../../../../../../../../core/constant/icons.dart';
import '../../../../../../../../core/routes/route_name.dart';
import '../../../../../../../common_widget_style/common_style/auth_style/auth_color_pallete.dart';
import '../../../../../../../common_widget_style/common_style/auth_style/auth_input_decoration_theme.dart';
import '../../../../../../../common_widget_style/common_widgets/common_widgets.dart';
import '../../../view_model/sign_up_provider.dart';

class SignupInputContent extends ConsumerStatefulWidget {
  const SignupInputContent({super.key});

  @override
  ConsumerState<SignupInputContent> createState() => _SignupInputContentState();
}

class _SignupInputContentState extends ConsumerState<SignupInputContent> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailOrPhoneController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController conPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(signUpProvider.notifier);
    final watch = ref.watch(signUpProvider);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: 30.h),
          TextFormField(
            controller: nameController,
            decoration: AuthInputDecorationTheme.lightInputDecorationTheme(
              context: context,
              hintText: "Your name",
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 16.w, right: 4.w),
                child: SvgPicture.asset(AppIcons.personIcon),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Field can't be empty";
              }
              return null;
            },
          ),
          SizedBox(height: 16.h),
          TextFormField(
            controller: emailOrPhoneController,
            decoration: AuthInputDecorationTheme.lightInputDecorationTheme(
              context: context,
              hintText: "Your email",
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 16.w, right: 4.w),
                child: SvgPicture.asset(AppIcons.mailIcon),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          TextFormField(
            controller: dobController,
            decoration: AuthInputDecorationTheme.lightInputDecorationTheme(
              context: context,
              hintText: "Your birthday (MM/DD/YYYY)",
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 16.w, right: 4.w),
                child: SvgPicture.asset(AppIcons.calenderIcon),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Field can't be empty";
              }
              return null;
            },
          ),
          SizedBox(height: 16.h),
          TextFormField(
            controller: passwordController,
            obscureText: !watch.isPasswordVisible,
            decoration: AuthInputDecorationTheme.lightInputDecorationTheme(
              context: context,
              hintText: "Create your password",
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 16.w, right: 4.w),
                child: SvgPicture.asset(AppIcons.lockIcon),
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  notifier.togglePasswordVisibility();
                },
                child: Icon(
                  watch.isPasswordVisible
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  size: 20.r,
                  color: Color(0xFF777980),
                ),
              ),
            ),
          ),
          Text(
            'Your password must be at least 8 characters and include at least 1 number.',
            style: Theme.of(context).textTheme.labelSmall,
          ),
          SizedBox(height: 16.h),
          TextFormField(
            controller: conPasswordController,
            obscureText: !watch.isConfirmPasswordVisible,
            decoration: AuthInputDecorationTheme.lightInputDecorationTheme(
              context: context,
              hintText: "Confirm your password",
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 16.w, right: 4.w),
                child: SvgPicture.asset(AppIcons.lockIcon),
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  notifier.toggleConfirmPasswordVisibility();
                },
                child: Icon(
                  watch.isConfirmPasswordVisible
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  size: 20.r,
                  color: Color(0xFF777980),
                ),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Field can't be empty";
              }
              return null;
            },
          ),

          Text(
            'By tapping “Continue,” you agree to our Terms of Service and Privacy Policy.',
            style: Theme.of(context).textTheme.labelSmall,
          ),
          SizedBox(height: 32.h),
          CommonWidgets.primaryButton(
            isLoading: watch.isLoading,
            context: context,
            title: "Continue",
            color: AuthColorPalette.primary,
            textColor: AuthColorPalette.white,
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                if (passwordController.text == conPasswordController.text) {
                  notifier.checkIsLoading();
                  final res = await notifier.register(
                    name: nameController.text.trim(),
                    emailOrPhone: emailOrPhoneController.text.trimLeft(),
                    dob: dobController.text.trim(),
                    password: passwordController.text.trim(),
                  );
                  if (res.isSuccess) {
                    notifier.checkIsLoading();
                    Utils.showToast(
                      message: res.message,
                      backgroundColor: AppColor.successColor,
                    );

                    context.pushNamed(RouteName.signUpOTPScreen);
                  } else {
                    Utils.showToast(
                      message: res.message,
                      backgroundColor: AppColor.notifyRed,
                    );
                    notifier.checkIsLoading();
                  }
                } else {
                  Utils.showToast(
                    message: "Opps! Password Does not match",
                    backgroundColor: AppColor.notifyRed,
                  );
                }
              }
            },
          ),
          SizedBox(height: 32.h),
        ],
      ),
    );
  }
}
