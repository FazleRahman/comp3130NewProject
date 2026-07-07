import 'package:flutter/material.dart';
import '../models/habit.dart';

class HabitProvider with ChangeNotifier {
  final List<Habit> _habits = [
    Habit(name: 'Exercise 30 mins', frequency: HabitFrequency.daily),
    Habit(name: 'Read 20 pages', frequency: HabitFrequency.daily),
    Habit(name: 'Meditate', frequency: HabitFrequency.daily),
  ];

  List<Habit> get habits => [..._habits];

  void addHabit(Habit habit) {
    _habits.add(habit);
    notifyListeners();
  }

  void removeHabit(String id) {
    _habits.removeWhere((habit) => habit.id == id);
    notifyListeners();
  }

  // Streak Tracking - Fixed
  void markCompletedToday(String id) {
    final index = _habits.indexWhere((habit) => habit.id == id);
    if (index != -1) {
      _habits[index] = _habits[index].markCompletedToday();
      notifyListeners();
    }
  }
}