A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## How to Run
```bash
flutter pub get
flutter run
```

# comp3130NewProject
New project with contents of w4 to w11 for remaining passing marks

Made By: Fazle Rahman;
Student ID: 47809663

# HabitFlow
### Description:
This is an application that users use to track their habits, like adding daily or weekly habits, for example like exercising, reading, meditating, or even smaller habits like drinking water. Users will be able to mark them as done each day, have a look into their daily streaks and progress and charts. 

[
### This application will be made in commits in the similar but proper way to the workshops.
]

## weekly Update 1 : [week 4]
got started on the project. Initialized the flutter project, and made sure the current dependencies are running properly and the bare bone project runs properly. 
outcome: The barebone project is running okay

## update 1.1 : [Week 5, task 1]
Updated lib/main.dart to getting started on the project. 
- Implemented the stateful `HabitsHome` widget 
- Replaced the default counter app with a clean `MaterialApp`
- Created a stateful widget called `HabitsHome` as the home screen
- Added a basic Scaffold with AppBar titled "HabitFlow"
- Added placeholder text in the body to represent future habit list

### Update 1.2: [Week 5, Task 2]
Added `uuid` dependency to `pubspec.yaml` and completed the `Habit` model.
- Added `uuid: ^4.5.3` to pubspec.yaml
- Ran `flutter pub get`
- Created full `Habit` model with ID generation, frequency enum, and `markCompletedToday()` helper method

**Why:**
UUID ensures each habit has a unique identifier (important for deletion and state management later). The model is designed to support streak tracking and completion history from the beginning.

### Update 1.3: [Week 5, Task 3]
Integrated `HabitList` widget into the main screen.
- Added import for `habit_list.dart` in `main.dart`
- Connected `HabitList` to the body of the Scaffold
- Used an empty list as placeholder for now

**Why:**
This allows to see the list UI immediately. I am following the workshop pattern of building UI components first, then connecting data later.

### Update 1.4: [Week 5, Task 4]
Hardcoded initial habits and connected them to the HabitList widget.
- Added `_habits` list in `_HabitsHomeState` with 4 sample habits
- Passed the list to `HabitList` widget
- Removed placeholder text

**Why:**
This follows the exact pattern from the Travel Expenses workshop (hardcoding expenses before connecting state management). It lets us see real data on screen immediately, making development and testing easier.

### Update 1.5: [Week 5, Task 5]
Improved HabitList UI with proper cards and printed habit names.
- Updated `HabitList` to use `Card` + `ListTile` layout
- Displayed habit name and frequency
- Removed simple text placeholders

**Why:**
Moving from basic text display to nice cards. It makes the app look more professional and user-friendly, similar to how we created `expense_item.dart` in the Travel Expenses project.

### Update 1.6: [Week 5, Task 6]
Added New Habit modal.
- Created `new_habit.dart` with form (TextField + Dropdown for frequency)
- Connected modal to + button
- Under addhabit, made it so that users can input name, daily/weekly frequency, then add it or cancel
- Added `_addHabit` method to state

**Why:**
This allows users to add habits dynamically, following the same pattern as the "Add Expense" modal in the Travel Expenses workshop.
__________________________________X_______________________________