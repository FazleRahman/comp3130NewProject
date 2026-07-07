import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:habitflow/main.dart';
import 'package:habitflow/providers/habit_provider.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  testWidgets('HabitFlow app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => HabitProvider(),
        child: MaterialApp(
          home: AuthWrapper(
            toggleTheme: () {},
            authStateChanges: Stream<User?>.value(null),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle(const Duration(seconds: 2));

    expect(find.text('HabitFlow'), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
  });
}