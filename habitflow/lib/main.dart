import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'providers/habit_provider.dart';
import 'screens/login_screen.dart';
import 'widgets/habit_list.dart';
import 'widgets/new_habit.dart';
import 'widgets/habit_chart.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HabitProvider()),
      ],
      child: MaterialApp(
        title: 'HabitFlow',
        theme: ThemeData.light().copyWith(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
          cardTheme: const CardThemeData(color: Colors.white, elevation: 4),
        ),
        darkTheme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey, brightness: Brightness.dark),
          scaffoldBackgroundColor: const Color(0xFF121212),
          cardTheme: const CardThemeData(color: Color(0xFF1E1E1E), elevation: 4),
        ),
        themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
        home: AuthWrapper(toggleTheme: _toggleTheme),
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  final VoidCallback toggleTheme;

  const AuthWrapper({super.key, required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HabitsHome(toggleTheme: toggleTheme);
        }
        return const LoginScreen();
      },
    );
  }
}

class HabitsHome extends StatelessWidget {
  final VoidCallback toggleTheme;

  const HabitsHome({super.key, required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    final habitProvider = Provider.of<HabitProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('HabitFlow'),
        actions: [
          IconButton(
            icon: Icon(
              Theme.of(context).brightness == Brightness.dark 
                  ? Icons.light_mode 
                  : Icons.dark_mode,
            ),
            onPressed: toggleTheme,
            tooltip: 'Toggle Theme',
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
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
              onSaveHabit: habitProvider.addHabit,
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}