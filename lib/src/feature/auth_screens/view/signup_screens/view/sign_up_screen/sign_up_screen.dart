import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:possy_app/core/constant/padding.dart';
import 'package:possy_app/core/routes/route_name.dart';
import 'package:possy_app/src/common_widget_style/common_style/auth_style/auth_color_pallete.dart';
import 'package:possy_app/src/feature/auth_screens/view/signup_screens/view/sign_up_screen/parts/signup_input_content.dart';
import '../../../../../../../core/constant/icons.dart';
import '../../../auth_widgets/footer_text.dart';
import '../../../signin_screens/view/widgets/custom_login_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// Text Theme
    final headlineSmall = Theme.of(context).textTheme.headlineSmall;
    final titleSmall = Theme.of(context).textTheme.titleSmall;
    final bodyMedium = Theme.of(context).textTheme.bodyMedium;

    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: Utils.appBarBackButton(context),
      body: Padding(
        padding: AppPadding.screenHorizontalPadding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Create Your Account',
                      style: headlineSmall?.copyWith(
                        color: AuthColorPalette.titleColor,
                      ),
                    ),
                    Text(
                      "Sign up and start building meaningful moments",
                      style: titleSmall?.copyWith(
                        color: AuthColorPalette.textColorGreyscale,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 2,
                    ),
                  ],
                ),
              ),

              /// input content
             // signupInputContent(context: context),
             SignupInputContent(),

              /// "or" separator
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Divider(
                      color: AuthColorPalette.greyscale200,
                      height: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 17.w),
                    child: Text(
                      "Or",
                      style: bodyMedium?.copyWith(
                        color: AuthColorPalette.textColorGrey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: AuthColorPalette.greyscale200,
                      height: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),

              /// footer content
              buildLoginButton(
                context: context,
                imagePath: AppIcons.googleIcon,
                title: "Continue with Google",
              ),
              SizedBox(height: 16.h),
              buildLoginButton(
                context: context,
                imagePath: AppIcons.appleIcon,
                title: "Continue with Apple",
              ),
              SizedBox(height: 24.h),
              footerText(
                context: context,
                text1: "Already have an account_style? ",
                text2: 'Log In',
                onTap: () {
                  context.go(RouteName.signInScreen);
                },
              ),

              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
