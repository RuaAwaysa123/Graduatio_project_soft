import 'package:flutter/foundation.dart';

class UserProfileProvider with ChangeNotifier {
  // Example properties and methods
  String _userName = "John Doe";
  bool _isDarkMode = false;

  String get userName => _userName;

  set userName(String name) {
    _userName = name;
    notifyListeners(); // Notify listeners when the username changes
  }

  bool get isDarkMode => _isDarkMode;

  set isDarkMode(bool darkMode) {
    _isDarkMode = darkMode;
    notifyListeners(); // Notify listeners when the theme mode changes
  }

  // Add other properties and methods as needed

  // Example methods for changing values
  void changeUsername(String newName) {
    userName = newName;
  }

  void toggleDarkMode() {
    isDarkMode = !isDarkMode;
  }
}
