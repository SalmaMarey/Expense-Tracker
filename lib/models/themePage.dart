// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:flutter/scheduler.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 28, 28, 28),
    // backgroundColor: Colors.black,
    primaryColor: Colors.black,
    colorScheme: const ColorScheme.dark(),
    iconTheme: const IconThemeData(
      color: Color.fromARGB(255, 153, 89, 244),
    ),
    indicatorColor: Colors.white,
    appBarTheme: const AppBarTheme(color: Color.fromARGB(255, 55, 55, 55)),
    // bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //     backgroundColor: Color.fromARGB(255, 55, 55, 55)),
  );

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      // backgroundColor: Colors.white,
      primaryColor: Colors.white,
      indicatorColor: Colors.black,
      colorScheme: const ColorScheme.light(),
      iconTheme: const IconThemeData(
        color: Color.fromARGB(255, 153, 89, 244),
      ),
      appBarTheme: const AppBarTheme(color: Color.fromARGB(255, 153, 89, 244)));
}
