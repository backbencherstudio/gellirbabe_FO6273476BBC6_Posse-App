import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:possy_app/src/feature/quiz_screen/view/quiz_Body/sub_widgets/guess_bottomSheet.dart';
import 'package:possy_app/src/feature/quiz_screen/view/quiz_Body/sub_widgets/succes_bottomSheet.dart';
import 'package:possy_app/src/feature/vibe_check_screen/widgets/avatar_stack.dart';

class CustomQuizContainer extends StatelessWidget {
  final Color color;
  final String text;
  final Color textColor;
  final String img;
  final void Function()? onTap;
  final bool iShowPeeps;

  const CustomQuizContainer({
    super.key,
    required this.color,
    required this.text,
    required this.textColor,
    required this.img,
    required this.onTap,
    required this.iShowPeeps,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: Container(
          height: 50.h,
          width: 160.w,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 10.0,
                left: 12.0,
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: textColor,
                  ),
                ),
              ),
              Positioned(bottom: 0, right: 0.0, child: SvgPicture.asset(img)),
              if (iShowPeeps == true)
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: GestureDetector(
                    onTap: () {
                      showSuccessBottomSheet(context);
                      showGuessBottomSheet(context);
                    },
                    child: AvatarStack(
                      imageUrls: List.generate(
                        20,
                        (i) =>
                            'https://randomuser.me/api/portraits/men/${i + 1}.jpg',
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
