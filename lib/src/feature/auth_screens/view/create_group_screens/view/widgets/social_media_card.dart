import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:possy_app/src/common_widget_style/common_style/auth_style/auth_color_pallete.dart';

class SocialMediaCard extends StatelessWidget {
  const SocialMediaCard({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.only(right: 24.r),
        child: Card(
          color: AuthColorPalette.shadePurple,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0.r),
            child: SvgPicture.asset(
              imagePath,
              fit: BoxFit.contain,
              width: 24.w,
              height: 24.h,
            ),
          ),
        ),
      ),
    );

    // Container(
    //   height: 40.h,
    //  width: 40.w,
    //   decoration: BoxDecoration(
    //     color: Colors.transparent,
    //     borderRadius: BorderRadius.circular(6.r),
    //     border: Border.all(color: AuthColorPalette.greyscale200),),
    //   child: Image.asset("assets/icons/social_media/facebook.png",fit: BoxFit.contain,),
    //   ),
    // );
  }
}
