import 'package:flutter/material.dart';

const white = Color(0xFFFFFFFF);
const black = Color(0xFF000000);

const lockBGLinear = LinearGradient(
  colors: [
    Color(0xFF292C31),
    Color(0xFF000000),
    Color(0xFF000000),
    Color(0xFF292929)
  ],
  // stops: [0.2, 1],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
const buttonBGLinear = LinearGradient(
  colors: [
    Color(0xFF5D6167),
    Color(0xFF13151A),
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

var themeData = ThemeData.dark().copyWith(
  primaryColor: black,
  scaffoldBackgroundColor: black,
  brightness: Brightness.light,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: black,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    foregroundColor: black,
    centerTitle: true,
    iconTheme: IconThemeData(color: black),
  ),
  tabBarTheme: const TabBarTheme(labelColor: black),
);
