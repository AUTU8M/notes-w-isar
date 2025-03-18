import 'package:flutter/material.dart';

//light mode

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade300,
    primary: Colors.grey.shade200,
    secondary: Colors.grey.shade800,
    inversePrimary: Colors.grey.shade800,
  ),
);

//Dark mode

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade900,
    primary: const Color.fromARGB(255, 43, 41, 41),
    secondary: const Color.fromARGB(255, 44, 39, 39),
    inversePrimary: Colors.grey.shade300,
  ),
);
