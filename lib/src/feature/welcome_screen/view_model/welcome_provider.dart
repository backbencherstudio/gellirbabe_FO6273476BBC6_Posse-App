import 'package:flutter_riverpod/flutter_riverpod.dart';

// A provider that holds the current index of the welcome screen
final welcomeScreenIndexProvider = StateProvider<int>((ref) => 0);
final titles = ['What is MyPosse About?', 'How it Works', 'Let\'s Begin'];
final question = [
  'What is a Posse?',
  'What does a Posse do?',
  'Ready to Connect?',
];

final descriptions = [
  'A Posse is your inner circle of family or friends—sharing weekly rituals, emotional check-ins, and reflections that help you grow closer over time.',
  'Every week, your inner circle answers one Anchor Question—you only unlock everyone’s answers once you’ve shared yours. Stay connected with daily mood check-ins, a weekly vibe check, and quizzes where you compete to see who knows who best.',
  'Invite your friends or family to MyPosse and dive into your very first Anchor Question together.',
];