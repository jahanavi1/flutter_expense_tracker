import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_expense_tracker/expenses.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: Color.fromRGBO(172, 77, 192, 1.0));

var kDarkColorScheme =
ColorScheme.fromSeed(seedColor: Color.fromRGBO(35, 4, 42, 1.0));

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    runApp(
      MaterialApp(
        darkTheme: ThemeData.dark().copyWith(
            useMaterial3: true,
            colorScheme: kDarkColorScheme,
            appBarTheme: const AppBarTheme().copyWith(
                backgroundColor: kDarkColorScheme.onPrimaryContainer,
                foregroundColor: kDarkColorScheme.primaryContainer),
            cardTheme: const CardTheme().copyWith(
                color: kDarkColorScheme.secondaryContainer,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                elevation: 1),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: kDarkColorScheme.primaryContainer),
            ),
            textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kDarkColorScheme.onSecondaryContainer,
                  fontSize: 16),
            )),


        theme: ThemeData().copyWith(
            useMaterial3: true,
            colorScheme: kColorScheme,
            appBarTheme: const AppBarTheme().copyWith(
                backgroundColor: kColorScheme.onPrimaryContainer,
                foregroundColor: kColorScheme.primaryContainer),
            cardTheme: const CardTheme().copyWith(
                color: kColorScheme.secondaryContainer,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                elevation: 1),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: kColorScheme.primaryContainer),
            ),
            textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kColorScheme.onSecondaryContainer,
                  fontSize: 16),
            )),
        // themeMode:  ThemeMode.system,
        home: const Expenses(),
      ),
    );
  });

}
