import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:expense_tracker/widgets/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 53, 31, 255)
  );
var darkColor = ColorScheme.fromSeed(brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 0, 95, 121));

void main() {
  runApp(
     MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
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
      textTheme: const TextTheme().copyWith(
        titleLarge: const TextStyle(
          fontWeight: FontWeight.normal,
          color: Colors.white,
          fontSize: 18,
        ),
      ),
        
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true ,
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
      textTheme: const TextTheme().copyWith(
        titleLarge: const TextStyle(
          fontWeight: FontWeight.normal,
          color: Colors.black,
          fontSize: 18,
        ),
      ),
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const Expenses()
    ),
  );
}