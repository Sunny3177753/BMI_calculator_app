import 'package:flutter/material.dart';
import 'colors.dart';
import 'home_page.dart';

void main() => runApp(BMICalculatorApp());

class BMICalculatorApp extends StatefulWidget {
  const BMICalculatorApp({super.key});

  @override
  State<BMICalculatorApp> createState() => _BMICalculatorAppState();
}

class _BMICalculatorAppState extends State<BMICalculatorApp> {
  bool isDark = false;

  void toggleTheme() {
    setState(() {
      isDark = !isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      themeAnimationDuration: Duration(milliseconds: 1000),

      theme: ThemeData(
        brightness: Brightness.light,
        //textSelectionTheme: TextSelectionThemeData(selectionColor: Colors.blue),
        scaffoldBackgroundColor: darkBlueColor,
        appBarTheme: AppBarTheme(color: backgroundColor),
      ),

      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
          appBarTheme: AppBarTheme(color: backgroundColor)
      ),

      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,

      home: HomePage(isDark: isDark,toggleTheme: toggleTheme,),
    );
  }
}
