import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:google_fonts/google_fonts.dart';

alertAnimated(BuildContext context) {
  //AQUI ESTA SENDO CHAMDNO COMO METODO
  showAnimatedDialog(
    barrierColor: const Color.fromARGB(164, 95, 93, 166),
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: const Color(0xFF5F5DA6),
        icon: const Icon(
          Icons.person_pin_rounded,
          size: 60,
        ),
        title: Text('Perssonalidade',
            style: GoogleFonts.fredoka(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white))),
        content: Text(
            "Uma Seleção Exclusiva de Avatar para te melhor representa sua perssonalidade. Araste para baixo e escolha e que melhor te define!",
            textAlign: TextAlign.center,
            style: GoogleFonts.fredoka(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 19,
                    color: Colors.white))),
        actions: [
          Align(
            alignment: Alignment.center,
            child: MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('ok',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.fredoka(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 30,
                          color: Colors.white))),
            ),
          ),
        ],
      );
    },
    animationType: DialogTransitionType.slideFromTop,
    curve: Curves.fastOutSlowIn,
    duration: const Duration(milliseconds: 400),
  );
}
