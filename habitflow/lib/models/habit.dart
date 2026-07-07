import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const _uuid = Uuid();

enum HabitFrequency { daily, weekly }
enum HabitCategory { health, productivity, learning, mindfulness, other }

final formatter = DateFormat('dd-MM-yyyy');

class Habit {
  final String id;
  final String name;
  final HabitFrequency frequency;
  final HabitCategory category;
  final DateTime createdAt;
  final List<DateTime> completedDates;

  Habit({
    required this.name,
    required this.frequency,
    this.category = HabitCategory.other,
    DateTime? createdAt,
    List<DateTime>? completedDates,
  })  : id = _uuid.v4(),
        createdAt = createdAt ?? DateTime.now(),
        completedDates = completedDates ?? [];

  String get formattedCreatedAt => formatter.format(createdAt);

  IconData get icon {
    switch (frequency) {
      case HabitFrequency.daily:
        return Icons.calendar_today;
      case HabitFrequency.weekly:
        return Icons.calendar_view_week;
    }
  }

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
      category: category,
      createdAt: createdAt,
      completedDates: [...completedDates, today],
    );
  }
}