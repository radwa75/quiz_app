// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quiz_app/screens/quiz.dart';
import 'package:quiz_app/screens/result.dart';
import 'package:quiz_app/screens/signin.dart';
import 'package:quiz_app/screens/splash_screen.dart';

import 'screens/sub_choice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
        home: SplashScreen(),
        routes: {
          'spalsh': (context) => SplashScreen(),
          'login': (context) => LoginScreen(),
          'category': (context) => SubChoice(),
          'quiz': (context) => QuizAppScreen(),
          'result': (context) => ResultScreen(),
        });
  }
}
