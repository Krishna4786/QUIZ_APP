import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,
      {super.key}); // "startquiz" is a positional argument(we can use any name for this)          // "startquiz" will be used to call the function "switchscreen" in the "quiz" file .

  final void Function()
      startQuiz; //  "void Fucntion()" is the special type of the positioal argument that we have written and it also show that in "startquiz" we have stored a function

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/quiz-logo.png',
              width: 300,
              color: Color.fromARGB(150, 255, 255,
                  255)), // this is used to set the opacity of the picture
          SizedBox(height: 50),
          Text(
            'learn Flutter in the fun way!',
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 219, 202, 202),
              fontSize: 24,
            ),
          ),
          SizedBox(height: 25),
          OutlinedButton.icon(
            // we have used ".icon" becz in this we are going to use icons
            onPressed:
                startQuiz, // this function will only be executed when the button is pressed.
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('start Quiz'), // label means non icon content
          )
        ],
      ),
    );
  }
}
