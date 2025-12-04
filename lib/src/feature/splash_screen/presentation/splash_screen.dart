import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:possy_app/core/constant/images.dart';
import 'package:possy_app/core/constant/padding.dart';
import 'package:possy_app/core/routes/route_name.dart';
import 'package:possy_app/core/theme/src/theme_extension/color_pallete.dart';
import '../view_model/splash_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();

    ref.read(splashProvider.notifier).initializeSplash();
  }

  @override
  Widget build(BuildContext context) {
    final isSplashComplete = ref.watch(splashProvider);

    if (isSplashComplete) {
      Future.microtask(() {
        context.go(RouteName.welcomeScreen);
      });
    }
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppImages.screenBackgroundImage,
              fit: BoxFit.fill,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: AppPadding.screenHorizontalPadding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.logo, height: 209.h, width: 209.w),
                  const SizedBox(width: double.infinity),
                  Text(
                    'Welcome to MyPosse!',
                    style: textTheme.headlineLarge!.copyWith(
                      color: AppColor.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
