import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light => ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: const OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFC9CBCB)),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFF9B99A7),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          isDense: true,
          filled: true,
          fillColor: const Color(0xFFF3F5FA),
        ),
      );
}
