import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:possy_app/core/routes/route_name.dart';
import 'package:possy_app/src/feature/quiz_screen/view/quiz_Body/sub_widgets/custom_quiz_container.dart';
import 'package:possy_app/src/feature/quiz_screen/Riverpod/quiz_provider.dart';

class GridviewTile extends StatelessWidget {
  final bool iShowPeeps;
  const GridviewTile({super.key, required this.iShowPeeps});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final model = ref.watch(quizListProvider);

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 1.5,
          ),
          itemCount: model.length + 1,
          padding: const EdgeInsets.only(top: 10),
          itemBuilder: (context, index) {
            if (index == model.length) {
              return SizedBox(height: 100.h);
            }
            final view = model[index];
            return CustomQuizContainer(
              iShowPeeps: iShowPeeps, //suweeeeeeeeeeeeee
              color: view.color,
              text: view.title,
              textColor: Colors.white,
              onTap: () {
                context.push('${RouteName.quiztile}/$index');
              },
              img: view.img,
            );
          },
        );
      },
    );
  }
}
