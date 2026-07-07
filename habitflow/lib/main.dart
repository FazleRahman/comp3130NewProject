import 'package:flutter/material.dart';
import 'models/habit.dart';
import 'widgets/habit_list.dart';
import 'widgets/new_habit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HabitFlow',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const HabitsHome(),
    );
  }
}

class HabitsHome extends StatefulWidget {
  const HabitsHome({super.key});

  @override
  State<HabitsHome> createState() => _HabitsHomeState();
}

class _HabitsHomeState extends State<HabitsHome> {
  final List<Habit> _habits = [
    Habit(
      name: 'Drink Water',
      frequency: HabitFrequency.daily,
    ),
    Habit(
      name: 'Exercise 30 mins',
      frequency: HabitFrequency.daily,
    ),
    Habit(
      name: 'Read 20 pages',
      frequency: HabitFrequency.daily,
    ),
    Habit(
      name: 'Meditate',
      frequency: HabitFrequency.daily,
    ),
  ];

  void _openAddHabitOverlay() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => NewHabit(
        onSaveHabit: _addHabit,
      ),
    );
  }

  void _addHabit(Habit habit) {
    setState(() {
      _habits.add(habit);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HabitFlow'),
        actions: [
          IconButton(
            onPressed: _openAddHabitOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: HabitList(habits: _habits),
    );
  }
}