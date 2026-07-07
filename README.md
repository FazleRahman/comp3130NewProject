# comp3130NewProject
New project with contents of w4 to w11 for remaining passing marks

Made By: Fazle Rahman;
Student ID: 47809663

# HabitFlow
### Description:
This is an application that users use to track their habits, like adding daily or weekly habits, for example like exercising, reading, meditating, or even smaller habits like drinking water. Users will be able to mark them as done each day, have a look into their daily streaks and progress and charts. 

### This application will be made in commits in the similar but proper way to the workshops.

[
### This application will be made in commits in the similar but proper way to the workshops.
]

## weekly Update 1 : [week 4]
got started on the project. Initialized the flutter project, and made sure the current dependencies are running properly and the bare bone project runs properly. 
outcome: The barebone project is running okay

## update 1.1 : [Week 5, task 1]
Updated lib/main.dart to getting started on the project. 
- I implemented the stateful `HabitsHome` widget 
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

### Update 2.1: [Week 6, Task 1]
This task has already been completed as the last task for previous week. 

### Update 2.2: [Week 6, Task 2]
Improved habit cards with category icons and formatted dates.
- Added `formattedCreatedDate` getter and `icon` to Habit model
- Updated HabitList to display icons and better formatting
- Installed `intl` package for date formatting

**Why:**
This makes the UI more informative and visually appealing, matching the workshop's progression for better UX.

### Update 2.3: [Week 6, Task 3]
(Already completed in Week 5, Task 6)
- Added AppBar titled "HabitFlow"
- Included + IconButton that opens the New Habit modal
- This was done when implementing the add habit functionality.

### Update 2.4: [Week 6, task 4]
Extended New Habit modal with proper form fields.
- Added TextField for habit name
- Added Dropdown for frequency selection
- Added Save and Cancel buttons
- Improved layout with padding and spacing

**Why:**
This makes the modal functional and user-friendly, following the workshop pattern of building a proper input form before adding more complex features.

### Update 2.5: [Week 6, Task 5]
Added amount input field to New Habit modal.
- Added TextEditingController for amount
- Added TextField with $ prefix and number keyboard
- Updated dispose() method

**Why:**
This allows users to set target values for habits (optional for now), following the workshop pattern for better input UX.

### update 2.6: [Week 6, task 5 rework]
After completing it, I went in to check the application, and realized that the amount field has no use in my application. I was so in tune that I just continued with the tasks and put in amount field with '$'. Now i am planning on changing it up to a Target count field, example: amount of glasses drank throughout the day, or minutes spent exercising.
- Renamed field from "Amount" to "Target Count"
- Removed $ prefix (more suitable for habits)
- Kept it optional for flexibility

**Why:**
This allows users to set measurable goals, making the app more useful for quantifiable habits.

## Update 2.7: [Week 6, task 6]
Adding cancel button was already done in the previous week {Update 1.6}.

### Update 2.8: [Week 6, Task 7]
Added the date picker Widget next to the Target Count field in the New Habit modal.
- Wrapped Target Count TextField in `Expanded` inside a `Row` to fix "Row doesn’t constrain its children’s width" / unbounded width exception.
- Added `IconButton` with `Icons.calendar_today` for the date picker.
- Added live display of selected date below the row using formatted output.
- Added `intl` import and formatter for clean date display.

**Why:**  
This provides intuitive UX for associating a date with new habits (e.g., start date or target deadline). Using `Expanded` + `IconButton` (instead of another TextField) avoids layout crashes and follows best practices shown in the screenshots/workshop.

### Update 2.9: [Week 6, Task 8]
Coded the showDatePicker in a custom function to enable the DatePicker and linked the Icon Button onPressed.
- Enhanced `_openDatePicker()` with `helpText`, better `lastDate` (allows future), and robust async handling.
- Confirmed IconButton `onPressed: _openDatePicker` linkage.
- Added user-friendly tooltip and date formatting.

**Why:**  
This follows the workshop instruction exactly (custom function for reusability and clarity). Makes date selection reliable and polished.

### Update 2.10: [Week 6, Task 9]
This will however not print the value of the date when selected, edited code to capture that.
- Passed `_selectedDate` to Habit constructor in `_submitHabit()`
- Updated date display in form
- Enhanced cards (in habit_list.dart) to show date
- Tested printing all values of new habit

**Why:** Completes data capture for date selection.

### Update 2.11: [Week 6, Advanced Tasks]
1. Adding a dropdown to get values from the Category
2. Saving the habit to the list and making a card appear on the screen for the new habit.
- Added `HabitCategory` enum
- Added Dropdown in NewHabit form
- Updated model + saving + HabitList cards
- Full integration and testing

**Why:** Makes habits more organized.

__________________________________X_______________________________

### Update 3.1: [Week 7, Task 1]
This task has already been completed as the advanced task for previous week {week 6, advanced tasks}

### Update 3.2: [Week 7, Task 2]
Changed the text to upper case in the dropdown & display chosen category.
- Updated `onChanged` to print selected category in uppercase
- Ensured state updates correctly on selection

**Why:** Matches workshop requirement to see chosen value and handle state change.

### Update 3.3: [Week 7, Task 3]
Added error handling for empty text entry using AlertDialog.
- Enhanced `_submitHabit()` with validation + dialog
- Prevents saving without name

**Why:** Improves UX and matches workshop sample for invalid input handling.

### Update 3.4: [Week 7, Task 4 & 5]
Fixed HabitList call with onRemoveHabit callback + Dismissible support.
- Added `_removeHabit` method
- Passed `onRemoveHabit` to `HabitList`
- Enabled swipe-to-delete with SnackBar

**Why:** Completes the delete functionality without errors.

### Update 3.5: [Week 7, Task 6 and 7]
Put in theme and Styled the application & Added full Light + Dark theme support.
- Defined `lightTheme` and `darkTheme` in `MyApp`
- Used `ThemeMode.system` for auto switch
- Improved CardTheme for better alignment

**Why:** Matches workshop theming requirements and improves UX.

### Update 3.6: [Week 7, Final]
Added simple progress chart for habits.
- Basic bar chart showing completed days per habit
- Integrated into main screen
- Formatted such that chart is at top and cards are underneath (scrollable if many)

**Why:** Wraps up the app with visual progress as per workshop.

_______________________________X__________________________________

### Update 4.1: [Week 8] Added Provider Package + HabitProvider State Class
- Ran `flutter pub add provider`
- Created `lib/providers/habit_provider.dart` with `HabitProvider` class extending `ChangeNotifier`
- Added methods: `addHabit`, `removeHabit`, `markCompletedToday`
- Wrapped root app with `ChangeNotifierProvider`

**Why:** Centralizes application state for habits (add/remove/update) as required in Week 8 workshop.

### Update 4.2: [Week 8] Wrapped Main App with ChangeNotifierProvider + Updated Widgets
- Updated `main.dart` to use Provider at root
- Modified `HabitsHome`, `HabitList`, `NewHabit`, `HabitChart` to use `Provider.of` / `Consumer`
- Integrated streak tracking with `markCompletedToday`

**Why:** Allows widgets to access and modify shared state without prop drilling.

### Update 4.3: [Week 8] Added Confirmation Dialog + Polish
- Added delete confirmation dialog
- Improved error handling and UI feedback
- Tested full flow: add, mark done, delete

**Why:** Improves UX as per workshop suggestions.

_______________________________X__________________________________

### Update 5.1: [Week 9, Widget Tests]
Updated widget_test.dart to test main app with Provider.
- Wrapped test with ChangeNotifierProvider
- Basic smoke test for app launch

**Why:** Follows workshop pattern for widget testing.

### Update 5.2: [Week 9, Unit Tests]
Added unit tests for HabitProvider (add/remove habits).
- Created habit_provider_test.dart with multiple test cases
- Tested initial state, add, and remove

**Why:** Verifies core state management logic.

_______________________________X__________________________________

### Update 6.1: [Week 10] 
Firebase Setup
- Created Firebase project in console and enabled Email/Password Authentication
- Ran `flutter pub add firebase_core firebase_auth`
- Configured project with `flutterfire configure`
- Added necessary imports and initialization in `main.dart`

**Why:** Connects the app to Firebase backend for user authentication.

### Update 6.2: [Week 10] 
Login / Registration Screen
- Created `lib/screens/login_screen.dart` with email/password fields
- Implemented `_login()` and `_register()` methods using `FirebaseAuth`
- Added basic form handling and error printing for debugging

**Why:** Provides UI for users to register and log in as per workshop requirements.

### Update 6.3: [Week 10] 
Integration + Auth Flow
- Updated `main.dart` to check auth state and route to Login or Home
- Added StreamBuilder for real-time auth status
- Protected main app behind authentication
- Tested login/register flow

**Why:** Completes authentication integration. Users must log in to access the habit tracker.

### came across a lot of issues while putting forth the login screen;
Mistakenly removed theme toggle button, had to bring it back again (repeated previous task)
dependencies didn't match up, had to search them all separately and add them again.

### And I removed the floating button for 'add habit' icon, and put it on the bottom left like it generally comes with flutter because that looked better. 

___________________________X_____________________________
### Update 7.1: [Week 11] 
GitHub Actions CI for Flutter + Firebase
- Added `.github/workflows/flutter.yml` for automated builds
- Configured Firebase secrets in GitHub
    -Firebase token: by running 'firebase login:ci' locally
    -firebase broject id: from firebase console
- went to github>repo settings> secrets and variables> actions> 'New Repository Secret
- APK build on push/PR

**Why:** Automates building and provides downloadable APK on GitHub.

**Issues & Solutions:**
- Firebase config in CI → Used `flutterfire configure` with secrets
- Secrets management → Followed workshop notes for `FIREBASE_TOKEN`

### Final Commit:
After the previous commit, everything is running properly, and the build tests in github returned okay.