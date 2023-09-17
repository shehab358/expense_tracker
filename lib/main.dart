import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));
var darkColor = ColorScheme.fromSeed(brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125));

void main() {
  runApp(
     MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: darkColor,
         appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: darkColor.onPrimaryContainer,
        foregroundColor: darkColor.primaryContainer,
      ),
        cardTheme : const CardTheme().copyWith(
        color: darkColor.secondaryContainer,
     
      ),
        elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: darkColor.primaryContainer,
          foregroundColor: darkColor.onPrimaryContainer
        ),
      ),
        
      ),
      theme: ThemeData().copyWith(useMaterial3: true ,
      colorScheme: kColorScheme,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: kColorScheme.onPrimaryContainer,
        foregroundColor: kColorScheme.primaryContainer,
      ),
      cardTheme : const CardTheme().copyWith(
        color: kColorScheme.secondaryContainer,
        
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kColorScheme.primaryContainer
        ),
      ),
      textTheme:  const TextTheme().copyWith(
        titleLarge:  TextStyle(
          fontWeight: FontWeight.normal,
          color: kColorScheme.onSecondaryContainer,
          fontSize: 18
        ),
      ),
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const Expenses()
    ),
  );
}