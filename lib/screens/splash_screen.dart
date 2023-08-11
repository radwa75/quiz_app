// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/screens/onbording.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const onboardingscreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Define the UI for the splash screen
    return  Scaffold(
       body: Container(
        
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 36, 125, 163),
              Color.fromARGB(255, 241, 221, 145),
              Color.fromARGB(255, 185, 207, 224),
            ],
          ),
        ),
      
       child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  child: Image.asset('images/logo4.png'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('This is quiz time!',
                    style: GoogleFonts.montserrat(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 39, 105, 192))),
                SizedBox(width: 10),
              ]),
        ),
    ));
    }
  }

