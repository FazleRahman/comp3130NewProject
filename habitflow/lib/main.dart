import 'package:flutter/material.dart';
import 'models/habit.dart';
import 'widgets/habit_list.dart';
import 'widgets/new_habit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HabitFlow',
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.light,
        ),
        cardTheme: const CardThemeData(
          color: Colors.white,
          elevation: 4,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.grey,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF121212),
        cardTheme: const CardThemeData(
          color: Color(0xFF1E1E1E),
          elevation: 4,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E1E1E),
          foregroundColor: Colors.white,
        ),
      ),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: HabitsHome(toggleTheme: _toggleTheme),
    );
  }
}

class HabitsHome extends StatefulWidget {
  final VoidCallback toggleTheme;

  const HabitsHome({super.key, required this.toggleTheme});

  @override
  State<HabitsHome> createState() => _HabitsHomeState();
}

class _HabitsHomeState extends State<HabitsHome> {
  final List<Habit> _habits = [
    Habit(name: 'Exercise 30 mins', frequency: HabitFrequency.daily),
    Habit(name: 'Read 20 pages', frequency: HabitFrequency.daily),
    Habit(name: 'Meditate', frequency: HabitFrequency.daily),
  ];

  void _openAddHabitOverlay() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => NewHabit(onSaveHabit: _addHabit),
    );
  }

  void _addHabit(Habit habit) {
    setState(() {
      _habits.add(habit);
    });
  }

  void _removeHabit(Habit habit) {
    setState(() {
      _habits.remove(habit);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HabitFlow'),
        actions: [
          IconButton(
            icon: Icon(widget.toggleTheme == null ? Icons.dark_mode : Icons.light_mode), // Simplified
            onPressed: widget.toggleTheme,
            tooltip: 'Toggle Theme',
          ),
          IconButton(
            onPressed: _openAddHabitOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: HabitList(
        habits: _habits,
        onRemoveHabit: _removeHabit,
      ),
    );
  }
}