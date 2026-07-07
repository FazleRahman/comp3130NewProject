import 'package:flutter/material.dart';
import '../models/habit.dart';

class NewHabit extends StatefulWidget {
  final void Function(Habit habit) onSaveHabit;

  const NewHabit({super.key, required this.onSaveHabit});

  @override
  State<NewHabit> createState() => _NewHabitState();
}

class _NewHabitState extends State<NewHabit> {
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();

  HabitFrequency _selectedFrequency = HabitFrequency.daily;

  void _submitHabit() {
    if (_nameController.text.trim().isEmpty) {
      return;
    }

    final newHabit = Habit(
      name: _nameController.text.trim(),
      frequency: _selectedFrequency,
    );

    widget.onSaveHabit(newHabit);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Add New Habit',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Habit Name',
              border: OutlineInputBorder(),
            ),
            textCapitalization: TextCapitalization.sentences,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Target Amount (Optional)',
              border: OutlineInputBorder(),
              prefixText: '\$ ',
            ),
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<HabitFrequency>(
            value: _selectedFrequency,
            decoration: const InputDecoration(
              labelText: 'Frequency',
              border: OutlineInputBorder(),
            ),
            items: HabitFrequency.values.map((freq) {
              return DropdownMenuItem(
                value: freq,
                child: Text(freq.toString().split('.').last.toUpperCase()),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() => _selectedFrequency = value);
              }
            },
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: _submitHabit,
                child: const Text('Add Habit'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}