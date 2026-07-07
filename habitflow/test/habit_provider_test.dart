import 'package:flutter_test/flutter_test.dart';
import 'package:habitflow/providers/habit_provider.dart';
import 'package:habitflow/models/habit.dart';

void main() {
  group('HabitProvider Tests', () {
    late HabitProvider provider;

    setUp(() {
      provider = HabitProvider();
    });

    test('Initial habits are loaded', () {
      expect(provider.habits.length, greaterThan(0));
    });

    test('Add habit works', () {
      final newHabit = Habit(name: 'Test Habit', frequency: HabitFrequency.daily);
      provider.addHabit(newHabit);
      expect(provider.habits.length, greaterThan(2));
      expect(provider.habits.last.name, 'Test Habit');
    });

    test('Remove habit works', () {
      final initialLength = provider.habits.length;
      final id = provider.habits.first.id;
      provider.removeHabit(id);
      expect(provider.habits.length, equals(initialLength - 1));
    });
  });
}