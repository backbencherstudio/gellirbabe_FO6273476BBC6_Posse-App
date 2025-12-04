import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:possy_app/core/constant/icons.dart';
import 'package:possy_app/src/feature/parents_screens/view/widget/customNavbarItem.dart';
import 'package:possy_app/src/feature/parents_screens/view_Model/parents_screen_provider.dart';
import 'package:possy_app/src/feature/quiz_screen/Riverpod/one_lieftime_lockIn.dart';
import 'package:possy_app/src/feature/quiz_screen/view/widget/lockin_bottomSheet.dart';

class BottomNavBar extends StatelessWidget {
  const  BottomNavBar({super.key});

 @override
Widget build(BuildContext context) {
  return ClipRRect(
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    ),
    child: BottomAppBar(
      surfaceTintColor: Colors.transparent,
      elevation: 10,
      color: const Color(0xFFFFFFFF),
      shape: null,
      clipBehavior: Clip.antiAlias, // important for the curved effect
      child: SizedBox(
        height: 56,
        child: Consumer(
          builder: (_, ref, __) {
            final parentReadProvider = ref.read(parentsScreenProvider.notifier);
            final parentProvider = ref.watch(parentsScreenProvider);

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Consumer(
                  builder: (context,ref,_) {
                    final isLocked = ref.watch(isLockedIn);
                    return CustomBottomNavItem(
                      iconPath: AppIcons.quizIcon,
                      label: "Quiz",
                      onTap: (){ 
                      if(isLocked == true){
                      showLockInSheet(context);  

                      }
                      parentReadProvider.onSelectedIndex(0);},
                      isActive: parentProvider.selectedIndex == 0,
                      activeColor: const Color(0xffF075BD),
                      defaultColor: const Color(0xff777980),
                    );
                  }
                ),
                CustomBottomNavItem(
                  iconPath: AppIcons.scrapIcon,
                  label: "Journal",
                  onTap: () => parentReadProvider.onSelectedIndex(1),
                  isActive: parentProvider.selectedIndex == 1,
                  activeColor: const Color(0xff54BABC),
                  defaultColor: const Color(0xff777980),
                ),
                const Expanded(child: SizedBox()),
                CustomBottomNavItem(
                  iconPath: AppIcons.vibeCheck,
                  label: "Vibe Check",
                  onTap: () => parentReadProvider.onSelectedIndex(3),
                  isActive: parentProvider.selectedIndex == 3,
                  activeColor: const Color(0xff6A42C2),
                  defaultColor: const Color(0xff777980),
                ),
                CustomBottomNavItem(
                  iconPath: AppIcons.accountIcon,
                  label: "Profile",
                  onTap: () => parentReadProvider.onSelectedIndex(4),
                  isActive: parentProvider.selectedIndex == 4,
                  activeColor: const Color(0xffA888FD),
                  defaultColor: const Color(0xff777980),
                ),
              ],
            );
          },
        ),
      ),
    ),
  );
}
}