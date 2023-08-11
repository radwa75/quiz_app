import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubjectCard extends StatelessWidget {
  final String cardName;
  final String imageLink;
  final void Function()? onTap;

  const SubjectCard(
      {super.key, required this.cardName, this.onTap, required this.imageLink});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 300,
      
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black, width: 1),
          // boxShadow: const [
          //   BoxShadow(
          //     color: Color.fromARGB(255, 250, 217, 118),
          //     blurRadius: 5.0, // soften the shadow
          //     spreadRadius: 2.0, //extend the shadow
          //     offset: Offset(
          //       4.0, // Move to right 5  horizontally
          //       4.0, // Move to bottom 5 Vertically
          //     ),
          //   )
          // ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Material(
                    child: Ink.image(
                      fit: BoxFit.scaleDown,
                      image: AssetImage(imageLink),
                      child: InkWell(
                        onTap: onTap,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
        cardName,
        textAlign: TextAlign.center,
      style:  GoogleFonts.montserrat( fontSize: 20, fontWeight: FontWeight.w900, color:  const Color.fromARGB(255, 0, 0, 0))),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}