import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:habitflow/main.dart';
import 'package:habitflow/providers/habit_provider.dart';

void main() {
  testWidgets('HabitFlow app smoke test', (WidgetTester tester) async {
    // Build the app with Provider
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => HabitProvider(),
        child: const MyApp(),
      ),
    );

    // Verify app starts
    expect(find.text('HabitFlow'), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });
}