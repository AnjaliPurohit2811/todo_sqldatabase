
# TODO Application

This TODO application is built using Flutter and an SQL database. It allows users to add, update, read, and delete tasks, with each task having a priority level (high, medium, low).

## Features

- Add new tasks with priority levels.
- Update existing tasks.
- View a list of all tasks.
- Delete tasks.
- Filter tasks based on priority.

## Installation

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Dart SDK: Included with Flutter
- SQLite Database: Integrated with Flutter using the `sqflite` package

### Steps

1. Clone the repository:

   ```sh
   git clone https://github.com/yourusername/todo-app.git
   cd todo-app
   ```

2. Install dependencies:

   ```sh
   flutter pub get
   ```

3. Run the application:

   ```sh
   flutter run
   ```

## Project Structure

```
lib/
|- screens/       
|- services/      
|- widgets/        
|- main.dart        
```

## Usage

1. **Add a Task**:
   - Tap the 'Add Task' button.
   - Enter the task details and select the priority level.
   - Tap 'Save' to add the task.

2. **Update a Task**:
   - Tap on a task from the list.
   - Modify the task details or change the priority level.
   - Tap 'Update' to save changes.

3. **Delete a Task**:
   - Swipe left on a task in the list to delete it.

4. **Filter Tasks**:
   - Use the filter options to view tasks by priority.

## Dependencies

- [sqflite](https://pub.dev/packages/sqflite): SQLite plugin for Flutter
- [path_provider](https://pub.dev/packages/path_provider): Provides paths to store database files
- [flutter_slidable](https://pub.dev/packages/flutter_slidable): For swipe actions on list items

## Videos


https://github.com/user-attachments/assets/025815c5-3373-4975-be8e-741d6f6692e4




