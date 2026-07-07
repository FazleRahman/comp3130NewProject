import 'package:flutter/material.dart';
import '../models/habit.dart';

class HabitList extends StatelessWidget {
  final List<Habit> habits;
  final Function(Habit) onRemoveHabit; // For dismissible

  const HabitList({
    super.key,
    required this.habits,
    required this.onRemoveHabit,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: habits.length,
      itemBuilder: (ctx, index) {
        final habit = habits[index];
        return Dismissible(
          key: Key(habit.id),
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            onRemoveHabit(habit);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${habit.name} removed'),
                duration: const Duration(seconds: 2),
              ),
            );
          },
          child: Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: Icon(habit.icon, color: Colors.teal),
              title: Text(habit.name),
              subtitle: Text(
                '${habit.frequency.toString().split('.').last.toUpperCase()} • '
                '${habit.category.toString().split('.').last.toUpperCase()} • '
                '${habit.formattedCreatedAt}',
              ),
              trailing: Text(
                habit.completedDates.isNotEmpty ? '${habit.completedDates.length} days' : '',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      },
    );
  }
}