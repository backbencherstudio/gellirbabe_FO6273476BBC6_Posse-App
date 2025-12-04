import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../common_widget_style/common_widgets/spacer/auto_spacer.dart';
import '../../widget/account_section.dart';
import '../../widget/edit_profile_header.dart';
import '../../widget_list/widget_list.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  get textTheme => null;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Column(
        children: [
          EditProfileHeader(),
          AutoSpacer(space: 10.h),
          AccountSection(
            textTheme: textTheme,

            ///List of widget for all section
            widgetList: AccountWidgetList.editProfile(context),
          ),
        ],
      ),
    );
  }
}
