import 'package:flutter/material.dart';

final theme = ThemeData(
    primaryColor: Colors.deepPurple,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(foregroundColor: Colors.white),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 25, vertical: 15))),
    ),
    iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(iconColor: MaterialStatePropertyAll(Colors.white))));
