// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/screens/signin.dart';

import 'sub_choice.dart';




class onboardingscreen extends StatefulWidget {
  const onboardingscreen({super.key});

  @override
  State<onboardingscreen> createState() => _onboardingscreenState();
}

class _onboardingscreenState extends State<onboardingscreen> {
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 36, 125, 163),
              Color.fromARGB(255, 241, 221, 145),
              Color.fromARGB(255, 185, 207, 224),
            ],
          ),
        ), // set the background color to blue grey
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemBuilder: (context, index) => OnboardingContent(
                      image: demoData[index].image,
                      title: demoData[index].title,
                      description: demoData[index].description,
                    ),
                    itemCount: demoData.length,
                  ),
                ),
            
            // add the row with the buttons here
              Row(
                
            children: [
          
              Expanded(
                child: SizedBox(
                  height: 60,
                  width: 60,
                  child: ElevatedButton(
            onPressed: () {
              _pageController.previousPage(
                  curve: Curves.ease, duration: Duration(milliseconds: 200));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: const CircleBorder(),
            ),
            child: Icon(
              Icons.arrow_left,
              color: Colors.white,
            ),
                  ),
                ),
              ),
          
              
              SizedBox(
                height: 80,
                width: 80,
                child: ElevatedButton(
                  onPressed: () { Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LoginScreen()),
                                      // Form is valid, do something
                                    );},
                  style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: const CircleBorder(),
                  ),
                  child: Text(
            'skip',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
                  ),
                ),
              ),
            Expanded(
                child: SizedBox(
                  height: 60,
                  width: 60,
                  child: ElevatedButton(
    onPressed: () {
  _pageController.nextPage(
    curve: Curves.ease,
    duration: Duration(milliseconds: 200),
  
  );
  },

            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: const CircleBorder(),
            ),
            child: Icon(
              Icons.arrow_right,
              color: Colors.white,
            ),
                  ),
                ),
              ),
          
            ],
          )
              ]
              ),
          )
    )
    ));
  }
}

// class doindector extends StatelessWidget {
//   const doindector({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 12,
//       width: 4,
//       decoration: BoxDecoration(color: Colors.amber,
//       borderRadius:BorderRadius.all(Radius.circular(12))
//     ));
//   }
// }
class Onboard {
  final String image;
  final String title;
  final String description;

  Onboard({
    required this.image,
    required this.title,
    required this.description,
  });
}
final List<Onboard> demoData = [

  Onboard(
    image: "images/logo2.png",
    title: "it's quiz time....",
    description: "are you ready?",
  ),
  Onboard(
    image: "images/logo5.png",
    title: "You can now get started!",
    description: "Just before you start you should know that there are different categories of subjects and you have to choose to perform quiz any category of them.",
  ),
  Onboard(
    image: "images/logo6.png",
    title: "Good luck ",
    description: "In the end you will be able to determine the extent of your understanding and performance.",
  ),
];
class OnboardingContent extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: SafeArea(
          
          child: Center(
            child: Column(
              
              children: [
                const Spacer(),
                Image.asset(
                  image,
                  height: 250,
                ),
                
                Text(
        title,
        textAlign: TextAlign.center,
      style:  GoogleFonts.montserrat( fontSize: 20, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 39, 105, 192))),
      
            const SizedBox(
                  height: 10,
                ),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style:  GoogleFonts.montserrat( fontSize: 10, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 5, 5, 5))),
                
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
