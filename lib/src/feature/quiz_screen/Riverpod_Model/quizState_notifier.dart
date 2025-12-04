import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:possy_app/core/constant/icons.dart';
import 'package:possy_app/src/model/quizs_model.dart';

class QuizstateNotifier extends StateNotifier<List<QuizsModel>> {
  QuizstateNotifier() : super(_initialList);

  static final List<QuizsModel> _initialList = [
    QuizsModel(
      title: "Family Vacations",
      img: AppIcons.tropical,
      color: Color(0xffA888FD),
    ),
    QuizsModel(
      title: "Favorite Foods",
      img: AppIcons.burgir,
      color: Color(0xffEDAA61),
    ),
    QuizsModel(
      title: "Music Mix",
      img: AppIcons.music,
      color: Color(0xff9EBA72),
    ),
    QuizsModel(title: "Fall Fun", img: AppIcons.tree, color: Color(0xff4ED5BD)),
    QuizsModel(
      title: "Road Trip",
      img: AppIcons.carz,
      color: Color(0xffF5A3D3),
    ),
    QuizsModel(
      title: "Childhood Toys",
      img: AppIcons.puppy,
      color: Color(0xffFAD33E),
    ),
    QuizsModel(
      title: "School Days",
      img: AppIcons.bag,
      color: Color(0xffEF6471),
    ),
    QuizsModel(
      title: "Game Night",
      img: AppIcons.puzzle,
      color: Color(0xff4A4C56),
    ),
  ];
}
