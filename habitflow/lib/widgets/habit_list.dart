import 'package:flutter/material.dart';
import '../models/habit.dart';

class HabitList extends StatelessWidget {
  final List<Habit> habits;

  const HabitList({
    super.key,
    required this.habits,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: habits.length,
      itemBuilder: (context, index) {
        final habit = habits[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
          child: ListTile(
            title: Text(
              habit.name,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            subtitle: Text(
              habit.frequency.toString().split('.').last.toUpperCase(),
            ),
            trailing: const Icon(Icons.check_circle_outline),
          ),
        );
      },
    );
  }
}