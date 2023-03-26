import 'package:flutter/material.dart';
import 'constants.dart';
import 'input_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI CALCULATOR',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(color: kAppThemeColor),
          scaffoldBackgroundColor: kAppThemeColor,
          textTheme:
              const TextTheme(bodyMedium: TextStyle(color: Colors.white))),
      home: const InputScreen(),
      
      
    );
  }
}
