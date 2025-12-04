import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/images.dart';
import '../../../../core/constant/padding.dart';

class BuildBottomSheetWidget extends StatelessWidget {
  const BuildBottomSheetWidget({super.key, required this.imageUrls});
  final List<String> imageUrls;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.h),
            ...imageUrls.map((imageUrl) {
              return Container(
                width: 365.w,
                padding: AppPadding.screenHorizontalPadding,
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        radius: 22.r,
                        backgroundImage: NetworkImage(imageUrl),
                      ),
                      title: Row(
                        children: [
                          Text(
                            'Mr. Smith',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          SizedBox(width: 8.w),
                          if (imageUrl ==
                              'https://randomuser.me/api/portraits/men/1.jpg')
                            Image.asset(AppImages.premiumImage),
                        ],
                      ),
                      onTap: () {
                        Navigator.pop(context, imageUrl);
                      },
                    ),
                    SizedBox(height: 16),
                    if (imageUrl != imageUrls.last)
                      Divider(thickness: 1.5, height: 12.h),
                  ],
                ),
              );
            }),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
