import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:possy_app/src/feature/parents_screens/riverpod_model/calender_provider.dart';

class HighlightedCalendar extends ConsumerWidget {
  const HighlightedCalendar({super.key});

  bool isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  String getMonthYear(DateTime date) {
    return '${_monthName(date.month)} ${date.year}';
  }

  String _monthName(int month) {
    const months = [
      '',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDay = ref.watch(selectedDayProvider);
    final focusedDay = ref.watch(focusedDayProvider);
    final highlightedDates = ref.watch(highlightedDatesProvider);

    return SizedBox(
      height: 380,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(12),
        child: TableCalendar(
          firstDay: DateTime(2020),
          lastDay: DateTime(2030),
          focusedDay: focusedDay,
          selectedDayPredicate:
              (day) => isSameDay(selectedDay ?? DateTime.now(), day),
          onDaySelected: (selected, focused) {
            ref.read(selectedDayProvider.notifier).state = selected;
            ref.read(focusedDayProvider.notifier).state = focused;
          },
          calendarStyle: CalendarStyle(
            outsideDaysVisible: false,
            isTodayHighlighted: false,
            selectedDecoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            defaultTextStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            weekendTextStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          headerStyle: HeaderStyle(
            titleCentered: false,
            formatButtonVisible: false,
            titleTextStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            leftChevronVisible: false,
            rightChevronVisible: false,
          ),
          daysOfWeekStyle: const DaysOfWeekStyle(
            weekdayStyle: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            weekendStyle: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          calendarBuilders: CalendarBuilders(
            headerTitleBuilder: (context, date) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        getMonthYear(date),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.expand_more,
                        size: 20,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.chevron_left,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          final previousMonth = DateTime(
                            date.year,
                            date.month - 1,
                          );
                          ref.read(focusedDayProvider.notifier).state =
                              previousMonth;
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.chevron_right,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          final nextMonth = DateTime(date.year, date.month + 1);
                          ref.read(focusedDayProvider.notifier).state =
                              nextMonth;
                        },
                      ),
                    ],
                  ),
                ],
              );
            },
            defaultBuilder: (context, day, _) {
              final isHighlighted = highlightedDates.any(
                (d) => isSameDay(d, day),
              );
              if (isHighlighted) {
                return Center(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    width: 36,
                    height: 36,
                    alignment: Alignment.center,
                    child: Text(
                      '${day.day}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              }
              return null;
            },
          ),
        ),
      ),
    );
  }
}
