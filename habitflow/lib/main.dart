import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/habit_provider.dart';
import 'models/habit.dart';
import 'widgets/habit_list.dart';
import 'widgets/new_habit.dart';
import 'widgets/habit_chart.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => HabitProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HabitFlow',
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey, brightness: Brightness.dark),
      ),
      home: const HabitsHome(),
    );
  }
}

class HabitsHome extends StatelessWidget {
  const HabitsHome({super.key});

  @override
  Widget build(BuildContext context) {
    final habitProvider = Provider.of<HabitProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('HabitFlow')),
      body: Column(
        children: [
          HabitChart(habits: habitProvider.habits),
          Expanded(
            child: HabitList(
              habits: habitProvider.habits,
              onRemoveHabit: (habit) => habitProvider.removeHabit(habit.id),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (ctx) => NewHabit(
              onSaveHabit: (habit) => habitProvider.addHabit(habit),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}