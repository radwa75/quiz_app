import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/global.dart';

import '../widgets/subject_card.dart';
import 'Quiz.dart';

class SubChoice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 36, 125, 163),
            Color.fromARGB(255, 241, 221, 145),
            Color.fromARGB(255, 185, 207, 224),
          ],
        ),
      ),
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SafeArea(child:
              Text(
                'Subject Category',
                style: GoogleFonts.poppins(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
              ),
              
              const Padding(
                padding: EdgeInsets.all(10),
                child: Divider(
                  thickness: 0.9,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SubjectCard(
                    cardName: "Math",
                    imageLink: 'images/math.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizAppScreen(test: mathTest),
                        ),
                      );
                    },
                  ),
                  SubjectCard(
                    cardName: "history",
                    imageLink: 'images/history.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              QuizAppScreen(test: historyTest),
                        ),
                      );
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SubjectCard(
                    cardName: "Chemistry",
                    imageLink: 'images/chemistry.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              QuizAppScreen(test: chemistryTest),
                        ),
                      );
                    },
                  ),
                  SubjectCard(
                    cardName: "Sport",
                    imageLink: 'images/sport.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizAppScreen(
                            test: sportTest,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
