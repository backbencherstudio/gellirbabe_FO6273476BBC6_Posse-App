import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:possy_app/core/routes/route_name.dart';
import 'package:possy_app/core/theme/src/theme_extension/color_pallete.dart';
import 'package:possy_app/core/utils/utils.dart';
import 'package:possy_app/src/common_widget_style/common_style/auth_style/auth_color_pallete.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_widgets.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/spacer/auto_spacer.dart';
import 'package:possy_app/src/feature/auth_screens/view/signup_screens/view_model/sign_up_provider.dart';

class SignupOtpScreen extends ConsumerWidget {
  final String emailOrPhone;
  const SignupOtpScreen({super.key, required this.emailOrPhone});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Text Theme
    // final bodyLarge = Theme.of(context).textTheme.bodyLarge;
    final headlineSmall = Theme.of(context).textTheme.headlineSmall;
    final titleSmall = Theme.of(context).textTheme.titleSmall;
    final TextEditingController otpController = TextEditingController();

    return Scaffold(
      backgroundColor: AuthColorPalette.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Enter Verification Code",
                  style: headlineSmall?.copyWith(
                    color: AuthColorPalette.titleColor,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "A verification code was sent to your email. Please enter your verification code below.",
                  style: titleSmall?.copyWith(
                    color: AuthColorPalette.textColorGreyscale,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40.h),
                PinCodeTextField(
                  controller: otpController,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(12),
                    fieldHeight: 56,
                    fieldWidth: 56,
                    activeFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    activeColor: Color(0xFF2764B5),
                    selectedColor: Color(0xFF2764B5),
                    //Color(0xFF2764B5),
                    inactiveColor: Color(0xFFE9EAEC),

                    borderWidth: 1,
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  onCompleted: (v) {
                    print("Completed");
                  },
                  appContext: context,
                ),
                SizedBox(height: 16.h),
                CommonWidgets.primaryButton(
                  isLoading: ref.watch(signUpProvider).isLoading,
                  context: context,
                  title: "Verify",
                  color: AuthColorPalette.primary,
                  textColor: AuthColorPalette.white,
                  onPressed: () async {
                    final notifier = ref.read(signUpProvider.notifier);
                    if (otpController.text.isNotEmpty) {
                      notifier.checkIsLoading();
                      var res = await notifier.verifyRegister(
                        emailOrPhone: emailOrPhone,
                        otp: otpController.text,
                      );
                      if (res.isSuccess) {
                        notifier.checkIsLoading();
                        context.go(RouteName.successfullyRegisteredScreen);
                      } else {
                        notifier.checkIsLoading();
                      }
                    } else {
                      Utils.showToast(
                        message: "Opps! need OTP!",
                        backgroundColor: AppColor.notifyRed,
                      );
                    }
                  },
                ),
                AutoSpacer(space: 16.h),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Don’t see it? ",
                        style: titleSmall?.copyWith(
                          color: AuthColorPalette.textColorGreyscale,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: "Resend Code in (4:56s)",
                        style: titleSmall?.copyWith(
                          color: AuthColorPalette.primary,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
