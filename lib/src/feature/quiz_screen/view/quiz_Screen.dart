import 'package:flutter/material.dart';
import 'package:possy_app/src/feature/quiz_screen/view/quiz_Body/quiz_body.dart';
import 'package:possy_app/src/feature/quiz_screen/view/quiz_Header/quizHeader.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Color(0xffFDE8F4),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuizeHeader(textTheme: textTheme),
          Expanded(child: QuizBody()),
        ],
      ),
    );
  }
}
