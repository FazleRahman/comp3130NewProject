import 'package:uuid/uuid.dart';

const _uuid = Uuid();

enum HabitFrequency { daily, weekly }

class Habit {
  final String id;
  final String name;
  final HabitFrequency frequency;
  final DateTime createdAt;
  final List<DateTime> completedDates; // To track history

  Habit({
    required this.name,
    required this.frequency,
    DateTime? createdAt,
    List<DateTime>? completedDates,
  })  : id = _uuid.v4(),
        createdAt = createdAt ?? DateTime.now(),
        completedDates = completedDates ?? [];

  // Helper method to mark habit as done today
  Habit markCompletedToday() {
    final today = DateTime.now();
    final alreadyCompletedToday = completedDates.any((date) =>
        date.year == today.year &&
        date.month == today.month &&
        date.day == today.day);

    if (alreadyCompletedToday) return this;

    return Habit(
      name: name,
      frequency: frequency,
      createdAt: createdAt,
      completedDates: [...completedDates, today],
    );
  }
}