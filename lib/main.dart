import 'package:flutter/material.dart';
import 'package:trackerapp/widgets/expenses.dart';

// this is chacnge color and setting in all applicatino

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 234, 21, 230)
  );

var kDartColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 81, 6, 80)
);

void main() {

  runApp(
    MaterialApp(

      // this all setting dart color change with system
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDartColorScheme,

        cardTheme: const CardTheme().copyWith(
            color: kDartColorScheme.secondaryContainer,
            margin: const EdgeInsets.all(16),
          ),

          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: kDartColorScheme.primaryContainer,
                foregroundColor: kDartColorScheme.onPrimaryContainer,
              ),
            ),

      ),
      theme:
        ThemeData(
          useMaterial3: true,
        ).copyWith(
          colorScheme: kColorScheme,
          // set up to appbar 
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer
          ),
          // set upt card View in hole application 
          cardTheme: const CardTheme().copyWith(
            color: kColorScheme.secondaryContainer,
            margin: const EdgeInsets.all(16),
          ),

          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: kColorScheme.primaryContainer,
              ),
            ),
            textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kColorScheme.onSecondaryContainer,
                fontSize: 16,
                ),

            ),
        ),

        themeMode: ThemeMode.system,

      home: const Expenses(),
    )
  );
}
