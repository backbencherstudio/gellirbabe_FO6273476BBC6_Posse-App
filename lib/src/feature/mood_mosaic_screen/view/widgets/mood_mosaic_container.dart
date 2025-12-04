import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gif/gif.dart';
import 'package:possy_app/src/common_widget_style/common_style/mood_mosaic_style/mood_mosaic_text_theme.dart';

class MoodMosaicContainer extends StatefulWidget {
  final String moodName;
  final String gifPath;
  final Color textColor;
  final Color moodColor;
  const MoodMosaicContainer({
    super.key,
    required this.moodName,
    required this.gifPath,
    required this.textColor,
    required this.moodColor,
  });

  @override
  State<MoodMosaicContainer> createState() => _MoodMosaicContainerState();
}

class _MoodMosaicContainerState extends State<MoodMosaicContainer>
    with TickerProviderStateMixin {
  late GifController _gifController;
  @override
  void initState() {
    _gifController = GifController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _gifController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 27.w),
      height: 450.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
      decoration: BoxDecoration(
        color: widget.moodColor,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        spacing: 20.h,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "How are you feeling today?",
            style: MoodMosaicTextTheme.moodHeadlineTextStyle.copyWith(
              color: widget.textColor,
            ),
            textAlign: TextAlign.center,
          ),

          Text(
            widget.moodName,
            style: MoodMosaicTextTheme.moodTextStyle.copyWith(
              color: widget.textColor,
            ),
            textAlign: TextAlign.center,
          ),

          // SizedBox(height: 16.h,),
          Expanded(
            child: Gif(
              image: AssetImage(widget.gifPath),
              controller:
                  _gifController, // if duration and fps is null, original gif fps will be used.
              fps: 3,
              // width: 350.w,
              // height: 350.h,
              //duration: const Duration(seconds: 3),
              autostart: Autostart.loop,
              placeholder: (context) => const Text('Loading...'),
              onFetchCompleted: () {
                _gifController.reset();
                _gifController.forward();
              },
            ),
          ),
        ],
      ),
    );
  }
}
