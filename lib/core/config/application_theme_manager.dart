import 'package:flutter/material.dart';

class ApplicationThemeManager {
  static ThemeData applicationThemeData = ThemeData(
    primaryColor: const Color(0xFF39A552),
    appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF39A552),
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        )),
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 35,
        )),
    textTheme: TextTheme(
        titleLarge: TextStyle(
            fontFamily: "Exo",
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white),
        bodyLarge: TextStyle(
            fontFamily: "Exo",
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white),
        bodyMedium: TextStyle(
            fontFamily: "Exo",
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Colors.white),
        bodySmall: TextStyle(
            fontFamily: "Exo",
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.white),
        displayLarge: TextStyle(
            fontFamily: "Exo",
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: Colors.white)),
    scaffoldBackgroundColor: Colors.transparent,
  );
}
