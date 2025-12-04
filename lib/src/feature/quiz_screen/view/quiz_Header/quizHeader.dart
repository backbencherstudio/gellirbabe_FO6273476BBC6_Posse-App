// ignore_for_file: sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_header.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_widgets.dart';

 class QuizeHeader extends StatelessWidget {
  const  QuizeHeader({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return CommonHeader(
      backgroundColor: Color(0xffF5A3D3),
      backgroundContainerHeight: 140.h,
      child: CommonWidgets.customAppBar(
        
        margin: EdgeInsets.all(0),
        context: context,
        title: 'Angie’s Posse',
        titleColor: Color(0xffffffff),
        //subtitle: 'Explore',
        subtitleColor: Color(0xffffffff),
        actionWidgets: Container(
        child: CommonWidgets.notificationButton(context: context),
        margin: EdgeInsets.only(right: 16),     
        ),   
      ),
    );
  }
}
