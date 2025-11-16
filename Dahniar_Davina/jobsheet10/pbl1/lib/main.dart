import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'sc1.dart';
import 'sc2.dart';
import 'inherited_theme.dart';

void main() {
  runApp(ThemeApp());
}

// APLIKASI UTAMA
class ThemeApp extends StatefulWidget {
  @override
  _ThemeAppState createState() => _ThemeAppState();
}

class _ThemeAppState extends State<ThemeApp> {
  AppTheme appTheme = AppTheme();

  void toggleTheme() {
    setState(() {
      appTheme.isDarkMode = !appTheme.isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeInheritedWidget(
      appTheme: appTheme,
      toggleTheme: toggleTheme,
      child: MaterialApp(
        theme: appTheme.themeData,
        home: FirstScreen(),
        routes: {
          '/second': (context) => SecondScreen(),
        },
      ),
    );
  }
}