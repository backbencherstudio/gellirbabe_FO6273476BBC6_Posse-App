class CountdownState {
  final int totalDays;
  final DateTime startDate;

  CountdownState({required this.totalDays, required this.startDate});

  int get daysPassed =>
      DateTime.now().difference(startDate).inDays.clamp(0, totalDays);

  int get remainingDays => (totalDays - daysPassed).clamp(0, totalDays);

  double get progress => daysPassed / totalDays;

  String get label => '${remainingDays}d';
}
