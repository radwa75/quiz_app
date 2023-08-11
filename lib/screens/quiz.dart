// ignore_for_file: prefer_const_literals_to_create_immutables, unused_field, dead_code
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/screens/result.dart';

import '../global.dart';
import 'sub_choice.dart';

class QuizAppScreen extends StatefulWidget {
  QuizAppScreen({super.key, this.test});

  final List<Map<String, dynamic>>? test;

  @override
  State<QuizAppScreen> createState() => _QuizAppScreenState();
}

class _QuizAppScreenState extends State<QuizAppScreen> {
  bool _isDialogShowing = false;

  Future<bool> _onWillPop() async {
    if (_isDialogShowing) {
      return false;
    }
    _isDialogShowing = true;
    bool shouldExit = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Exit Quiz?'),
        content: Text('Are you sure you want to exit the quiz?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text('No'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => SubChoice()));
            },
            child: Text('Yes'),
          ),
        ],
      ),
    );
    _isDialogShowing = false;
    return shouldExit ?? false;
  }

  int score = 0;

  int index = 0;

  void totalScore(int score) {
    setState(() {
      score += score;
      index++;

      if (index == widget.test!.length) {
        // Navigate to the result screen when all questions have been answered
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ResultScreen(score: score, total: widget.test!.length),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle myTextStyle = GoogleFonts.openSans(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: _onWillPop,
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 212, 185, 102),
          elevation: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 80.0,
                    child: Image.asset('images/logo3.png'),
                  ),
                  SizedBox(width: 80),
                  Text(
                    'Question ${index + 1} / ${widget.test!.length}',
                    style: GoogleFonts.poppins(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 241, 238, 238),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              // Add any additional widgets to the right side of the app bar here
            ],
          ),
        ),
        

    body:
    Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 36, 125, 163),
              Color.fromARGB(255, 241, 221, 145),
            ],
          ),
        ),
        child: Center(
          child: Container(
            width: 400,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.test![index]['question'],
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 50),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: widget.test![index]['answers'].length,
                  itemBuilder: (BuildContext context, int i) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 29, 135, 196),
                        onPrimary: Color.fromRGBO(255, 253, 253, 1),
                        textStyle: myTextStyle,
                      ),
                      onPressed: () {
                        totalScore(widget.test![index]['answers'][i]['score']);
                      },
                      child: Text(widget.test![index]['answers'][i]['ans']),
                    );
                  },
                ),
                SizedBox(height: 30),
                // Text(
                //   'Score: $score',
                //   style:
                //       TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                // ),
              ],
            ),
          ),
        ))));
  }
}
