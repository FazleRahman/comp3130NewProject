import 'package:flutter/material.dart';
import 'models/habit.dart';
import 'widgets/habit_list.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HabitFlow'),
      ),
      body: HabitList(habits: const []), // Placeholder for the habit list
    );
  }
}